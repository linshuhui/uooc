from datetime import datetime

from django.db.models import Q, F
from django.shortcuts import render, redirect
from django.urls import reverse
from django.views import View
from pure_pagination import Paginator, PageNotAnInteger

from schoolapp import models
from userapp.models import StudentInfoToCourse


# Create your views here.
class CourseListView(View):

    def get(self, request):

        try:  # 防止输入异常抛错
            category_id = int(request.GET.get('category', 0))
            org_id = int(request.GET.get('org_id', 0))
            status = request.GET.get('status', '0')
            page = request.GET.get('page', 1)
            q = request.GET.get('q', '')
            order = request.GET.get('order', '')
        except Exception as e:
            category_id = 0
            org_id = 0
            page = 1
            q = ''
            order = ''

        school_list = models.School.objects.all()
        course_list = models.Course.objects.all()
        if q:
            # 实现课程的模糊搜索
            course_list = course_list.filter(
                Q(title__contains=q) | Q(school__name__contains=q) | Q(teacher__name__contains=q)).distinct()
            # 按照分类查找
        if category_id:
            course_list = course_list.filter(category=category_id)
            # 按照学校查找
        if org_id:
            course_list = course_list.filter(school_id=org_id)
            # 按照开课状态查找
        if status != '0':
            if status == 'pass':
                course_list = course_list.filter(start_time__gt=datetime.now())
            elif status == 'learn':
                course_list = course_list.filter(start_time__lte=datetime.now())
            # 排序方式
        if order:
            if order == 'hot':
                course_list = course_list.order_by('-total_student')
            elif order == 'newest':
                course_list = course_list.order_by('add_time')
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        all_courst_count = course_list.count()
        p = Paginator(course_list, 2, request=request)
        course_list = p.page(page)
        return render(request, 'course_list.html', {'category': models.CATEGORY, 'category_id': category_id,
                                                    'school_list': school_list, 'org_id': org_id, 'status': status,
                                                    'course_list': course_list, 'all_courst_count': all_courst_count,
                                                    'order': order
                                                    })


class OrgView(View):
    def get(self, request):
        school_list = models.School.objects.all()
        return render(request, 'org_list.html', {"school_list": school_list})


class AboutView(View):
    def get(self, request):
        return render(request, 'about.html')


class CourseView(View):
    def get(self, request, course_id):
        course = models.Course.objects.filter(id=course_id)[0]
        if request.user.is_authenticated:
            is_join = StudentInfoToCourse.objects.filter(course=course, student=request.user.studentinfo,
                                                         join_or_attention=1).exists()
        else:
            is_join = False
        return render(request, 'course.html', {'course': course, 'is_join': is_join})


class StudentAddCourse(View):
    def get(self, request, course_id):
        if not request.user.is_authenticated:
            return redirect(reverse('user:login'))
        status = request.GET.get('status')
        # 防止重复插入数据
        try:
            StudentInfoToCourse.objects.create(course_id=course_id, student=request.user.studentinfo,
                                               join_or_attention=int(status))

            if status == '1':
                models.Course.objects.filter(id=course_id).update(total_student=F('total_student') + 1)
            elif status == '2':
                models.Course.objects.filter(id=course_id).update(favorite_count=F('favorite_count') + 1)
        except:
            pass
        return redirect('/course/' + course_id)


class StudentDelCourse(View):
    def get(self, request):
        try:
            cid = request.GET.get('cid')
            type = request.GET.get('type')
            join_or_attention = 1
            if type == 'follow':
                join_or_attention = 2
            StudentInfoToCourse.objects.filter(student=request.user.studentinfo, course_id=int(cid),
                                               join_or_attention=join_or_attention).delete()
        except Exception as e:
            pass

        return redirect(reverse('user:home'))


def test(requset):
    return render(requset, 'test.html')
