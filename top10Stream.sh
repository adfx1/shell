#!/bin/bash
###############################################################################
# Author        : Tang Zhongliang
# Email         : chaoxcores@gmail.com
# Last modified : 2019-11-29 21:15
# Filename      : top10Stream.sh
# Description   : 
##############################################################################

# 思路是先取出访问量前10的IP，然后再取出他们的请求流量和
# 打印输出IP对应的流量和即可

#!/bin/bash
# 取出按照访问排名取出IP
ip=($(cat /var/log/nginx/access.log |awk '{print $1}'| sort |uniq -c|sort -rn -k1 |head|awk '{print $2}'))
stream=0
for i in ${ip[*]}
do
  # 由于awk中只有{}内支持变量，所以先使用egrep取出ip所在的行再交由awk处理
  stream=$(cat /var/log/nginx/access.log |egrep "$i"|awk '{sum=sum+$10} END {print sum}')
  echo "IP $i 使用的流量是 $stream"
done
