# -*- coding: utf-8 -*-
# Generated by Django 1.11.16 on 2018-11-27 21:13
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('schoolapp', '0006_course_school'),
    ]

    operations = [
        migrations.AlterField(
            model_name='course',
            name='status',
            field=models.CharField(choices=[('pass', '开课中'), ('learn', '即将开课')], default='learn', max_length=20),
        ),
    ]
