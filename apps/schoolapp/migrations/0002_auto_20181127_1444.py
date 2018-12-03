# -*- coding: utf-8 -*-
# Generated by Django 1.11.16 on 2018-11-27 14:44
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('schoolapp', '0001_initial'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='coursetoteacher',
            options={'verbose_name': '教师—课程表', 'verbose_name_plural': '教师—课程表'},
        ),
        migrations.AddField(
            model_name='course',
            name='picture',
            field=models.ImageField(default='/static/img/user_default.jpg', upload_to='course/%Y/%m'),
        ),
    ]