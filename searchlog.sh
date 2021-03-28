#!/bin/bash
# Kyle Hicks 10403615

rerun=false

# until the user indicates to terminate, continue the script

until [ "$rerun" = true ]; do

# gather required inputs

read -p "please provide a pattern to be searched: " pattern
read -p "Enter [1] to search for whole word match or [2] for any match: " match
read -p "Enter [1] for rows that contain the search term or [2] for rows which exclude the search term: " inverted

 # if ANY match and NOT INVERTED then output rows
    if [[ $match -eq "2" ]] && [[ $inverted -eq "1" ]]; then
            
        rowcount=$(cat access_log.txt | grep -io "$pattern" | wc -l)
        echo "$rowcount 'any' 'not inverted' rows were found"
        grep -ion $pattern access_log.txt
        echo $test1
        
    fi 

# if ANY match and INVERTED then output rows
    if [[ $match -eq "2" ]] && [[ $inverted -eq "2" ]]; then

        rowcount=$(cat access_log.txt | grep -iv "$pattern" | wc -l)
        echo "$rowcount 'any' 'inverted' rows were found"     
        grep -inv $pattern access_log.txt
        echo $test1
        
    fi 

 # if WHOLE match and NOT INVERTED then output rows
    if [[ $match -eq "1" ]] && [[ $inverted -eq "1" ]]; then
            
        rowcount=$(cat access_log.txt | grep -iow "$pattern" | wc -l)
        echo "$rowcount 'whole' 'not inverted' rows were found"
        grep -ionw $pattern access_log.txt
        echo $test1
        
    fi 

# if WHOLE match and INVERTED then output rows
    if [[ $match -eq "1" ]] && [[ $inverted -eq "2" ]]; then

        rowcount=$(cat access_log.txt | grep -ivw "$pattern" | wc -l)
        echo "$rowcount 'whole' 'inverted' rows were found"     
        grep -invw $pattern access_log.txt
        echo $test1
        
    fi 

# ask the user if they would like to perform another search, if not terminate the script
read -p "Enter 1 to perform another search or anything else to exit:" another

    if [[ $another -ne "1" ]]; then
        rerun=true
        echo "Script now terminating..."
        
    fi

done

exit 0