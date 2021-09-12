#!/bin/bash
DIR=$1
read -p "Enter the word for searcing : " word
n=$( find $DIR -type f -size +0b | xargs grep -c "$word" )
echo -e " files matching given word : \n $n "
read -p "Enter to continue" 