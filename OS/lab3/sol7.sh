#!/bin/bash

#even number within the range
NUM1=$1
NUM2=$2

for (( i=$NUM1; i<=$NUM2; i++ ))
do
	if [ $((i%2)) -eq 0 ]
	then
		echo $i
	fi
done
read -p "Press any key to continue..."

# ./sol7.sh 10 30