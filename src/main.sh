#!/bin/bash

start=$SECONDS

file_access () {
    printf "Entering...\n\n"
    sleep 1
    printf "Which file do you want to read? Type * to read all files\n"
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

# Checks Duration 

echo "\nExit Status: $?"
duration=$(( SECONDS - start ))
echo "Duration: $duration seconds"

