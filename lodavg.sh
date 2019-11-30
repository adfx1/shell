#!/bin/bash
###############################################################################
# Author        : Tang Zhongliang
# Email         : chaoxcores@gmail.com
# Last modified : 2019-11-27 10:57
# Filename      : lodavg.sh
# Description   : 
##############################################################################

nowLodAvg=$(uptime |awk -F ": " '{print $2}'|awk -F "," '{print $1}')
[ ${nowLodAvg%%.*} -ge 2 ] && echo "silly" || echo "haha"
