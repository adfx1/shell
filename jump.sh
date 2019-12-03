#!/bin/bash
###############################################################################
# Author        : Tang Zhongliang
# Email         : chaoxcores@gmail.com
# Last modified : 2019-12-02 15:49
# Filename      : jump.sh
# Description   : 
##############################################################################
#################################################
# 提示用户输入信息，并进行简单验证
# 用户身份有两种：开发者、运维
# 开发者拥有部分服务器权限，使用普通用户登录
# 可以进一步开发，用户想要使用的用户如果不存在，询问用户是否创建此用户
# 运维拥有全部服务器权限，使用root用户登录
#################################################

normal_list()
{
    echo "Who're you?"
    echo "devloper or manager"
    read -p "Input your ID：" id
    case $id in
        devloper)
            echo "WELCOME,DEVLOPER!"
            devloper_list 
            continue
            ;;
        manager)
            echo "WELCOME,MANAGER!"
            manager_list 
            break
            ;;
        *)
            echo "sorry,i dont know"
            continue
            ;;
    esac
}

manager_list()
{
    cat << EOF
        ------------------------
        lb01=10.0.0.5
        lb02=10.0.0.6
        web01=10.0.0.7
        web02=10.0.0.8
        web03=10.0.0.9
        db01=10.0.0.51
        db02=10.0.0.52
        nfs=10.0.0.31
        backup=10.0.0.41
        zabbix=10.0.0.61
        openvpn=10.0.0.233
        ------------------------
EOF
    manager_connt 
    manager_list
}

devloper_list()
{
    cat << EOF
    ---------------------
    web01=10.0.0.7
    web02=10.0.0.8
    web03=10.0.0.9
    db01=10.0.0.51
    db02=10.0.0.52
    ---------------------
EOF
    devloper_connt 
    devloper_list
}

manager_connt()
{
    read -p "which machine you want to login:" target
    sshpass -p '123' ssh root@$target
}

devloper_connt()
{
    read -p "which user you want to use: " user
    read -p "which machine you want to login: " target
    check_user $user $target
    if [ $? -eq 0 ]
    then
        read -p "请输入密码: " user_passwd
        sshpass -p "$user_passwd" ssh $user@$target
        # # 计算错误次数，当错误次数大于3时退出
        # if [ $? -ne 0 ]
        # then
        #     let error++
        # fi
        # if [ $error -gt 3 ]
        # then
        #     echo "错误次数过多"
        #     break
        # fi
    else
        echo "发生未知错误，请自行检查"
    fi
}

check_user()
{
    sshpass -p '123' ssh root@$target id $user &> /dev/null
    if [ $? -ne 0 ]
    then
        read -p  "$user 不存在 $target 上，是否创建？(y/n)" allow
        case $allow in
            y|yes|Y)
                echo "创建用户..."
                sshpass -p '123' ssh root@$target "useradd $user"
                sshpass -p '123' ssh root@$target "echo "123"|passwd --stdin $user" &> /dev/null
                if [ $? -eq 0 ]
                then
                     echo "已创建用户$user,默认密码:123"
                     devloper_connt
                fi
                devloper_list
                ;;
            n|N|no)
                break
                ;;
        esac
    fi
}


while :
do
    normal_list
done
