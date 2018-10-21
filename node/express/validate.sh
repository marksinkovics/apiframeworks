#!/bin/bash

SCRIPT_PATH=$(dirname "$0")
source "$SCRIPT_PATH/../../scripts/utils/validator.sh"
source "$SCRIPT_PATH/../../scripts/utils/utils.sh"

function validate_express
{
    echo "Path: $SCRIPT_PATH"
    echo "Validating Express ... "
    PWD=$(pwd)
    cd "$SCRIPT_PATH/ExpressApp" || return 1
        echo "===> [DEBUG] Current path: $(pwd)"
        exit_code=0
        echo "===> Run server ... "
        node src/index.js > /dev/null &
        last_pid=$!
        echo "===> [DEBUG] Pid: $last_pid"
        sleep 1
        echo "===> Run validator ... "
        validator 8080
        exit_code=$?
        echo "===> Shut down server ... "
        kill -$signal $last_pid
        wait $! 2>/dev/null
    cd "$PWD" || return 1
    return $exit_code
}

validate_express