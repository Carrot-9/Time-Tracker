#!/bin/bash

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
        printf "\nTime is up!\n"
    else 
        printf  " \nThat is not a valid response."
        options_list
    fi
}

printf "\nWelcome to Time Tracker!\n\nOptions List:\n"

options_list () {
    printf "\n(1) Set Timer:\n\n"
    printf "(2) Set Alarm:\n\n"
    printf "(3) Exit:\n\n"
    read o_input
    
    if [[ "$o_input" == 1 ]]; then
        set_timer
    elif [[ "$o_input" == 2 ]]; then
        set_alarm
    elif [[ "$o_input" == 3 ]]; then
        printf "\nExiting Time Tracker..."
        sleep 1
        exit 0
    else 
        printf "\nThat is not a valid response, please try again.\n\n"
        options_list
    fi
}
options_list

