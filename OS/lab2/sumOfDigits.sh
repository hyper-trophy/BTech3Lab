#!/bin/bash

read -p "Enter a number: " number
sum=0
while [ $number -gt 0 ]
do
	rem=$(( $number % 10 ))
	sum=$(( $sum + $rem ))
	number=$(( $number / 10 ))
done

echo "Sum of digits = $sum"
read -p "Press any key to continue..."
