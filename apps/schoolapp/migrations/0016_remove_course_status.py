# -*- coding: utf-8 -*-
# Generated by Django 1.11.16 on 2018-11-30 11:16
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('schoolapp', '0015_auto_20181129_2322'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='course',
            name='status',
        ),
    ]