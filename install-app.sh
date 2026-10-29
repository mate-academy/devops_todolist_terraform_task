#!/bin/bash

set -e

apt-get update -yq
apt-get install python3-pip git -yq

rm -rf /app
rm -rf /tmp/devops_todolist_terraform_task

git clone --depth 1 https://github.com/tetianamohorian23/devops_todolist_terraform_task.git /tmp/devops_todolist_terraform_task

mkdir -p /app
cp -r /tmp/devops_todolist_terraform_task/app/* /app/

chmod +x /app/start.sh

mv /app/todoapp.service /etc/systemd/system/todoapp.service

systemctl daemon-reload
systemctl enable todoapp
systemctl start todoapp
