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
  read -p "请输入查看的网段(类似10.0.0.0/24)：" ipseg
  array=($(nmap -sP -PI -PT $ipseg |awk '/^Nmap scan/{print $NF}'))
  for i in ${array[*]}
  do
    echo "当前网段在线IP: $i"
  done
}
scan2(){
  echo "扫描中..."
  for ip in 10.0.0.{1..254}
  do
    ping -c 1 -W 1 $ip &> /dev/null
    if [ $? -eq 0 ]
    then
      echo "主机 $ip 存活"
    fi
  done
}

cat << EOF
1.nmap扫描
2.ping扫描
EOF
echo ""
read -p "选择扫描方式[1|2]: " way
case $way in
  1)
    rpm -qa |grep nmap &> /dev/null
    if [ $? -ne 0 ]
    then
      echo "没有nmap,将下载"
      yum install -y nmap &> /dev/null
      scan
    else
      scan
    fi
    ;;
  2)
    scan2
    ;;
esac
