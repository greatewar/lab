#!/bin/bash

# 更新系统
#sudo yum update -y

# 安装 BIND centos7测试通过
sudo yum install bind bind-utils -y

# 配置 BIND
sudo bash -c "cat > /etc/named.conf << EOL
options {
    directory   "/var/named";
    dump-file   "/var/named/data/cache_dump.db";
    statistics-file "/var/named/data/named_stats.txt";
    memstatistics-file "/var/named/data/named_mem_stats.txt";
    dnssec-enable yes;
    dnssec-validation yes;
    bindkeys-file "/etc/named.iscdlv.key";
    managed-keys-directory "/var/named/dynamic";
    pid-file "/run/named/named.pid";
    session-keyfile "/run/named/session.key";
    listen-on port 53 { any; };
    allow-query     { any; };
    recursion yes;
    forwarders { 8.8.8.8; 8.8.4.4; };
};
logging {
    channel default_debug {
        file "data/named.run";
        severity dynamic;
    };
};
zone "." IN {
    type hint;
    file "named.ca";
};
include "/etc/named.rfc1912.zones";
EOL"

# 重启 BIND 服务
sudo systemctl restart named.service

# 设置开机启动
sudo systemctl enable named.service

# 检查 BIND 服务状态
sudo systemctl status named.service
