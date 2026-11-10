#!/bin/bash

apt-get update -yq
apt-get install python3-pip git -yq

mkdir /app
git clone https://github.com/baga090/devops_todolist_terraform_task.git
cp -r devops_todolist_terraform_task/app/* /app

mv /app/todoapp.service /etc/systemd/system/
systemctl daemon-reload
systemctl start todoapp
systemctl enable todoapp