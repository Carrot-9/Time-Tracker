#!/bin/bash

start=$SECONDS

math_question ()  {
echo "What is 2 + 2 ?:"
read question

if [[ $question = 4 ]]; then

    echo "Correct!"
else

    echo "Incorrect!"
fi

return 0
}

math_question 

echo "Exit Status: $?"

duration=$(( SECONDS - start ))
echo "Duration: $duration seconds"