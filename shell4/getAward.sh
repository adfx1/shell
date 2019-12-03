#!/bin/bash
###############################################################################
# Author        : Tang Zhongliang
# Email         : chaoxcores@gmail.com
# Last modified : 2019-12-03 14:38
# Filename      : getAward.sh
# Description   : 实现简单的抽奖功能，抽中88为中奖，抽奖人数设定为2人 
##############################################################################
# 定义奖池
number=({1..99} 88)
# 定义学生池
student=({1..30})
# 循环，当计数大于大于等于2时退出
count=0
while(( $count<2 ))
do
  # 外层学生循环，控制学生
  for stu in ${student[*]}
  do
      # 抽取一个数字
      get_number=$(echo $[$RANDOM%100+1])
      # 内层数字循环删除数字避免重复
      for num in ${!number[@]}
      do
        # 当抽取的数字等于当前下标表示的数字的值时
        if [ ${get_number} -eq ${number[$num]} ]
        then
          # 在数组中删除当前数字
          unset number[$num]
        fi
      done
      # 判断抽取的数是否等于预设的中奖数字
      if [ $get_number -eq 88 ]
      then
        echo "$stu --- $get_number"
        # 计数加1
        let count++
        echo "${stu},你中奖了"
      fi
  done
done

