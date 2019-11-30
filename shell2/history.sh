#!/bin/bash
###############################################################################
# Author        : Tang Zhongliang
# Email         : chaoxcores@gmail.com
# Last modified : 2019-11-30 14:45
# Filename      : history.sh
# Description   : 
##############################################################################

history |awk "{print \$2}"|egrep "^[a-z]+" -o|sort|uniq -c|sort -rn -k1|head
