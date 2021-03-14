#!/bin/bash

tested=false

until [ "$tested" = true ]; do
    read -p "Enter a two digit numeric code:" num

    if [[ "$num" =~ ^[0-9]{2}$ ]]; then
        if [ $num -eq 20 ] || [ $num -eq 40 ]; then
        echo You provided a valid number, script exiting ....
        tested=true
        else    
        echo Please provide a valid number
        fi
    else
        echo Please provide a numeric value
    fi
    
done

exit 0