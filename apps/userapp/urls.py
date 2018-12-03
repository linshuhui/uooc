from django.conf.urls import url
from django.contrib import admin

from .views import LoginView, RegisterView, is_exit, LogoutView, HomeView, StudentMsgView

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^register/', RegisterView.as_view(), name='register'),
    url(r'^login/', LoginView.as_view(), name='login'),
    url(r'^home/', HomeView.as_view(), name='home'),
    url(r'^has_username/', is_exit, name='has_username'),
    url(r'^has_email/$', is_exit, name='has_email'),
    url(r'^has_phone/$', is_exit, name='has_phone'),
    url(r'^logout/', LogoutView.as_view(), name='logout'),
    url(r'student_msg/', StudentMsgView.as_view(), name='student_msg')

]
