#!/bin/bash

# This script takes 3 numbers from command line and stores the sum in a variable named threesum. 

threesum=$(($1+$2+$3))

# If the value is less than or equal to 30 then the integers and sum is output
if [ $threesum -le 30 ]; then
    echo The sum of $1 and $2 and $3 is $threesum

# Else if the value is greater than 30 then a mesage is output
elif [ $threesum -gt 30 ]; then
    echo Sum exceeds maximum allowable

else
    exit 0

fi

exit 0