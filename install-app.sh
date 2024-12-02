#!/bin/bash

# Script to silently install and start the todo web app on the virtual machine. 
# Note that all commands bellow are without sudo - that's because extention mechanism 
# runs scripts under root user. 

# install system updates and isntall python3-pip package using apt. '-yq' flags are 
# used to suppress any interactive prompts - we won't be able to confirm operation 
# when running the script as VM extention.  
sudo apt-get update -yq
sudo apt-get install python3-pip -yq

# Create a directory for the app and download the files. 
sudo mkdir /home/azureuser/app

sudo chown -R azureuser:azureuser /home/azureuser/devops_todolist_terraform_task
sudo chown -R azureuser:azureuser /home/azureuser/app

# make sure to uncomment the line bellow and update the link with your GitHub username
# git clone https://github.com/<your-gh-username>/azure_task_12_deploy_app_with_vm_extention.git
cp -r /home/azureuser/devops_todolist_terraform_task/app/* /home/azureuser/app
chmod +x /home/azureuser/app/start.sh

# create a service for the app via systemctl and start the app
sudo mv /home/azureuser/app/todoapp.service /etc/systemd/system/
sudo chmod 644 /etc/systemd/system/todoapp.service
sudo systemctl daemon-reload
sudo systemctl start todoapp
sudo systemctl enable todoapp
