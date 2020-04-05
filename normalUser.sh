#!/bin/bash
###############################################################################
# Author        : Tang Zhongliang
# Email         : chaoxcores@gmail.com
# Last modified : 2019-11-30 12:56
# Filename      : normalUser.sh
# Description   : 
##############################################################################

normal_user=0
fake_user=0
#array=()
#shell=$(cat /etc/passwd|awk -F ":" '{print $NF}')
#user=$(cat /etc/passwd|awk -F ":" '{if($NF=="/bin/bash") print $1 $NF}')
#max_id=$(cat /etc/passwd|awk -F ":" '{print $3}'|sort -rn -k1|head -1)
#min_id=$(cat /etc/passwd|awk -F ":" '{if(! $NF=="/bin/bash") print $3}'|sort -rn -k1|head -1)

id=($(cat /etc/passwd|awk -F ":" '{print $3}'))
#for i in $(seq $min_id $max_id)
for i in ${id[*]}
do
  shell=$(cat /etc/passwd|awk -F ":" "{if($i==\$3)print \$NF}" )
  if [ "$shell" != "/bin/bash" -a "$shell" != "/bin/zsh" ]
  then
    let fake_user++
  else
    user=$(cat /etc/passwd|awk -F ":" "{if($i==\$3) print \$1}")
    echo "普通用户: ${user}"
    let normal_user++
  fi
done
echo "一共有: ${normal_user} 普通用户"
