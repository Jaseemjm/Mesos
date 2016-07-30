#!/bin/bash
file="$1"

####ARRAY DECLARATION#############
i=1;
for j in `cat $file | awk '{print $1}'`
do
   easyid[$i]=$j;
    i=$(($i+1));
done
echo " Count of records is :  ${#easyid[@]}"

i=1;
for j in `cat $file | awk '{print $2}'`
do
   date[$i]=$j;
    i=$(($i+1));
done
###########################

size=${#easyid[@]};
for ((i=1;i<=$size;i++));
do
echo "/user/local/${easyid[i]}/${date[i]}";
done
