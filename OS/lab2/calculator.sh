#!/bin/bash

NUM1=$1
OP=$2
NUM2=$3

if [[ $OP = "add" ]]; then
    echo "Result: $NUM1 + $NUM2 = $((NUM1 + NUM2))"
elif [[ $OP = "sub" ]]; then
    echo "Result: $NUM1 - $NUM2 = $((NUM1 - NUM2))"
elif [[ $OP = "mul" ]]; then
    echo "Result: $NUM1 * $NUM2 = $((NUM1 * NUM2))"
elif [[ $OP = "div" ]]; then
    echo "Result: $NUM1 / $NUM2 = $((NUM1 / NUM2))"
fi 
    read -p "Press enter to continue"