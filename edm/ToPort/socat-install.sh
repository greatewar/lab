#!/bin/bash

# 检查socat是否已经安装
if ! command -v socat &> /dev/null
then
    echo "socat 未被安装，正在安装..."
    # 更新包列表并安装 socat
    sudo yum update -y
    sudo yum install -y socat
else
    echo "socat 已被安装"
fi

# 创建 systemd 服务文件
echo '[Unit]
Description=socat service

[Service]
ExecStart=/usr/bin/socat TCP-LISTEN:425,fork TCP:127.0.0.1:2525

[Install]
WantedBy=multi-user.target' | sudo tee /etc/systemd/system/socat-service.service > /dev/null

# 使 systemd 重新加载配置，启动服务并在开机时启动
sudo systemctl daemon-reload
sudo systemctl start socat-service
sudo systemctl enable socat-service
