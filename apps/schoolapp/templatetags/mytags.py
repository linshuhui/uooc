from django import template

from schoolapp.models import CourseToTeacher

register = template.Library()


@register.filter
def get_position(course):
    return CourseToTeacher.objects.filter(course=course, is_primary=1)[0].teacher.get_position_display()


@register.filter
def get_name(course):
    return CourseToTeacher.objects.filter(course=course, is_primary=1)[0].teacher.name


@register.filter
def get_avatar(course):
    return CourseToTeacher.objects.filter(course=course, is_primary=1)[0].teacher.avatar
