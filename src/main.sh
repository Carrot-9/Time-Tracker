#!/bin/bash

start=$SECONDS

echo "What is 2 + 2 ?:"
read question

if [[ $question = 4 ]]; then

    echo "Correct!"
else

    echo "Incorrect!"
fi

duration=$(( SECONDS - start ))
echo "Duration: $duration seconds"