# -*- coding: utf-8 -*-
# Generated by Django 1.11.16 on 2018-11-29 00:05
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('schoolapp', '0010_auto_20181129_0000'),
    ]

    operations = [
        migrations.AddField(
            model_name='category',
            name='is_display',
            field=models.BooleanField(default=0),
        ),
    ]