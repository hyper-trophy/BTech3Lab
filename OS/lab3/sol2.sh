#!/bin/bash
#check whether the given argument is a file or directory
if [ -f $1 ];
then
    echo "$1 is a file"
elif [ -d $1 ];
then
    echo "$1 is a directory"
fi
    read -p "press any key to continue"


