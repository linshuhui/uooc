# -*- coding: utf-8 -*-
# Generated by Django 1.11.16 on 2018-12-01 10:15
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('schoolapp', '0017_auto_20181201_1002'),
    ]

    operations = [
        migrations.AlterField(
            model_name='course',
            name='picture',
            field=models.ImageField(blank=True, default='/static/img/user_default.jpg', null=True, upload_to='course/%Y/%m'),
        ),
    ]
