#!/bin/bash

echo "Enter 1 for logged in users" 
echo "Enter 2 for getting Calender"
echo "Enter 3 for todays date"
read -p "Enter your choice: " choice

case $choice in
    "1")
        w
    ;;
    "2")
        cal
    ;;
    "3")
        date
    ;;
    *)
        echo "Invalid input"
esac

