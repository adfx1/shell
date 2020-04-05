#!/bin/bash/file
###############################################################################
# Author        : Tang Zhongliang
# Email         : chaoxcores@gmail.com
# Last modified : 2019-11-29 19:38
# Filename      : importantFileCheck.sh
# Description   : 
##############################################################################

#array[1]=passwdMd5
#array[2]=nginxMd5
passwdMd5=$(md5sum /etc/passwd)
nginxMd5=$(md5sum /etc/nginx/nginx.conf)

while :
do
array[1]=$(md5sum /etc/passwd)
array[2]=$(md5sum /etc/nginx/nginx.conf)
if [ "${array[1]}" != "$passwdMd5" ]
then
  echo "send mail"
  passwdMd5=${array[1]}
  echo $passwdMd5
fi

if [ "${array[2]}" != "$nginxMd5" ]
then
  echo "send mail"
  nginxMd5=${array[2]}
  echo $nginxMd5
fi
done
