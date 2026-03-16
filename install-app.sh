#!/bin/bash

set -euo pipefail

# Script runs as root via Azure Custom Script extension.
REPO_URL="${1:-https://github.com/<your-gh-username>/devops_todolist_terraform_task.git}"
WORKDIR="/opt/todo-src"
APPDIR="/app"

apt-get update -yq
apt-get install -yq git python3-pip python3-venv

rm -rf "${WORKDIR}" "${APPDIR}"
git clone "${REPO_URL}" "${WORKDIR}"
mkdir -p "${APPDIR}"
cp -r "${WORKDIR}/app/." "${APPDIR}"

cat > /app/start.sh <<'EOF'
#!/bin/bash
set -euo pipefail

cd /app
python3 -m venv /app/venv
source /app/venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
python3 manage.py migrate
exec python3 manage.py runserver 0.0.0.0:8080
EOF

chmod +x /app/start.sh
chmod +x /app/manage.py

mv /app/todoapp.service /etc/systemd/system/todoapp.service
systemctl daemon-reload
systemctl enable todoapp
systemctl restart todoapp
