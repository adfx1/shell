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
            systemctl status nginx 
            continue
            ;;
          2)
            echo "start nginx"
            systemctl start nginx > /dev/null
            curl localhost &> /dev/null
            if [ $? -ne 0 ]
            then
                /usr/sbin/nginx
                if [ $? -ne 0 ]
                then 
                    echo "can't start nginx ,please check "
                fi
            else
                echo "nginx is starting"
            fi
            continue
            ;;
          3)
            echo "stop nginx"
            systemctl stop nginx > /dev/null
            curl localhost &> /dev/null
            if [ $? -ne 0 ]
            then
                echo "have some problem,can't stop nginx"
            else
                echo "nginx is stopped"
            fi
            continue
            ;;
          4)
            echo "restart nginx"
            systemctl restart nginx > /dev/null
            sleep 1
            curl localhost &>/dev/null
            if [ $? -ne 0 ]
            then
                /usr/sbin/nginx
                sleep 1
                curl localhost $>/dev/null
                if [ $? -ne 0 ]
                then
                    echo "can't restart nginx"
                fi
            else
                echo "nginx has been restarted"
            fi
            continue
            ;;
          5)
            echo "reload nginx"
            systemctl reload nginx > /dev/null
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
