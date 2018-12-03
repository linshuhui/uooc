import datetime
import json

from django.conf import settings
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.backends import ModelBackend
from django.db.models import Q
from django.shortcuts import render, HttpResponse, redirect
from django.views import View

from apps.utlis import vcode
from schoolapp.models import Category, Course
from uooc.settings import BANNER_NUM
from userapp.forms import RegisterForm, StudentMsgForm
from userapp.models import Banner, ExpendUser, StudentInfo, StudentInfoToCourse


class UserBackend(ModelBackend):
    def authenticate(self, request, username=None, password=None, **kwargs):
        try:
            user = ExpendUser.objects.get(Q(username=username) | Q(email=username) | Q(phone=username))
            if user.check_password(password):
                return user
        except Exception as e:
            return


class LoginView(View):
    def get(self, request):
        return render(request, 'login.html')

    def post(self, request):
        form_code = request.POST.get('code', None)
        correct_code = request.session.get('code')
        username = request.POST['username']
        if str(form_code).lower() == str(correct_code).lower():
            user = authenticate(username=username, password=request.POST['password'])
            if user:
                login(request, user)
                return redirect('/')
            else:
                error_msg = '账号或者密码错误'

        else:
            error_msg = '验证码错误'
        return render(request, 'login.html', {'error_msg': error_msg, 'username': username})


class RegisterView(View):

    def get(self, request):
        form_obj = RegisterForm()
        return render(request, 'register.html', {'form_obj': form_obj})

    def post(self, request):
        form_obj = RegisterForm(request.POST)
        form_code = request.POST.get('code', None)
        correct_code = request.session.get('code')
        error_msg = ''
        if str(form_code).lower() == str(correct_code).lower():
            if form_obj.is_valid():
                # 删除不必要的数据，保留用于创建用户的数据
                form_obj.cleaned_data.pop('re_password')
                ExpendUser.objects.create_user(**form_obj.cleaned_data)
                user_obj = ExpendUser.objects.filter(username=request.POST['username'])[0]
                StudentInfo.objects.create(user=user_obj)
                return redirect('/')

        else:
            error_msg = '验证码错误'
        return render(request, 'register.html', {'form_obj': form_obj, 'error_msg': error_msg})


class IndexView(View):
    def get(self, request):
        banner_obj_list = Banner.objects.filter(is_display=1, position=1)[:BANNER_NUM]
        bodyBanner_list = Banner.objects.filter(is_display=1, position=2)[:BANNER_NUM]
        recommendCourse = Course.objects.all().order_by('total_student')[:settings.RECOMENT_COURSE_NUMBER]
        all_category_list = Category.objects.all()
        display_category_list = Category.objects.filter(is_display=1)
        if request.user.is_authenticated():
            avatar = '/media/' + str(request.user.studentinfo.avatar)
            stu_name = request.user.studentinfo.student_name
        else:
            avatar = '/static/img/mascot.png'
            stu_name = ''
        return render(request, 'index.html', {'banner_obj_list': banner_obj_list,
                                              'avatar': avatar, 'request': request,
                                              'stu_name': stu_name, 'all_category_list': all_category_list,
                                              'display_category_list': display_category_list,
                                              'recommendCourse': recommendCourse,
                                              'bodyBanner_list': bodyBanner_list

                                              })


class LogoutView(View):
    def get(self, requset):
        requset.session.flush()
        logout(requset)
        return redirect('/')


class HomeView(View):
    def get(self, request):
        course_type = request.GET.get('type', None)
        dt = datetime.datetime.now()
        # 获取学生加入过的课程ID
        join_course_id = StudentInfoToCourse.objects.filter(student=request.user.studentinfo,
                                                            join_or_attention=1).values(
            'course')
        # 获取学生关注过的课程ID
        follow_course_id = StudentInfoToCourse.objects.filter(student_id=request.user.studentinfo,
                                                              join_or_attention=2).values(
            'course')
        # 获取学生加入过的课程
        join_course_list = Course.objects.filter(id__in=join_course_id)
        # 获取学生关注过的课程
        follow_course_list = Course.objects.filter(id__in=follow_course_id)
        # 开课中的课程
        learning_course_list = join_course_list.filter(start_time__lte=dt, end_time__gte=dt)
        learning_count = learning_course_list.count()
        # 累计参加过的课程
        all_count = join_course_list.count()
        # 下面都是根据条件对展示课程进行特定的筛选
        if course_type == 'learn':
            join_course_list = learning_course_list
        elif course_type == 'nostart':
            join_course_list = join_course_list.filter(start_time__gt=dt)
        elif course_type == 'finish':
            join_course_list = join_course_list.filter(end_time__lt=dt)
        elif course_type == 'follow':
            join_course_list = follow_course_list
        return render(request, 'home.html',
                      {'request': request, 'course_list': join_course_list, 'follow_course_list': follow_course_list,
                       'learning_count': learning_count, 'all_count': all_count
                       })


class StudentMsgView(View):
    def get(self, request):
        form_obj = StudentMsgForm(instance=request.user.studentinfo)
        return render(request, 'student_msg.html', {'form_obj': form_obj})

    def post(self, request):
        code = request.POST.get('code')
        correct_code = request.session['code']
        form_obj = StudentMsgForm(request.POST, request.FILES, instance=request.user.studentinfo)

        if code.lower() == correct_code.lower():
            if form_obj.is_valid():
                form_obj.save()
                return redirect('/userapp/home')
            else:
                return render(request, 'student_msg.html', {'form_obj': form_obj})

        error_msg = '验证码错误'
        return render(request, 'student_msg.html', {'error_msg': error_msg, 'form_obj': form_obj})


def get_code(request):
    img, code = vcode.get_code_img_obj()
    request.session['code'] = code
    return HttpResponse(img, content_type='png')


def is_exit(request):
    if request.method == 'POST':
        # 判断是邮箱/手机/用户名,这里不用担心发生错误，因为能到这里的路劲都满足解析格式
        condition = request.path_info.split('/')[-2].split('_')[1]
        query = request.POST.get('query', None)
        if condition == 'username':
            result = ExpendUser.objects.filter(username=query)
        elif condition == 'email':
            result = ExpendUser.objects.filter(email=query)
        else:
            result = ExpendUser.objects.filter(phone=query)
        if result:
            return HttpResponse(json.dumps(True))
        else:
            return HttpResponse(json.dumps(False))

def page_not_exit(request):
    from django.shortcuts import render_to_response
    response = render_to_response('404.html', {})
    response.status_code = 404
    return response