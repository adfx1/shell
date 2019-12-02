#!/bin/bash
i=1
sum=0
while (($i<=100))
do
  sum=$(($sum+$i))
  let i++
done
echo $sum
