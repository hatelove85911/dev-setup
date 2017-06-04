#!/bin/bash

if [ -z $@ ]
then
function gen_marks()
{
    i3-msg -t get_marks | tr ',' '\n' | tr -d '[]"'
}

gen_marks
else
    MARK=$@

    if [ -n "${MARK}" ]
    then
        i3-msg [con_mark="${MARK}"] focus &>/dev/null
    fi
fi
