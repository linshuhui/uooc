from datetime import datetime

from django.contrib.auth.models import AbstractUser
from django.core.validators import RegexValidator
from django.db import models

from schoolapp.models import Course, School
from uooc.settings import STATIC_URL

# Create your models here.

BANNER_POSITION = (
    (1, '顶部轮播图'),
    (2, '中部静态推广图')
)


class ExpendUser(AbstractUser):
    """
       拓展默认的user表，实现邮箱，手机号登陆
    """
    phone = models.CharField(max_length=11, null=False,
                             validators=[RegexValidator(regex='1[3-9]\d{9}', message='手机号码格式有误')])


class StudentInfo(models.Model):
    """
        学生详细信息表，在注册成功的时候自动生成
    """
    student_name = models.CharField(max_length=20, null=True, blank=True, default='未知')
    institute = models.CharField(max_length=40, null=True, blank=True, verbose_name='学院')
    profession = models.CharField(max_length=40, null=True, blank=True, verbose_name='专业')
    avatar = models.ImageField(null=True, upload_to='avatars/%Y/%m', blank=True,
                               default=STATIC_URL + 'img/user_default.jpg')
    course = models.ManyToManyField(to=Course, through="StudentInfoToCourse",
                                    through_fields=("student", "course"))  # 关注的课程
    user = models.OneToOneField(ExpendUser)
    school = models.ForeignKey(School, default=1)

    def __str__(self):
        return self.student_name

    class Meta:
        verbose_name = '学生信息表'
        verbose_name_plural = verbose_name


class StudentInfoToCourse(models.Model):
    """自定义课程和学生多对多第三张表，增加是否是关注还是学习判断的字段"""
    course = models.ForeignKey(Course)
    student = models.ForeignKey(StudentInfo)
    join_or_attention = models.IntegerField(choices=((1, '学习过'), (2, '关注')))

    def __str__(self):
        return str(self.course) + str(self.student)

    class Meta:
        unique_together = ("course", 'student', 'join_or_attention')
        verbose_name = '学习选课表'
        verbose_name_plural = verbose_name


class Message(models.Model):
    content = models.CharField(max_length=200, null=False)
    send_from = models.CharField(max_length=40, null=False)
    send_type = models.CharField(choices=(('register', '注册'), ('forget', '找回密码')), max_length=10)
    send_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')


class Banner(models.Model):
    alt = models.CharField(max_length=40, null=True, blank=True)
    course = models.ForeignKey(Course, null=False, default=None)
    add_time = models.DateTimeField(default=datetime.now, verbose_name='增加时间')
    is_display = models.BooleanField(default=0)
    position = models.IntegerField(choices=BANNER_POSITION, default=1, null=True, blank=True)
    bodyBannerImage = models.ImageField(upload_to='course/%Y/%m', null=True)

    def __str__(self):
        return self.course.title

    class Meta:
        verbose_name = '轮播图'
        verbose_name_plural = verbose_name
