while true
  do
    read -p "你想看多大的正方形:" a
    [ "$a" == "exit" ] && exit 
    expr 1 + $a &>/dev/null  
    [ $? -ne 0 ] && echo "请输入一个数字！" && exit 2
    b="■ "
    d=$(for i in `eval echo {1..$a}`;do echo -n $b; echo -n " ";done)
    
    for i in $(seq $a)
    do
      for i in $(seq $a)
      do
        echo -n $b
        echo -n "   "
      done
      echo -e "\n"
    done
done
