# import os
#
# if __name__ == "__main__":
#     os.environ.setdefault("DJANGO_SETTINGS_MODULE", "uooc.settings")
#     import django
#
#     django.setup()
#     from userapp.models import Course,StudentInfoToCourse
#     course_id = StudentInfoToCourse.objects.filter(student_id=2).values('course')
#     course_list = Course.objects.filter(id__in=course_id)

def func(n):
    l = [1]
    for i in range(3, n + 1):
        m = 0
        for j in range(1, i // 2 + 1):
            m = max(m, j * (i - j), j * l[i - j - 2])
        l.append(m)
    return l


print(func(10))
