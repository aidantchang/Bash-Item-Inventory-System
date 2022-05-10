#!/bin/bash

#### create.bash ####
## Assignment 1 CS3424 Systems Programming ##
## Author: Aidan Chang  rnl094  Section 0B2 Spring 2022 ##
## this is a bash script to fulfill the requirements in Assignment 1
## reads item from item number input, fills in new file in /data

## item info formatting from user input
# i. Item number: (four digit integer)
# ii. Simple name: (string with no whitespace)
# iii. Item name: (string)
# iv. Current quantity: (integer)
# v. Maximum quantity: (integer)
# vi. Description: (string)


# prompt for item number
read -p "Item number:   " item_no
#filename is number.item
fileName=$item_no.item

cd data
# logic to see if file exists, -s flag returns 0 if doesn't exist
# 0 for test means true
if [ -s $fileName ]; then
    echo "ERROR: item already exists"
    cd ..
    bash assign1.bash # continue with loop
else

    # file does not exist yet
    read -p "Simple name:   " simple_name
    read -p "Item name:   " item_name
    read -p "Current quantity:   " curr_quantity
    read -p "Maximum quantity:   " max_quantity
    read -p "Description:   " description

    # creating and writing to new file
    echo "$simple_name $item_name" > $fileName
    echo "$curr_quantity $max_quantity" >> $fileName
    echo "$description" >> $fileName

    # logging to queries.log
    date=`date "+%Y-%m-%d %H:%M:%S"`
    echo "CREATED: $date - $simple_name" >> queries.log

    cd ..
    bash assign1.bash # continue with loop
fi