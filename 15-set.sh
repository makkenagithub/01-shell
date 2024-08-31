#!/bin/bash

#set command which can be used to exist the script when a failure of a command occures. 
# In previous scripts we used VALIDATE function, intsead of tht we can use set also

#set -e is to automatic exit when an error occures
#set -ex is to get more information when automatic exit, like debug mode

set -ex

echo "hello world"
echooo "helo world failed"
echo "hello world after failue"

