#!/usr/bin/sh
source /etc/init.d/functions
if [ $# -ne 2 ];then
  echo "/bin/sh $0 新的主机名  新的IP地址主机位"
  exit 1
fi
hostnamectl  set-hostname   $1
if [ $? -eq 0 ];then
    action "hostname update Successful！" /bin/true
else
    action "hostname update Failed！" /bin/false
fi
sed -ri  "/^IPA/s#(.*\.).*#\1$2#g"  /etc/sysconfig/network-scripts/ifcfg-eth[01]
if [ $? -eq 0 ];then
    action "IP update Successful！" /bin/true
else
    action "IP update Failed！" /bin/false
fi
systemctl  restart  network
bash
