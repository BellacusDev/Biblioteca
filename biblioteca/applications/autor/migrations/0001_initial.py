# Generated by Django 4.1.3 on 2022-11-11 19:06

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Autor',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombres', models.CharField(max_length=50)),
                ('apellidos', models.CharField(max_length=50)),
                ('nacionaldiad', models.CharField(max_length=20)),
                ('edad', models.PositiveIntegerField()),
            ],
            options={
                'abstract': False,
            },
        ),
    ]
