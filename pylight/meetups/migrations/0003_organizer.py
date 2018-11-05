# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import misc.models


class Migration(migrations.Migration):

    dependencies = [
        ('meetups', '0002_sponsor_is_active'),
    ]

    operations = [
        migrations.CreateModel(
            name='Organizer',
            fields=[
                ('id', models.AutoField(primary_key=True, verbose_name='ID', serialize=False, auto_created=True)),
                ('first_name', models.CharField(max_length=30)),
                ('last_name', models.CharField(max_length=30)),
                ('photo', models.ImageField(upload_to=misc.models.SlugifyUploadTo('speakers', ['first_name', 'last_name']), blank=True)),
                ('biography', models.TextField(blank=True)),
            ],
        ),
    ]
