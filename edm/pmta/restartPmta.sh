#!/bin/bash

# Define variables
#重至PMAT全新状态 删除队例 重新统计
service pmta stop
cd /var/log/pmta/
rm -rf *
cd /var/spool/pmta
rm -rf *
service pmta start
pmta reset count
pmta  reset counters
