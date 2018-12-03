import xadmin
from .models import Course, Teacher, School, CourseToTeacher, Category, Keyword, Chapter, Video


@xadmin.sites.register(Category)
class CategoryAdmin:
    list_display = ['name', 'titleBackgroundImgage', 'titleBackgroundImgage', 'is_display', 'icon']
    list_filter = ['name', 'titleBackgroundImgage', 'titleBackgroundImgage', 'is_display', 'icon']
    search_fields = ['name', 'titleBackgroundImgage', 'titleBackgroundImgage', 'is_display', 'icon']
    list_editable = ['name', 'titleBackgroundImgage', 'titleBackgroundImgage', 'is_display', 'icon']


@xadmin.sites.register(Keyword)
class KeywordAdmin:
    list_display = ['keyword', 'category']
    list_filter = ['keyword', 'category']
    search_fields = ['keyword', 'category']
    list_editable = ['keyword', 'category']


class ChapterInline:
    model = Chapter
    extra = 0


class VideoInline:
    model = Video
    extra = 0


@xadmin.sites.register(Course)
class CourseAdmin:
    list_display = ['title', 'category', 'start_time', 'introduction',
                    'teaching_mode',
                    'period', 'language', 'teacher', 'school', 'frequency', 'total_student',
                    'favorite_count', 'add_time']
    list_filter = ['title', 'category', 'start_time', 'introduction',
                   'period', 'language', 'teacher', 'school', 'frequency', 'total_student',
                   'favorite_count', 'add_time']
    search_fields = ['title', 'category', 'start_time', 'introduction',
                     'teaching_mode',
                     'period', 'language', 'teacher', 'school', 'frequency', 'total_student',
                     'favorite_count', 'add_time']
    list_editable = ['title', 'category', 'start_time', 'introduction',
                     'teaching_mode',
                     'period', 'language', 'teacher', 'school', 'frequency', 'total_student',
                     'favorite_count', 'add_time']
    style_fields = {"introduction": "ueditor"}
    inlines = [ChapterInline]


@xadmin.sites.register(Teacher)
class TeacherAdmin:
    list_display = ['name', 'position', 'introduce', 'school', 'avatar']
    list_filter = ['name', 'position', 'introduce', 'school', 'avatar']
    search_fields = ['name', 'position', 'introduce', 'school', 'avatar']
    list_editable = ['name', 'position', 'introduce', 'school', 'avatar']


@xadmin.sites.register(School)
class SchoolAdmin:
    list_display = ['name', 'picture']
    list_filter = ['name', 'picture']
    search_fields = ['name', 'picture']
    list_editable = ['name', 'picture']


@xadmin.sites.register(CourseToTeacher)
class CourseToTeacher:
    list_display = ['course', 'teacher', 'is_primary']
    list_filter = ['course', 'teacher', 'is_primary']
    search_fields = ['course', 'teacher', 'is_primary']
    list_editable = ['course', 'teacher', 'is_primary']


@xadmin.sites.register(Chapter)
class ChapterView:
    list_display = ['title', 'course']
    list_filter = ['title', 'course']
    search_fields = ['title', 'course']
    list_editable = ['title', 'course']
    inlines = [VideoInline]


@xadmin.sites.register(Video)
class VideoView:
    list_display = ['title', 'chapter', 'addr']
    list_filter = ['title', 'chapter', 'addr']
    search_fields = ['title', 'chapter', 'addr']
    list_editable = ['course', 'chapter', 'addr']
