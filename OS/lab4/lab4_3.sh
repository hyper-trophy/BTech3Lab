#!/bin/bash
DIR=$1
n=$( find $DIR -size +10b | xargs ls -1hsS )
echo -e "files having size greater than 10b \n $n "
count=$( find $DIR -size +10b | xargs ls -1hsS | wc -l )
echo "number of files : $count"
read -p "Enter to continue" 