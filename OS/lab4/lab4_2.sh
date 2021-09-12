#!/bin/bash



FILE=$1
n=$( grep -cx '\s*' $FILE )
echo "$n"
read -p "Enter to continue" 