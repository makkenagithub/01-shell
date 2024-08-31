#!/bin/bash

#usage of trap function

set -e

FAILURE(){
    echo"Failed at line number: $1 and command is: $2"

}

#ERR is error signal. When error occurs it calls trap function FAILURE()
# $LINENO and $BASH_COMMAND already predefined in bash
trap 'FAILURE "$LINENO" "$BASH_COMMAND"' ERR  

echo "hello world"
echooo "helo world failed"
echo "hello world after failue"

