"""uooc URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
from django.views.static import serve

from schoolapp.views import CourseListView, OrgView, AboutView, CourseView, test
from uooc import settings
from userapp.views import IndexView, get_code
from xadmin import xadmin

urlpatterns = [
    url(r'^xadmin/', xadmin.site.urls),
    url(r'^userapp/', include('apps.userapp.urls', namespace='user')),
    url(r'^schoolapp/', include('apps.schoolapp.urls', namespace='school')),
    url(r'^$', IndexView.as_view(), name='index'),
    url(r'^search/', CourseListView.as_view()),
    url(r'^course_list/$', CourseListView.as_view(), name='course_list'),
    url(r'^media/(?P<path>.*)', serve, {'document_root': settings.MEDIA_ROOT}),
    # url(r'^static/(?P<path>.*)', serve, {'document_root': settings.STATIC_ROOT}),
    url(r'^get_code/$', get_code),
    url(r'^org/', OrgView.as_view(), name='org_list'),
    url(r'^about/', AboutView.as_view(), name='about'),
    url(r'^course/(?P<course_id>\d+)', CourseView.as_view(), name='course'),
    url(r'^ueditor/', include('DjangoUeditor.urls')),
    url(r'^test/', test)

]

# 404 500 页面配置
handler404 = 'userapp.views.page_not_exit'

handler505 = 'userapp.views.page_not_exit'
