# -*- coding: utf-8 -*-
# Generated by Django 1.11.16 on 2018-11-29 23:18
from __future__ import unicode_literals

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('schoolapp', '0013_auto_20181129_0937'),
    ]

    operations = [
        migrations.AddField(
            model_name='course',
            name='add_time',
            field=models.CharField(default=datetime.datetime.now, max_length=30),
        ),
    ]
