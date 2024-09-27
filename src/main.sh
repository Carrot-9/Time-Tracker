#!/bin/bash

start=$SECONDS

file_modification () {
    printf "\nEntering...\n\n"
    sleep 1
    printf "Which file do you want to check the modification time of? Type 'All' to check the modification time of all files.\n"
    read m_input

    if [[ "$m_input" = "All" ]]; then
        printf "Checking...\n\n"
        sleep 1 
        files=$(( stat -c %n %w * | sort ))
        printf "Files:\n\n$files"
    else 
        printf "That is not a valid response, please try again."
        file_modification
    fi
}


file_read () {
    printf "Entering...\n\n"
    sleep 1 
    printf "Which file do you want to check the read time of? Type * to check the read time of all files.\n"
    read r_input
}

set_timer () {
    printf "Entering...\n\n"
    sleep 1 
    printf "Start timer on this folder or on a specifc file?\n\n"
    printf "(1) Folder\n\n"
    printf "(2) File\n\n"
    read t_input
}

set_alarm () {
    printf "Entering...\n\n"
    sleep 1 
    printf " Set alarm on this folder or on a specific file?\n\n"
     printf "(1) Folder\n\n"
    printf "(2) File\n\n"
    read al_input
}

printf "\nWelcome to Time Tracker!\n\nOptions List:\n\n"



options_list () {
    printf "(1) Get file modification time:\n\n"
    printf "(2) Get file read time:\n\n"
    printf "(3) Set Timer:\n\n"
    printf "(4) Set Alarm:\n\n"
    printf "(5) Exit:\n\n"
    read o_input
    
    if [[ "$o_input" == 1 ]]; then
        file_modification
    elif [[ "$o_input" == 2 ]]; then
        file_read
    elif [[ "$o_input" == 3 ]]; then
        set_timer
    elif [[ "$o_input" == 4 ]]; then
        set_alarm
    elif [[ "$o_input" == 5 ]]; then
        printf "\nExiting Time Tracker..."
        sleep 1
        exit 0
    else 
        printf "\nThat is not a valid response, please try again.\n\n"
        options_list
    fi
    return 0
}
options_list

printf "\nExit Status: $?\n"
duration=$(( SECONDS - start ))
printf "Duration: $duration seconds"

