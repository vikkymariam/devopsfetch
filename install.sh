#!/bin/bash

# Install necessary dependencies
sudo apt update
sudo apt install -y net-tools docker.io nginx

# Set up systemd service
SERVICE_FILE=/etc/systemd/system/devopsfetch.service
echo "[Unit]
Description=DevOps Fetch Service

[Service]
ExecStart=$PWD/devopsfetch.sh -t 1h
Restart=always
User=$(whoami)

[Install]
WantedBy=multi-user.target" | sudo tee $SERVICE_FILE

# Enable and start the service
sudo systemctl enable devopsfetch.service
sudo systemctl start devopsfetch.service

# Set up log rotation
LOGROTATE_FILE=/etc/logrotate.d/devopsfetch
echo "$PWD/logs/*.log {
    daily
    missingok
    rotate 14
    compress
    notifempty
    create 0640 $(whoami) $(whoami)
    sharedscripts
    postrotate
        systemctl reload devopsfetch.service > /dev/null 2>/dev/null || true
    endscript
}" | sudo tee $LOGROTATE_FILE

echo "Installation complete. DevOps Fetch service is now running."
