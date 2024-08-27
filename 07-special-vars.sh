#!/bin/bash

echo "All the variables passed to scrpit are: $@"
echo "Number of variables passed to scrpit: $#"
echo "CUrrently executing script name is: $0"
echo "current working directoty $PWD"
echo "home directory of current user: $HOME"
echo "PID of current script: $$"
sleep 100 &
echo "PID of the last running background command: $!"

