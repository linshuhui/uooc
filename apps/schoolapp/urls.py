from django.conf.urls import url
from django.contrib import admin

from schoolapp import views

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^add_course/(?P<course_id>\d+)/', views.StudentAddCourse.as_view(), name='add_course'),
    url(r'^del_course/', views.StudentDelCourse.as_view(), name='del_course'),

]
