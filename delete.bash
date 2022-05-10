#!/bin/bash

#### delete.bash ####
## Assignment 1 CS3424 Systems Programming ##
## Author: Aidan Chang  rnl094  Section 0B2 Spring 2022 ##
## this is a bash script to fulfill the requirements in Assignment 1
## deletes item info file based on user inputted item no.

read -p "Enter an item number:  " input_no
#filename is number.item
fileName=$input_no.item
echo $fileName

cd data
# logic to see if file exists, -s flag returns 0 if doesn't exist
# 0 for test means true
if [ -s $fileName ]; then
    # file exists

    # reading file first to find simple_name
    read -r simple_name item_name < $fileName

    # deleting
    rm "$fileName"

    # logging to queries.log
    date=`date "+%Y-%m-%d %H:%M:%S"`
    echo "DELETED: $date - $simple_name" >> queries.log

    echo "$simple_name was successfully deleted."

    cd ..
    bash assign1.bash # continue with loop

else
    # file doesn't exist
    echo "ERROR: item not found"
    cd ..
    bash assign1.bash # continue with loop
fi