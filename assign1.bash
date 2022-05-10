#!/bin/bash

#### assign1.bash ####
## Assignment 1 CS3424 Systems Programming ##
## Author: Aidan Chang  rnl094  Section 0B2 Spring 2022 ##
## this is a bash script to fulfill the requirements in Assignment 1
## continuous while loop program that uses create.bash, read.bash, update.bash, delete.bash
## program that can take input from user to create item files with info, read, update, and delete

##while loop code is from lecture 2 notes, continues until user presses ctrl+d
go=0
while [ $go ]; do
    echo "Enter one of the following actions or press CTRL-D to exit."
    echo "C - create a new item"
    echo "R - read an existing item"
    echo "U - update an existing item"
    echo "D - delete an existing item"
    if ! read ans; then
    # got EOF
    break
    fi

    case "$ans" in
        [Cc]) bash create.bash
        break
        ;;

        [Rr]) bash read.bash
        break
        ;;

        [Uu]) bash update.bash
        break
        ;;

        [Dd]) bash delete.bash
        break
        ;;

        #anything other than c, r, u, d
        *) echo "ERROR: invalid option" # reload loop, not a menu option
        ;;
    esac
done