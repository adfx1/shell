read -p "profix: " profix
if [ -z $profix ]
then
  echo "don't input empty"
  exit
fi

read -p "how many user you want to creat: " num
expr $num + 1 &> /dev/null
if [ $? -ne 0 ]
then
  echo "please input intager"
  exit
fi

for i in $(seq 1 $num)
do
  id ${profix}${i} &> /dev/null
  if [ $? -eq 0 ]
  then
    echo "User ${profix}${i} exist,will be deleted"
    echo "userdel -r ${profix}${i}"
  else
    echo "User ${profix}${i} not found"
  fi
done
