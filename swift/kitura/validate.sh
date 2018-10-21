#!/bin/bash

SCRIPT_PATH=$(dirname "$0")
source "$SCRIPT_PATH/../../scripts/utils/validator.sh"
source "$SCRIPT_PATH/../../scripts/utils/utils.sh"

function validate_kitura {
    echo "Path: $SCRIPT_PATH"
    echo "Building Kitura ... "
    PWD=$(pwd)
    cd "$SCRIPT_PATH/KituraApp" || return 1
        echo "===> [DEBUG] Current path: $(pwd)"
        exit_code=0
        echo "===> Run server ... "
        app="$(find $(pwd)/.build -name KituraApp -type f -perm +0111 | grep release)"
        if [[ -z "${app// }" ]]; then
            echo "There is no suitable app for validating. Return 1"
            cd "$PWD" && return 1
        fi
        # TODO: what if the releae binary is missing?
        echo "===> [DEBUG] $app"
        $app > /dev/null &
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

validate_kitura