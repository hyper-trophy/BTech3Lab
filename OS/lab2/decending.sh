
#!/bin/bash

NUM=$1
while [ $NUM -gt 0 ]
do
    echo "$NUM "
    NUM=$((NUM-1))
done
read -p "Press any key to continue..."

