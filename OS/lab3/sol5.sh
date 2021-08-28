#!/bin/bash

#find factorial of number
NUM=$1
FACT=1
while [ $NUM -gt 1 ]
do
	FACT=$((FACT*NUM))
	NUM=$((NUM-1))
done

echo "Factorial of $NUM is $FACT"
read -p "Press any key to continue..."

#./sol5.sh 5
