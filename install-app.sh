#!/bin/bash

# Update and install python3-pip
sudo apt-get update -yq
sudo apt-get install python3-pip -yq

# Create a directory for the app if it doesn't exist
if [ ! -d /home/azureuser/app ]; then
    sudo mkdir /home/azureuser/app
fi

# Change ownership of directories
sudo chown -R azureuser:azureuser /home/azureuser/devops_todolist_terraform_task
sudo chown -R azureuser:azureuser /home/azureuser/app

# Copy files to the app directory
if [ -d /home/azureuser/devops_todolist_terraform_task/app ]; then
    sudo cp -r /home/azureuser/devops_todolist_terraform_task/app/* /home/azureuser/app
else
    echo "Source directory /home/azureuser/devops_todolist_terraform_task/app does not exist."
    exit 1
fi

# Move and enable the service
if [ -f /home/azureuser/app/todoapp.service ]; then
    sudo mv /home/azureuser/app/todoapp.service /etc/systemd/system/
    sudo systemctl daemon-reload
    sudo systemctl start todoapp
    sudo systemctl enable todoapp
else
    echo "Service file /home/azureuser/app/todoapp.service does not exist."
    exit 1
fi
