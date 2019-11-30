#!/bin/bash
###############################################################################
# Author        : Tang Zhongliang
# Email         : chaoxcores@gmail.com
# Last modified : 2019-11-27 19:26
# Filename      : getsoft.sh
# Description   : 
##############################################################################

version=$(cat /proc/version|awk -F "(" '{print $1}'|sed -r "s#(.*).el([0-9])(.*)#\2#g")

ping www.baidu.com -c1 -W1 &> /dev/null
if [ $? -ne 0 ]
then
  echo "Bad net status,will restart network";
  systemctl restart network;
  sleep 5;
  ping www.baidu.com -c1 -w1 &> /dev/null
  if [ $? -ne 0 ]
  then
    echo "please check your network status";
    exit;
  fi
else
  rpm -qa | grep wget &> /dev/null
  if [ $? -ne 0 ]
  then
    echo "yum install -y wget"
    if [ $? -ne 0]
    then
      echo "mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup"
      echo "wget wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-${version}.repo"
    fi
  else
    echo "mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup"
    echo "wget wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-${version}.repo"
  fi
fi
