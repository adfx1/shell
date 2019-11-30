#!/bin/bash
###############################################################################
# Author        : Tang Zhongliang
# Email         : chaoxcores@gmail.com
# Last modified : 2019-11-27 11:36
# Filename      : vminfo.sh
# Description   : 
##############################################################################

hostnm=$(hostname)
outside_ip=$(telnet cip.cc 2> /dev/null |awk -F ":" '/^IP/{print $2}')
internal_ip=$(ifconfig eth0 |awk 'NR==2{print $2}')
vm=$(virt-what)
lVersion=$(cat /etc/centos-release)
loadavg=$(uptime |awk -F ": " '{print $2}'|awk -F "," '{print $1" "$2" "$3}')
memUsed=$(free |awk 'NR==2{print $3/$4*100}')
diskUsed=$(df -h|awk 'NR==2{print $5}')

echo "主机名称是：$hostnm"
echo "虚拟平台是：$vm"
echo "Linux版本是：$lVersion"
echo "内网IP是：$internal_ip"
echo "外网IP是：$outside_ip"
echo "平均负载是：$loadavg"
echo "当前内存情况是：${memUsed}%"
echo "当前磁盘用量是：$diskUsed"
