#!/bin/bash

#### read.bash ####
## Assignment 1 CS3424 Systems Programming ##
## Author: Aidan Chang  rnl094  Section 0B2 Spring 2022 ##
## this is a bash script to fulfill the requirements in Assignment 1
## reads item from item number input, prints file information

read -p "Enter an item number:  " input_no
#filename is number.item
fileName=$input_no.item

cd data
# logic to see if file exists, -s flag returns 0 if doesn't exist
# 0 for test means true
# reverse logic as create.bash
if [ -s $fileName ]; then
    # file exists

    # runs all following code in a subshell, which is all from input file $fileName
    (
    read -r simple_name item_name
    read -r curr_quantity max_quantity
    read -r description
    echo "Item Name:    $item_name"
    echo "Simple Name:  $simple_name"
    echo "Item Number:  $input_no"
    echo "Qty:  $curr_quantity/$max_quantity"
    echo "Description:  $description"
    ) < $fileName

    cd ..
    bash assign1.bash # continue with loop
else
    # file doesn't exist
    echo "ERROR: item not found"
    cd ..
    bash assign1.bash # continue with loop
fi