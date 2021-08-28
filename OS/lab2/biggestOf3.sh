#!/bin/bash

a=$1
b=$2
c=$3
echo "The biggest number is $((a>b? a>c?a:c : b>c?b:c)), press <enter> to exit"
read
