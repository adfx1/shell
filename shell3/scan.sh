#!/bin/bash
###############################################################################
# Author        : Tang Zhongliang
# Email         : chaoxcores@gmail.com
# Last modified : 2019-11-30 15:12
# Filename      : scan.sh
# Description   : 
##############################################################################

scan(){
  echo "开始扫描..."
  read -p "请输入查看的网段(10.0.0.0/24)：" ip
  array=($(nmap -sP -PI -PT 10.0.0.0/24 |awk '/^Nmap scan/{print $NF}'))
  for i in ${array[*]}
  do
    echo "当前网段在线IP: $i"
  done
}
rpm -qa |grep nmap &> /dev/null
if [ $? -ne 0 ]
then
  echo "没有nmap,将下载"
  yum install -y nmap &> /dev/null
  scan
else
  scan
fi
