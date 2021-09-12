#!/bin/bash
DIR=$1
n=$( find $DIR -mtime -1 )
echo -e " files moddified in 24 hours are : \n $n" 
read -p "Enter to continue" 