#!/bin/bash
###############################################################################
# Author        : Tang Zhongliang
# Email         : chaoxcores@gmail.com
# Last modified : 2019-11-30 16:52
# Filename      : system_status.sh
# Description   : 
##############################################################################

while :
do
        echo "--------------------------"
        echo "WHICH ACTION DO YOU WANT?"
        echo "h. 命令帮助"
        echo "f. 显示登录信息"
        echo "d. 显示磁盘挂载"
        echo "m. 查看内存使用"
        echo "u. 查看系统负载"
        echo "q. 退出"
        echo "--------------------------"
        read -p "chose in [h|f|d|m|u|q]: " wish
        echo "--------------------------"
        case $wish in
          u)
            echo "load average information"
            uptime
            continue
            ;;
          h)
            echo "help information"
            read -p "please input a command: " cmd
            $cmd --help
            continue
            ;;
          f)
            echo "login information"
            tail /var/log/secure
            continue
            ;;
          d)
            echo "disk mount information"
            df -h
            continue
            ;;
          m)
            echo "memery information"
            free -h
            continue
            ;;
          q)
            echo "Bye-Bye"
            break
            ;;
          *)
            echo "please input in [h|f|d|m|u|q]"
            continue
            ;;
        esac
done
