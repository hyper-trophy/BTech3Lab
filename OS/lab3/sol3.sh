#!/bin/bash

#count number of files in given directory
DIRPATH=$1
echo "Number of files: "
find $DIRPATH -type f | wc -l
read -p "Press enter to continue"
