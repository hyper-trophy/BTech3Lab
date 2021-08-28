#!/bin/bash

#generate fibonacci series upto nth term
N=$1
A=0
B=1
echo "Fibonacci Series upto $N terms:"
for ((i=0;i<N;i++))
do
	echo -n "$A "
	TEMP=$((A+B))
	A=$B
	B=$TEMP
done
read -p "Press any key to continue..."

# ./sol6.sh 10