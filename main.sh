#!/bin/bash
while read command
do 
    echo -n "$(pwd) > "
    if [ "${command}" == '^L' ]
    then
        echo '^L' > /tmp/i
        tail -n $(tput cols) /tmp/i
        echo -n "$(pwd) > "
        echo ''
    else
        ${command} 1>>/tmp/i 2>&1 3>&1
        tail -n $(tput cols) /tmp/i
        echo -n "$(pwd) > "
    fi
done