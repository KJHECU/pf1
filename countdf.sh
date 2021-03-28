#!/bin/bash
# Kyle Hicks 10403615

# set some placeholder values to track counts of empty/not empty files and directories
ne_file=0
e_file=0
ne_dir=0
e_dir=0

# store the default variable in a manner than can be enumerated
path="${1}/*"

# for the path provided, loop over each item
for item in $path
do

# if the item is a file then test if file is empty or non empty and increase the appropriate count by 1
    if [ -f $item ]; then
        if [ -s $item ]; then
            ((ne_file++))
        else
            ((e_file++))
        fi

# if the item is a directory then test if directory is empty or non empty and increase the appropriate count by 1 
    elif [ -d $item ]; then
        if [ "$(ls -A $item)" ]; then
            ((ne_dir++))
        else
            ((e_dir++))
        fi
    fi
done

# output the path and count stored in variables
echo -e "the [$1] directory contains:\n$ne_file files that contain data\n$e_file files that are empty\n$ne_dir non-empty directories\n$e_dir empty directories"



