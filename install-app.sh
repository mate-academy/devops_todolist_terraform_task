#!/bin/bash

# Script rendered by Terraform and executed by the VM extension.
# Commands are executed as root by VM extension, so sudo is not required.

set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

apt-get update -yq
apt-get install python3-pip git -yq

REPO_URL="${repository_url}"
WORKDIR="/opt/todo-src"
rm -rf "$WORKDIR"
git clone --depth 1 "$REPO_URL" "$WORKDIR"

mkdir -p /app
cp -r "$WORKDIR"/app/* /app

# Install Python dependencies
pip3 install -r /app/requirements.txt

# Initialize database
cd /app
python3 manage.py migrate

# Install and start systemd service
mv /app/todoapp.service /etc/systemd/system/
systemctl daemon-reload
systemctl enable --now todoapp
