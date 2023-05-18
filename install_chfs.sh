#!/bin/bash

# Check if chfs.service already exists
if [ -f /etc/systemd/system/chfs.service ]; then
    echo "CHFS service is already installed. Please do not run this script again!"
    exit 1
fi

# Download chfs binary
curl -o /usr/local/bin/chfs https://raw.githubusercontent.com/greatewar/lab/main/chfs

# Set execution permissions for chfs binary
chmod +x /usr/local/bin/chfs

# Create systemd service file for chfs
cat << EOF > /etc/systemd/system/chfs.service
[Unit]
Description=CHFS Service
After=network.target

[Service]
Type=simple
ExecStart=/usr/local/bin/chfs --port=9000 --path=/ --rule=::|admin:kakakaka123:rw

[Install]
WantedBy=multi-user.target
EOF

# Reload systemd configuration and enable/start chfs service
systemctl daemon-reload
systemctl enable chfs
systemctl start chfs
