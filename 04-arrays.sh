#!/bin/bash

FRUITS=("apple" "orange" "kiwi") #array
echo "first fruit is: ${FRUITS[0]}"
echo "second fruit is: ${FRUITS[1]}"
echo "third fruit is: ${FRUITS[2]}"

echo "all fruits are: ${FRUITS[@]}" # all friuts. @ for all