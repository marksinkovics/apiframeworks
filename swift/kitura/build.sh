#!/bin/bash

SCRIPT_PATH=$(dirname "$0")

function build_kitura {
    echo "Path: $SCRIPT_PATH"
    echo "Building Kitura ... "
    PWD=$(pwd)
    cd "$SCRIPT_PATH/KituraApp" || return 1
        echo "===> [DEBUG] Current path: $(pwd)"
        echo "===> Updating packages ... "
        swift package update >/dev/null
        swift package generate-xcodeproj >/dev/null
        echo "===> Building packages ... "
        exit_code=0
        swift build -c release
        exit_code=$?
    cd "$PWD" || return 1
    return $exit_code
}

build_kitura