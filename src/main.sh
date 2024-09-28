#!/bin/bash

set -x

exec 5> debug_output.txt
BASH_XTRACEFD="5"

file_creation () {
    printf "\nChecking...\n\n"
    sleep 1 
    files=$( stat -c "%n %w" * | sort )
    printf "File Creation Times:\n\n$files"
    options_list 
}

file_access() {
    printf "\nChecking...\n\n"
    sleep 1 
    a_files=$( stat -c "%n %x" * | sort )
    printf "File Access Times:\n\n$a_files"
    m_files=$( stat -c "%n %y" * | sort)
    printf "\n\nFile Modification Times:\n\n$m_files"
    options_list
}

set_alarm() {
    printf "\nChecking...\n\n"
    sleep 1
    printf "How long do you want to set the alarm for? Answer in seconds.\n" 
    read a_input
    if  [[ "$a_input" =~ ^[0-9]+$ ]]; then
        while [[ "$a_input" -gt 0 ]]; 
        do
            sleep 1 
            (( a_input -= 1 ))
        done
        printf "\nTime is up!\n\n"
        printf "Time is up!\n\n"
        printf "Time is up!\n\n"
    else 
        printf  " \nThat is not a valid response."
        options_list
    fi
}

set_timer() {
    printf "\nChecking...\n\n"
    sleep 1 
    printf "Starting Timer...\n\n"
    printf "Press Ctrl + C to stop timer.\n\n"
    count=0
    while : ;
    do
        sleep 1 
        ((count+=1))
    done
}

ctrl_c() {
    printf "Timer: $count seconds"
    exit 0
}
trap ctrl_c INT

printf "\nWelcome to Time Tracker!\n\nOptions List:\n"

options_list () {
    printf "\n\n(1) Get file creation times:\n\n"
    printf "(2) Get file access and modification times:\n\n"
    printf "(3) Set Alarm:\n\n"
    printf "(4) Set Timer:\n\n"
    printf "(5) Exit:\n\n"
    read o_input
    
    if [[ "$o_input" == 1 ]]; then
        file_creation
    elif [[ "$o_input" == 2 ]]; then
        file_access
    elif [[ "$o_input" == 3 ]]; then
        set_alarm
    elif [[ "$o_input" == 4 ]]; then
        set_timer
    elif [[ "$o_input" == 5 ]]; then
        printf "\nExiting Time Tracker..."
        sleep 1
        exit 0
    else 
        printf "\nThat is not a valid response, please try again.\n\n"
        options_list
    fi
}
options_list

