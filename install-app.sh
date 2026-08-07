#!/bin/bash
set -euo pipefail

# Script to silently install and start the todo web app on the virtual machine.

# Получаем URL репозитория из аргумента (передаваемого из Terraform) или используем ваш по умолчанию
REPO_URL="${1:-https://github.com/Clem97121/azure_task_12_deploy_app_with_vm_extention.git}"

echo "Starting application installation from: $REPO_URL"

# Добавляем git в список устанавливаемых пакетов
apt-get update -yq
apt-get install python3-pip git -yq

# Создаем директорию под приложение
mkdir -p /app 

# Удаляем временную папку на случай повторного запуска
rm -rf /tmp/task_repo

# Клонируем репозиторий во временную папку
git clone "$REPO_URL" /tmp/task_repo

# Проверяем, что папка приложения успешно скачалась
if [ ! -d "/tmp/task_repo/app" ]; then
    echo "Error: Cloned repository or 'app' directory does not exist!"
    exit 1
fi

# Копируем файлы приложения в /app
cp -r /tmp/task_repo/app/* /app/

# Переносим и запускаем systemd сервис
mv /app/todoapp.service /etc/systemd/system/
systemctl daemon-reload
systemctl start todoapp
systemctl enable todoapp