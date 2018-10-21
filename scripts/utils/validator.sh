#!/bin/bash

signal=KILL

function validate()
{
    counter=$1
    title=$2
    echo -n "Test $counter - $title: "
    shift 2
    cmd="http --check-status --ignore-stdin --timeout=2.5 $*"
    if $cmd &> /dev/null; then
        echo 'OK'
        return 0
    else
        case $? in
            2) echo 'Request timed out!' ;;
            3) echo 'Unexpected HTTP 3xx Redirection!' ;;
            4) echo 'HTTP 4xx Client Error!' ;;
            5) echo 'HTTP 5xx Server Error!' ;;
            6) echo 'Exceeded --max-redirects=<n> redirects!' ;;
            *) echo 'Other Error!' ;;
        esac
        echo "===> [DEBUG][HTTP] $cmd"
        return 1
    fi
}


function validator()
{
    port=$1
    exit_code=0
    titles=(
        "Basic API versioning"
        "Create new user"
        "Router parameter handling"
        "Rename user with id 1"
        "Delete user with id 1"
    )

    cmds=(
        "GET localhost:$port/api/1/user"
        "POST localhost:$port/api/1/user username=\"user1\""
        "GET localhost:$port/api/1/user/1"
        "PUT localhost:$port/api/1/user/1 username=\"renamed_user1\""
        "DELETE localhost:$port/api/1/user/1"
    )

    for (( i = 0; i < ${#titles[@]} ; i++ )); do
        validate "$((i+1))" "${titles[$i]}" "${cmds[$i]}" || exit_code=1
    done
    return $exit_code
}