#!/bin/bash

#### update.bash ####
## Assignment 1 CS3424 Systems Programming ##
## Author: Aidan Chang  rnl094  Section 0B2 Spring 2022 ##
## this is a bash script to fulfill the requirements in Assignment 1
## takes user item info, then updates file (if it exists), leaves current info if no new info is provided

read -p "Item number:   " input_no
#filename is number.item
fileName=$input_no.item

cd data
# logic to see if file exists, -s flag returns 0 if doesn't exist
# 0 for test means true
# reverse logic as create.bash
if [ -s $fileName ]; then
    # file exists

    read -p "Simple name:   " new_simple_name
    read -p "Item name:   " new_item_name
    read -p "Current quantity:   " new_curr_quantity
    read -p "Maximum quantity:   " new_max_quantity
    read -p "Description:   " new_description

    # runs all following code () in a subshell, which is all from input file $fileName
    # same logic as read.bash, but instead of printing will check if empty, then assign
    (
    # reading current var values
    read -r simple_name item_name
    read -r curr_quantity max_quantity
    read -r description

    # assigning var values if new values are not empty
    if [ ! -z $new_simple_name ]; then
        # new string is not empty
        simple_name="$new_simple_name"
    fi
    if [ ! -z "$new_item_name" ]; then
        # new string is not empty
        item_name="$new_item_name"
    fi
    if [ ! -z $new_curr_quantity ]; then
        # new string is not empty
        curr_quantity="$new_curr_quantity"
    fi
    if [ ! -z $new_max_quantity ]; then
        # new string is not empty
        max_quantity="$new_max_quantity"
    fi
    if [ ! -z "$new_description" ]; then
        # new string is not empty
        description="$new_description"
    fi

    #rewriting entire file
    echo "$simple_name $item_name" > $fileName
    echo "$curr_quantity $max_quantity" >> $fileName
    echo "$description" >> $fileName

    # logging to queries.log
    date=`date "+%Y-%m-%d %H:%M:%S"`
    echo "UPDATED: $date - $simple_name" >> queries.log
    ) < $fileName

    cd ..
    bash assign1.bash # continue with loop
else
    # file doesn't exist
    echo "ERROR: item not found"
    cd ..
    bash assign1.bash # continue with loop
fi