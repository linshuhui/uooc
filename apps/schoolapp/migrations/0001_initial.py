# -*- coding: utf-8 -*-
# Generated by Django 1.11.16 on 2018-11-27 13:55
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Course',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=40)),
                ('english_title', models.CharField(max_length=40)),
                ('introduction', models.TextField(blank=True, null=True)),
                ('start_time', models.DateField(blank=True, null=True)),
                ('end_time', models.DateField(blank=True, null=True)),
                ('credit', models.IntegerField()),
                ('teaching_mode', models.IntegerField(choices=[(1, '自由模式'), (2, '闯关模式')])),
                ('period', models.IntegerField(blank=True, null=True)),
                ('language', models.IntegerField(choices=[(1, '中文'), (2, '英文'), (3, '日语'), (4, '韩语')])),
                ('frequency', models.IntegerField(blank=True, default=1, null=True)),
                ('total_student', models.IntegerField(blank=True, default=0, null=True)),
                ('favorite_count', models.IntegerField(blank=True, default=0, null=True)),
            ],
            options={
                'verbose_name': '课程表',
                'verbose_name_plural': '课程表',
            },
        ),
        migrations.CreateModel(
            name='CourseToTeacher',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('is_primary', models.BooleanField()),
                ('course', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='schoolapp.Course')),
            ],
        ),
        migrations.CreateModel(
            name='School',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=20)),
                ('picture', models.ImageField(upload_to='school/%Y/%m')),
            ],
            options={
                'verbose_name': '学校表',
                'verbose_name_plural': '学校表',
            },
        ),
        migrations.CreateModel(
            name='Teacher',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=20)),
                ('position', models.IntegerField(choices=[(1, '教授'), (2, '副教授'), (3, '讲师'), (4, '助教')])),
                ('introduce', models.TextField(blank=True, null=True)),
                ('avatar', models.ImageField(blank=True, default='/static/img/user_default.jpg', upload_to='tch_avatar/%Y/%m')),
                ('school', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='schoolapp.School')),
            ],
            options={
                'verbose_name': '教师表',
                'verbose_name_plural': '教师表',
            },
        ),
        migrations.AddField(
            model_name='coursetoteacher',
            name='teacher',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='schoolapp.Teacher'),
        ),
        migrations.AddField(
            model_name='course',
            name='teacher',
            field=models.ManyToManyField(through='schoolapp.CourseToTeacher', to='schoolapp.Teacher'),
        ),
        migrations.AlterUniqueTogether(
            name='coursetoteacher',
            unique_together=set([('course', 'teacher')]),
        ),
    ]