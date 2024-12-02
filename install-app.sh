#!/bin/bash

apt-get update -yq
apt-get install python3-pip -yq

cd ~
git clone https://github.com/v-shutov/devops_todolist_terraform_task.git

mkdir /app
cp -r ~/devops_todolist_terraform_task/app/* /app
rm -rf ~/devops_todolist_terraform_task

cd /app
chmod +x start.sh

mv /app/todoapp.service /etc/systemd/system/
systemctl daemon-reload
systemctl start todoapp
systemctl enable todoapp
