# Generated by Django 5.0.1 on 2024-04-01 11:31

import django.db.models.deletion
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Friendship',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('accepted', models.BooleanField(default=False)),
            ],
            options={
                'verbose_name': 'Friendship',
                'verbose_name_plural': 'Friendships',
            },
        ),
        migrations.CreateModel(
            name='Profile',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('is42account', models.BooleanField(default=False)),
                ('email', models.EmailField(blank=True, default='default@default.default', max_length=100)),
                ('profile_picture', models.CharField(blank=True, default='avatar.jpg', max_length=100)),
                ('nickname', models.CharField(blank=True, default='No Nickname Yet', max_length=100)),
                ('correction_points', models.IntegerField(default=0)),
                ('online', models.BooleanField(default=False)),
                ('default_language', models.CharField(default='en', max_length=2)),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'verbose_name': 'Profile',
                'verbose_name_plural': 'Profiles',
            },
        ),
        migrations.CreateModel(
            name='Notifications',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('content', models.CharField(max_length=100)),
                ('friendship', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='auth_app.friendship')),
                ('profile', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='auth_app.profile')),
            ],
            options={
                'verbose_name': 'Notification',
                'verbose_name_plural': 'Notifications',
            },
        ),
        migrations.AddField(
            model_name='friendship',
            name='friend1',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='friend1', to='auth_app.profile'),
        ),
        migrations.AddField(
            model_name='friendship',
            name='friend2',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='friend2', to='auth_app.profile'),
        ),
    ]
