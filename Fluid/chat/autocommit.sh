#!/bin/bash
#
# Changelog:
#     2021-01-11 Add file with timestamp to every commit.
#

#
# e_push commits and pushes all current changes using the first argument and
# the timestamp as commit message.
#
# Argument 1: commit message prefix
#
e_push () {
    timestamp=$(date)
    echo "PUSHING CODE at $timestamp"
    echo "$timestamp" > timestamp.txt
    git add -A
    git commit -m "$1 $timestamp"
    if [[ "$?" == 0 ]]; then
        return 0
    fi
    echo -e "\e[31mERROR: Commit failed!\e[0m"
    return 1
}


#
# e_periodic_push commits and pushes all changes every X seconds with a 
# timestamp as commit message.
#
# Argument 1: interval between commits
#
e_periodic_push () {
    # Check for existing git project
    git rev-parse --abbrev-ref HEAD
    if [[ "$?" -ne 0 ]]; then
        git init
        git config user.name "participant"
        git config user.email "<>"
        git add .gitignore
        git commit -m "First commit"
    fi
    git config user.name "participant"
    git config user.email "<>"
    while true; do
        success="false"
        while [[ "$success" != "true" ]]; do
            e_push "Automatic commit"
            if [[ "$?" == 0 ]]; then
                success="true"
            else
                echo -e "\e[31mTry again in 1 second.\e[0m"
                sleep 1
            fi
        done
        echo "FINISHED PUSHING CODE"
        echo "WAITING $1 seconds"
        echo ""
        echo ""
        echo ""
        sleep $1
    done
}


if [[ "$1" == "manual" ]]; then
    echo "MANUAL PUSH"
    e_push "Manual commit"
else
    e_periodic_push $1
fi
