#!/bin/bash


SCRIPT_PATH=$(dirname "$0")

source "$SCRIPT_PATH/utils/utils.sh"

BUILD_VAPOR=0
BUILD_KITURA=0
BUILD_EXPRESS=0

function usage()
{
cat << EOF
usage: $0 options
Build servers

OPTIONS:
    -h, -\? | --help
        Display these options and exit.

    --all
        Update and build all frameworks

    --vapor
        Update and build Vapor framework

    --kitura
        Update and build Kitura framework

    --express
        Update and build Express framework

EOF
}

function parseArgs()
{
    while [ "$1" != "" ]; do
        case $1 in
            -h | -\?)
                usage
                exit
                ;;

            --all)
                BUILD_VAPOR=1
                BUILD_KITURA=1
                BUILD_EXPRESS=1
                ;;

            --vapor)
                BUILD_VAPOR=1
                ;;

            --kitura)
                BUILD_KITURA=1
                ;;

            --express)
                BUILD_EXPRESS=1
                ;;

            *)
                unknownParameter $1
                ;;
        esac

        shift
    done
}

function build
{
    cmd="$1/build.sh"
    if $cmd; then
        echo "OK"
    else
        echo "Failed"
    fi
}

parseArgs "$@"

if [ $BUILD_VAPOR == 1 ]; then
    build "$SCRIPT_PATH/../swift/vapor"
fi

if [ $BUILD_KITURA == 1 ]; then
    build "$SCRIPT_PATH/../swift/kitura"
fi

if [ $BUILD_EXPRESS == 1 ]; then
    build "$SCRIPT_PATH/../node/express"
fi
