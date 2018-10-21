#!/bin/bash

signal=KILL

function die()
{
    usage
    exit 1
}

function missingParameter()
{
    echo "$1" requires a parameter
    die
}

function unknownParameter()
{
    if [[ -n $2 &&  $2 != "" ]]; then
        echo Unknown argument \""$2"\" for parameter "$1".
    else
        echo Unknown argument "$1"
    fi
    die
}

function fail()
{
    1>&2 echo "$1"
    exit 1
}
