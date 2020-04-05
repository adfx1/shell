#管理机生成、传送密钥到被管理机脚本

#!/bin/bash
#生成密钥
if [ -f /root/.ssh/id_dsa ];then
    echo "密钥已存在，将发送现有文件"
else
    ssh-keygen -t dsa -f /root/.ssh/id_dsa && echo "生成成功！"
fi
for ip in {31,41}
do
    echo "传输公钥"
    #传输公钥到目标IP
    sshpass -p123 ssh-copy-id -i /root/.ssh/id_dsa.pub 172.16.1.${ip} -o StrictHostKeyChecking=no &>/dev/null
    
    #将ssh配置文件备份
    ssh 172.16.1.${ip} "cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak"
    #设置SSH服务
    echo "设置SSH服务"
#    ssh 172.16.1.${ip} "sed -ri 's@^#Port 22@Port 9999@g' /etc/ssh/sshd_config  && echo '端口设置成功...!'"
#    ssh 172.16.1.${ip} "sed -ri 's@^#ListenAddress 0.0.0.0@ListenAddress 172.16.1.${ip}@g' /etc/ssh/sshd_config && echo '监听地址设置成功...!'" 
    ssh 172.16.1.${ip} "sed -ri 's@^#PubkeyAuthentication yes@PubkeyAuthentication yes@g' /etc/ssh/sshd_config && echo '允许密钥登录设置成功...!'" 
    ssh 172.16.1.${ip} "sed -ri 's@^#PasswordAuthentication no@PasswordAuthentication no@g' /etc/ssh/sshd_config  && echo '禁止账号密码登录设置成功...!'"

    #重启服务
    ssh 172.16.1.${ip} systemctl restart sshd
    #验证
    echo "检查中..."
#    ssh -p 9999 172.16.1.${ip} " hostname && echo " 172.16.1.${ip} 配置完成" "
    ssh  172.16.1.${ip} " hostname && echo " 172.16.1.${ip} 配置完成" "
done

