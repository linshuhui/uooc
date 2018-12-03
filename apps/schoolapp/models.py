import datetime

from DjangoUeditor.models import UEditorField
from django.db import models

from uooc.settings import STATIC_URL

TEACHING_MOEDE = (
    (1, '自由模式'),
    (2, '闯关模式'),
)
LANGUAGE = (
    (1, '中文'),
    (2, '英文'),
    (3, '日语'),
    (4, '韩语'),
)
POSITION = (
    (1, '教授'),
    (2, '副教授'),
    (3, '讲师'),
    (4, '助教'),
)

# (序号，分类，关键词列表）
CATEGORY = (
    (1, '理学▪工学'),
    (2, '计算机'), (3, '教育▪语言'),
    (4, '文学▪艺术'), (5, '创业▪职场'), (6, '哲史▪文化'),
    (7, '经济▪管理'), (8, '医学▪农学'), (9, '心理学'),
    (10, '社会▪法律')
)


class Category(models.Model):
    name = models.CharField(max_length=20, null=False, unique=True)
    # 分类在主页展示的背景图
    titleBackgroundImgage = models.ImageField(upload_to='background/%Y/%m', null=True, blank=True)
    bodyBackgroundImgage = models.ImageField(upload_to='background/%Y/%m', null=True, blank=True)
    # 是否在主页显示
    is_display = models.BooleanField(default=0)
    # 图标
    icon = models.CharField(max_length=20, null=False, default='yisheng')

    class Meta:
        verbose_name = '分类表'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class Keyword(models.Model):
    keyword = models.CharField(max_length=20, null=False, unique=True)
    category = models.ForeignKey(Category, default='1')

    class Meta:
        verbose_name = '关键词表'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.keyword


class Course(models.Model):
    title = models.CharField(max_length=50, null=False)
    english_title = models.CharField(max_length=240, null=False)
    category = models.ForeignKey(Category, default=1)
    picture = models.ImageField(upload_to='course/%Y/%m', null=True, blank=True,default=STATIC_URL + 'img/user_default.jpg')
    introduction = UEditorField(verbose_name='课程详情', width=600, height=300, imagePath="course/ueditor",
                                filePath="course/ueditor",
                                default='')
    start_time = models.DateField(null=True, blank=True)
    end_time = models.DateField(null=True, blank=True)
    credit = models.IntegerField(null=False)
    teaching_mode = models.IntegerField(choices=TEACHING_MOEDE)
    period = models.IntegerField(null=True, blank=True)
    language = models.IntegerField(choices=LANGUAGE)
    teacher = models.ManyToManyField(to="Teacher", through="CourseToTeacher", through_fields=("course", "teacher"))
    school = models.ForeignKey('School', default=1)
    frequency = models.IntegerField(null=True, blank=True, default=1)  # 开课次数
    total_student = models.IntegerField(null=True, blank=True, default=0)  # 累计学生数
    favorite_count = models.IntegerField(null=True, blank=True, default=0)  # 关注人数
    add_time = models.DateField(null=True, blank=True, default=datetime.datetime.now)

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = '课程表'
        verbose_name_plural = verbose_name


class Chapter(models.Model):
    title = models.CharField(max_length=50, default='')
    course = models.ForeignKey(Course)

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = '章节表'
        verbose_name_plural = verbose_name


class Video(models.Model):
    title = models.CharField(max_length=50, default='')
    chapter = models.ForeignKey(Chapter)
    addr = models.CharField(max_length=200, null=True, blank=True,
                            default='http://source3.uooconline.com/course349/video/%E7%A7%AF%E6%9E%81%E5%BF%83%E7%90%86%E5%AD%A6%20%E5%AE%A3%E4%BC%A0%E7%89%8720170817T.mp4')

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = '视频表'
        verbose_name_plural = verbose_name


class Teacher(models.Model):
    name = models.CharField(max_length=20, null=False)
    position = models.IntegerField(choices=POSITION, null=False)
    introduce = models.TextField(null=True, blank=True)
    school = models.ForeignKey('School')
    avatar = models.ImageField(upload_to='tch_avatar/%Y/%m', blank=True, default=STATIC_URL + 'img/user_default.jpg')

    class Meta:
        verbose_name = '教师表'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class CourseToTeacher(models.Model):
    """自定义课程教师多对多第三张表，增加是否是主讲的字段"""
    course = models.ForeignKey(to="Course")
    teacher = models.ForeignKey(to="Teacher")
    is_primary = models.BooleanField()

    class Meta:
        verbose_name = '教师—课程表'
        verbose_name_plural = verbose_name
        unique_together = ("course", 'teacher')


class School(models.Model):
    name = models.CharField(max_length=20, null=False)
    picture = models.ImageField(upload_to='school/%Y/%m')

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = '学校表'
        verbose_name_plural = verbose_name
