#!/bin/bash

SCRIPT_PATH=$(dirname "$0")

source "$SCRIPT_PATH/utils/utils.sh"

VALIDATE_VAPOR=0
VALIDATE_KITURA=0
VALIDATE_EXPRESS=0

function usage()
{
cat << EOF
usage: $0 options
Build servers

OPTIONS:
    -h, -\? | --help
        Display these options and exit.

    --all
        Validate all frameworks

    --vapor
        Validate Vapor framework

    --kitura
        Validate Kitura framework

    --express
        Validate Express framework

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
                VALIDATE_VAPOR=1
                VALIDATE_KITURA=1
                VALIDATE_EXPRESS=1
                ;;

            --vapor)
                VALIDATE_VAPOR=1
                ;;

            --kitura)
                VALIDATE_KITURA=1
                ;;

            --express)
                VALIDATE_EXPRESS=1
                ;;

            *)
                unknownParameter $1
                ;;
        esac

        shift
    done
}


function validate
{
    cmd="$1/validate.sh"
    if $cmd; then
        echo "OK"
    else
        echo "Failed"
    fi
}

parseArgs "$@"

if [ $VALIDATE_VAPOR == 1 ]; then
    validate "$SCRIPT_PATH/../swift/vapor"
fi

if [ $VALIDATE_KITURA == 1 ]; then
    validate "$SCRIPT_PATH/../swift/kitura"
fi

if [ $VALIDATE_EXPRESS == 1 ]; then
    validate "$SCRIPT_PATH/../node/express"
fi