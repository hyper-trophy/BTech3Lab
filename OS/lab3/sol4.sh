#!/bin/bash
# copy content of file1 to file2
# if file2 exists, it will be overwritten
FILE1PATH=$1
FILE2PATH=$2

if [ -f $FILE1PATH ]
then
	echo "File $FILE1PATH exists"
	if [ -f $FILE2PATH ]
	then
		echo "File $FILE2PATH exists"
		echo "Overwriting file $FILE2PATH"
		cp $FILE1PATH $FILE2PATH
	else
		echo "File $FILE2PATH does not exists"
        echo "Creating file $FILE2PATH"
        echo "Copying file $FILE1PATH to $FILE2PATH"
		cp $FILE1PATH $FILE2PATH
	fi
else
	echo "File $FILE1PATH does not exists"
fi
    read -p "Press any key to continue..."
    
#./sol4.sh "./sol1.png" "./sol1_copy.png"