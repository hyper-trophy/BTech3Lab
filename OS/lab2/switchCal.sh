
#!/bin/bash

#calculator using switch case
read -p "Enter first number: " NUM1
read -p "Enter operation: " OP
read -p "Enter second number: " NUM2

# switch case on OP
case $OP in 
    "+") 
        echo "Result: $NUM1 + $NUM2 = $((NUM1 + NUM2))"
    ;;
    "-")
        echo "Result: $NUM1 - $NUM2 = $((NUM1 - NUM2))"
    ;;
    "*")
        echo "Result: $NUM1 * $NUM2 = $((NUM1 * NUM2))"
    ;;
    "/")
        echo "Result: $NUM1 / $NUM2 = $((NUM1 / NUM2))"
    ;;
    *)
        echo "Invalid operation"
esac

read -p "Press any key to continue..."

