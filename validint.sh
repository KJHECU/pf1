#!/bin/bash
# Kyle Hicks 10403615

tested=false

# until valid input is provided continue prompting the user

until [ "$tested" = true ]; do

    # obtain a two digit code from the user
    read -p "Enter a two digit numeric code:" num

    # if the user provides the number 20 or 40 then terminate the script otherwise reject and prompt the user to try again
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