# Generated by Django 2.1.2 on 2018-11-21 18:41

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Authentication', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='spcuser',
            name='syncLock',
            field=models.IntegerField(default=0),
        ),
    ]
