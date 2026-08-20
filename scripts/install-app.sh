#!/bin/bash

apt-get update -yq
apt-get install python3-pip git -yq

mkdir /app

# клонуємо саме ваш форк репозиторію
git clone ${repo_url} /tmp/repo

# копіюємо файли застосунку з клонованого репо в /app
cp -r /tmp/repo/app/* /app

# створюємо сервіс і запускаємо застосунок
mv /app/todoapp.service /etc/systemd/system/
systemctl daemon-reload
systemctl start todoapp
systemctl enable todoapp