#!/bin/bash

# red 31m
# green 32m
# yellow 33m

echo -e "\e[31m hello world"
echo "hello"
echo -e "\e[32m hello world \e[0m"
echo "hello"
echo -e "\e[33m hello world \e[0m"
echo "hello"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

echo -e "$R hello world"
echo "hello"
echo -e "$G hello world $N"
echo "hello"
echo -e "$Y hello world $N"
echo "hello"