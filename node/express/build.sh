#!/bin/bash

SCRIPT_PATH=$(dirname "$0")

function build_express
{
    echo "Path: $SCRIPT_PATH"
    echo "Building Express ... "
    PWD=$(pwd)
    cd "$SCRIPT_PATH/ExpressApp" || return 1
        echo "===> Updating npm ... "
        echo "===> [DEBUG] Current path: $(pwd)"
        exit_code=0
        npm update > /dev/null
        exit_code=$?
    cd "$PWD" || return 1
    return $exit_code
}

build_express