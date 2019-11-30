#!/bin/bash
###############################################################################
# Author        : Tang Zhongliang
# Email         : chaoxcores@gmail.com
# Last modified : 2019-11-29 10:11
# Filename      : webstatus.sh
# Description   : 
##############################################################################

read -p "Please input your website address: " web
webstatus=$(curl -o /dev/null -s -w "%{http_code}\n" ${web})
if [ $webstatus -lt 400 ]
then
  echo "This site is OKay!!!"
else
  echo "Your site Maybe have some problems..."
fi
