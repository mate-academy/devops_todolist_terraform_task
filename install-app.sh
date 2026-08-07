#!/bin/bash

# Script to silently install and start the todo web app on the virtual machine.

# Добавляем git в список устанавливаемых пакетов
apt-get update -yq
apt-get install python3-pip git -yq

# Создаем директорию под приложение
mkdir -p /app 

# Клонируем репозиторий во временную папку
# ЗАМЕНИ <your-gh-username> НА СВОЙ ЛОГИН НА GITHUB!
git clone https://github.com/Clem97121/azure_task_12_deploy_app_with_vm_extention.git /tmp/task_repo

# Копируем файлы приложения в /app
cp -r /tmp/task_repo/app/* /app/

# Переносим и запускаем systemd сервис
mv /app/todoapp.service /etc/systemd/system/
systemctl daemon-reload
systemctl start todoapp
systemctl enable todoapp
