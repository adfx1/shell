#!/bin/bash
###############################################################################
# Author        : Tang Zhongliang
# Email         : chaoxcores@gmail.com
# Last modified : 2019-12-06 09:20
# Filename      : print.sh
# Description   : 
##############################################################################
read -p "number: " num
for i in $(seq 1 2 $num)
do
    for j in `seq $[$[$num-$i]/2]`
    do
        echo -n ' ' 
    done

    for m in `seq $i`
    do
        echo -n '*'
    done
    echo
done
