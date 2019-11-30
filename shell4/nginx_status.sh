#!/bin/bash
###############################################################################
# Author        : Tang Zhongliang
# Email         : chaoxcores@gmail.com
# Last modified : 2019-11-29 15:41
# Filename      : nginx_status.sh
# Description   : 
##############################################################################

while :
do
        echo "--------------------------"
        echo "WHICH ACTION DO YOU WANT?"
        echo "1. status"
        echo "2. start"
        echo "3. stop"
        echo "4. restart"
        echo "5. reload"
        echo "6. exit"
        echo "--------------------------"
        read -p "chose in 1-6: " wish
        echo "--------------------------"
        case $wish in
          1)
            echo "nginx status"
            echo "systemtl status nginx > /dev/null"
            continue
            ;;
          2)
            echo "start nginx"
            echo "systemtl start nginx > /dev/null"
            continue
            ;;
          3)
            echo "stop nginx"
            echo "sytemctl stop nginx > /dev/null"
            continue
            ;;
          4)
            echo "restart nginx"
            echo "systemctl restart nginx > /dev/null"
            continue
            ;;
          5)
            echo "reload nginx"
            echo "systemctl reload nginx > /dev/null"
            ;;
          6)
            echo "exit"
            break
            ;;
          *)
            echo "please input [1|2|3|4|5]"
            continue
            ;;
        esac
done
