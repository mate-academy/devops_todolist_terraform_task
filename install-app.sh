#!/bin/bash

# Update system
export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get upgrade -y

# Install dependencies
apt-get install -y python3 python3-pip git nginx

# Install Flask
pip3 install flask

# Create todo app directory
mkdir -p /opt/todoapp
cd /opt/todoapp

# Create simple Flask todo app
cat > app.py << 'EOF'
from flask import Flask, render_template, request, redirect, url_for
import json
import os

app = Flask(__name__)

TODO_FILE = '/opt/todoapp/todos.json'

def load_todos():
    if os.path.exists(TODO_FILE):
        with open(TODO_FILE, 'r') as f:
            return json.load(f)
    return []

def save_todos(todos):
    with open(TODO_FILE, 'w') as f:
        json.dump(todos, f)

@app.route('/')
def index():
    todos = load_todos()
    return render_template('index.html', todos=todos)

@app.route('/add', methods=['POST'])
def add_todo():
    todo_text = request.form['todo']
    todos = load_todos()
    todos.append({'text': todo_text, 'done': False})
    save_todos(todos)
    return redirect(url_for('index'))

@app.route('/complete/<int:index>')
def complete_todo(index):
    todos = load_todos()
    if 0 <= index < len(todos):
        todos[index]['done'] = True
        save_todos(todos)
    return redirect(url_for('index'))

@app.route('/delete/<int:index>')
def delete_todo(index):
    todos = load_todos()
    if 0 <= index < len(todos):
        todos.pop(index)
        save_todos(todos)
    return redirect(url_for('index'))

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
EOF

# Create templates directory
mkdir -p /opt/todoapp/templates

# Create HTML template
cat > /opt/todoapp/templates/index.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
    <title>ToDo List</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        .todo-item { margin: 10px 0; padding: 10px; border: 1px solid #ddd; }
        .done { text-decoration: line-through; color: #888; }
        form { margin: 20px 0; }
        input[type="text"] { padding: 8px; width: 300px; }
        button { padding: 8px 16px; margin-left: 10px; }
    </style>
</head>
<body>
    <h1>ToDo List Application</h1>
    
    <form action="/add" method="post">
        <input type="text" name="todo" placeholder="Enter new todo" required>
        <button type="submit">Add Todo</button>
    </form>

    <div id="todos">
        {% for todo in todos %}
        <div class="todo-item {% if todo.done %}done{% endif %}">
            {{ todo.text }}
            {% if not todo.done %}
            <a href="/complete/{{ loop.index0 }}">Complete</a>
            {% endif %}
            <a href="/delete/{{ loop.index0 }}">Delete</a>
        </div>
        {% endfor %}
    </div>
</body>
</html>
EOF

# Create systemd service for the todo app
cat > /etc/systemd/system/todoapp.service << 'EOF'
[Unit]
Description=ToDo List Flask Application
After=network.target

[Service]
Type=simple
User=root
WorkingDirectory=/opt/todoapp
ExecStart=/usr/bin/python3 /opt/todoapp/app.py
Restart=always

[Install]
WantedBy=multi-user.target
EOF

# Configure nginx as reverse proxy
cat > /etc/nginx/sites-available/todoapp << 'EOF'
server {
    listen 80;
    server_name _;

    location / {
        proxy_pass http://127.0.0.1:5000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
EOF

# Enable nginx configuration
ln -sf /etc/nginx/sites-available/todoapp /etc/nginx/sites-enabled/
rm -f /etc/nginx/sites-enabled/default

# Start services
systemctl daemon-reload
systemctl enable todoapp
systemctl start todoapp
systemctl restart nginx

echo "ToDo List application installed and running!"
echo "Access your application at: http://$(curl -s ifconfig.me)"
