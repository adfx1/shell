#!/bin/bash
source /etc/init.d/functions
if [ -f /root/.ssh/id_dsa ];
then
    echo "密钥对已存在，将会发送已有公钥"
else
    # 生成密钥对
    echo "生成密钥对"
    ssh-keygen -t dsa -f /root/.ssh/id_dsa -N '' &>/dev/null
fi
# 安装sshpass
#yum install -y sshpass &>/dev/null
for ip in $(cat /root/scripts/ip.txt)
do
    # 分发
    action "发送密钥到目标主机${ip} " sshpass -p123 ssh-copy-id ${ip} -o StrictHostKeyChecking=no
done
