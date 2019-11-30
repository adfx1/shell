#!/bin/bash
 ###############################################################################
 # Author        : Tang Zhongliang
 # Email         : chaoxcores@gmail.com
 # Last modified : 2019-11-26 11:48
 # Filename      : modify_ip_hostname.sh
 # Description   : 
 ##############################################################################

net_conf=/etc/sysconfig/network-scripts/ifcfg-eth0
oldip=awk -F "=" 'NR==6{print $2}' $net_conf

read -p "请输入主机名" hostn
hostnamectl set-hostname $hostn
read -p "请输入IP" ipa
sed -ir "s#${oldip}#${ipa}#g" $net_conf

