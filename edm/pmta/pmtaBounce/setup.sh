#!/bin/bash

# 检查是否存在 /opt/pmta/ 目录，如果不存在则创建
if [ ! -d "/opt/pmta/" ]; then
  mkdir -p /opt/pmta/
fi

# 检查是否有运行中的 pmtaBounce 进程，如果有，则结束该进程
PID=`ps -ef | grep 'pmtaBounce' | grep -v grep | awk '{print $2}'`
if [ ! -z "$PID" ]; then
  echo "找到正在运行的pmtaBounce进程，PID: $PID，将进行结束操作..."
  kill -9 $PID
fi

# 检查是否存在旧的 pmtaBounce 文件，如果存在则删除
if [ -f "/opt/pmta/pmtaBounce" ]; then
  echo "找到旧的pmtaBounce文件，将进行删除操作..."
  rm -f /opt/pmta/pmtaBounce
fi

# 下载 pmtaBounce 文件到 /opt/pmta/ 目录
echo "开始下载pmtaBounce..."
wget -O /opt/pmta/pmtaBounce https://raw.githubusercontent.com/greatewar/lab/main/edm/pmta/pmtaBounce/pmtaBounce

# 设置文件权限为 777
chmod 777 /opt/pmta/pmtaBounce

echo "pmtaBounce 更新完毕！"
