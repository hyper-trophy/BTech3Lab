#!/bin/bash

#find number of characters, words and lines in a file

FILEPATH=$1
echo "Contents of $1"
echo "---------------------------------"
cat $FILEPATH
echo "---------------------------------"
echo "Number of characters: " $(wc -m $FILEPATH)
echo "Number of words: " $(wc -w $FILEPATH)
echo "Number of lines: " $(wc -l $FILEPATH)
echo "---------------------------------"
read -p "Press any key to continue..."

# ./sol8.sh "./sol8_test.txt"