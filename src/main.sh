#!/bin/bash

start=$SECONDS

file_access () {
    printf "\nEntering...\n\n"
    sleep 1
    printf "Which file do you want to check the access time of? Type * to check the access time of all files.\n"
    read input
    
}

file_read () {
    printf "Entering...\n\n"
    sleep 1 
    printf "Which file do you want to check the read time of? Type * to check the read time of all files.\n"
    read input
}

set_timer () {
    printf "Entering...\n\n"
    sleep 1 
    printf "Start timer on this folder or on a specifc file?\n\n"
    printf "(1) Folder\n\n"
    printf "(2) File\n\n"
    read input
}

set_alarm () {
    printf "Entering...\n\n"
    sleep 1 
    printf " Set alarm on this folder or on a specific file?\n\n"
     printf "(1) Folder\n\n"
    printf "(2) File\n\n"
    read input
}

printf "\nWelcome to Time Tracker!\n\nOptions List:\n\n"

options_list () {
printf "(1) Get file access time:\n\n"
printf "(2) Get file read time:\n\n"
printf "(3) Set Timer:\n\n"
printf "(4) Set Alarm:\n\n"
printf "(5) Exit:\n\n"
read input

if [[ "$input" == 1 ]]; then
    file_access
elif [[ "$input" == 2 ]]; then
    file_read
elif [[ "$input" == 3 ]]; then
    set_timer
elif [[ "$input" == 4 ]]; then
    set_alarm
elif [[ "$input" == 5 ]]; then
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

printf "\nExit Status: $?"
duration=$(( SECONDS - start ))
printf "Duration: $duration seconds"

