#!/bin/bash

# installing git and mysql

UID=$(id -u)

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
    if [ $? -ne 0 ]
    then
        echo "git installation failed, please check further"
        exit 1
    else 
        echo "git isnatlled successfully"
    fi
else
    echo "git is already isnatlled"
fi


dnf list installed mysql

if [ $? -ne 0 ] # $? is for previous command status. It gives 0 if mysql already installed, else non-zero
then
    echo "mysql does not exist, mysql is installing now"
    dnf isntall mysql -y
    if [ $? -ne 0 ]
    then
        echo "mysql installation failed, please check further"
        exit 1
    else 
        echo "mysql isnatlled successfully"
    fi
else
    echo "mysql is already isnatlled"
fi