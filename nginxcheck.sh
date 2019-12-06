#!/bin/bash
###############################################################################
# Author        : Tang Zhongliang
# Email         : chaoxcores@gmail.com
# Last modified : 2019-12-06 09:50
# Filename      : nginxcheck.sh
# Description   : nginx status modify
##############################################################################
while true
do
echo "-----------------------------"
cat << EOF
1. status
2. start
3. stop
4. restart
EOF
echo "-----------------------------"

    read -p "please input whact you want: " status 
        case $status in
            1)
                curl localhost &> /dev/null
                if [ $? -ne 0 ]
                then
                    echo "not good"
                else
                    echo "nginx is healthy"
                fi
                continue
                ;;
            2)
                /usr/sbin/nginx
                sleep 1
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
                /usr/sbin/nginx -s stop
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
                /usr/sbin/nginx -s stop
                /usr/sbin/nginx
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
            *)
                echo "please input number in [1|2|3|4]"
                continue
                ;;
        esac
done