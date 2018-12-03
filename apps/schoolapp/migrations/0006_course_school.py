# -*- coding: utf-8 -*-
# Generated by Django 1.11.16 on 2018-11-27 20:42
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('schoolapp', '0005_course_status'),
    ]

    operations = [
        migrations.AddField(
            model_name='course',
            name='school',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='schoolapp.School'),
        ),
    ]
