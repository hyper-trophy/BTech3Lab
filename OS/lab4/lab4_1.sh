#!/bin/bash
hours=$( date +"%H" )
if [ $hours -gt 0 ] && [ $hours -lt 12 ]
then
echo "good morning"
elif [ $hours -gt 12 ] && [ $hours -lt 16 ]
then
echo "good afternoon"
elif [ $hours -gt 16 ] && [ $hours -lt 20 ]
then
echo "good evening"
else
echo "good night"
fi

read -p "Enter to continue" 