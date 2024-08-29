#!/bin/bash

# fucntions

UID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

#VALIDATE function
VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 installation $R failed $N, please check further"
        exit 1
    else 
        echo "$2 isnatlled $G successfully $N"
    fi
}

if [ $UID -ne 0 ]   # check root user or not
then
    echo "user does not have root previlages. please run with root previlages"
    exit 1  # exit from script
fi

dnf list installed git

if [ $? -ne 0 ] # $? is for previous command status. It gives 0 if git already installed, else non-zero
then
    echo "git does not exist, GIT is installing now"
    dnf isntall git -y
    VALIDATE $? "GIT"   #calling VALIDATE function with 2 arguments
else
    echo "git is already isnatlled"
fi


dnf list installed mysql

if [ $? -ne 0 ] # $? is for previous command status. It gives 0 if mysql already installed, else non-zero
then
    echo "mysql does not exist, mysql is installing now"
    dnf isntall mysql -y
    VALIDATE $? "MySql" #calling VALIDATE function with 2 arguments
else
    echo "mysql is already isnatlled"
fi