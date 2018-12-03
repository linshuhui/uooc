import xadmin
from xadmin import views
from .models import Banner, StudentInfo, StudentInfoToCourse


@xadmin.sites.register(views.BaseAdminView)
class BaseSetting(object):
    enable_themes = True
    use_bootswatch = True


@xadmin.sites.register(Banner)
class BannerAdmin(object):
    list_display = ['alt', 'add_time', 'is_display', 'course', 'position', 'bodyBannerImage']
    list_filter = ['alt', 'add_time', 'is_display', 'course', 'position', 'bodyBannerImage']
    search_fields = ['alt', 'is_display', 'course', 'position', 'bodyBannerImage']
    list_editable = ['alt', 'add_time', 'is_display', 'course', 'position', 'bodyBannerImage']


@xadmin.sites.register(StudentInfo)
class StudentInfoAdmin:
    list_display = ['student_name', 'institute', 'profession', 'avatar', 'user']
    list_filter = ['student_name', 'institute', 'profession', 'avatar', 'user']
    search_fields = ['student_name', 'institute', 'profession', 'avatar', 'user']
    list_editable = ['student_name', 'institute', 'profession', 'avatar', 'user']


@xadmin.sites.register(StudentInfoToCourse)
class StudentInfoToCourseAdmin:
    list_display = ['course', 'student', 'join_or_attention']
    list_filter = ['course', 'student', 'join_or_attention']
    search_fields = ['course', 'student', 'join_or_attention']
    list_editable = ['course', 'student', 'join_or_attention']
