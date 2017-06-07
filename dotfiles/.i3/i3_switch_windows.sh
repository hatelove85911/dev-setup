#!/bin/bash

if [ -z $@ ]
then
function gen_windows()
{
    i3-msg -t get_marks | tr ',' '\n' | tr -d '[]"'
}

gen_windows
else
    window=$@

    if [ -n "${MARK}" ]
    then
        i3-msg [con_mark="${MARK}"] focus &>/dev/null
    fi
fi
