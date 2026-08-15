#!/bin/bash
# Script to silently install and start the todo web app on the virtual machine. 
# Note that all commands bellow are without sudo - that's because extention mechanism 
# runs scripts under root user. 

apt-get update -yq
apt-get install git python3-pip -yq

# Create a directory for the app and download the files.
mkdir -p /app
git clone https://github.com/1ntact/devops_todolist_terraform_task.git /tmp/devops_todolist_terraform_task
cp -r /tmp/devops_todolist_terraform_task/app/* /app
chmod +x /app/start.sh

# create a service for the app via systemctl and start the app
mv /app/todoapp.service /etc/systemd/system/
systemctl daemon-reload
systemctl start todoapp
systemctl enable todoapp