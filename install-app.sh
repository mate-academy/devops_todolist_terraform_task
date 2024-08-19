#!/bin/bash

# Script to silently install and start the todo web app on the virtual machine.
# Note that all commands bellow are without sudo - that's because extention mechanism
# runs scripts under root user.

# install system updates and isntall python3-pip package using apt. '-yq' flags are 
# used to suppress any interactive prompts - we won't be able to confirm operation
# when running the script as VM extention.
apt-get update -yq
apt-get install python3-pip -yq

# download only the main branch with app files
cd ~
git clone --branch main --single-branch https://github.com/YegorVolkov/devops_todolist_terraform_task.git

# Create a directory for the app and transfer the files in there
mkdir /app
cp -r ~/devops_todolist_terraform_task/app/* /app
rm -rf ~/devops_todolist_terraform_task

# make start file executable
cd /app
chmod +x start.sh

# create a service for the app via systemctl and start the app
mv /app/todoapp.service /etc/systemd/system/
systemctl daemon-reload
systemctl start todoapp
systemctl enable todoapp
