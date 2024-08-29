#!/bin/bash

#loops - script needs to be called as sh filename git nginx mysql

# for i in 0 1 2 3 4
# do 
#     echo $i
# done

# for i in {0..10}    # it includes 10 also
# do 
#     echo $i
# done


UID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

#VALIDATE function
VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 installation $R failed $N, please check further"
        exit 1
    else 
        echo -e "$2 isnatlled $G successfully $N"
    fi
}

if [ $UID -ne 0 ]   # check root user or not
then
    echo "user does not have root previlages. please run with root previlages"
    exit 1  # exit from script
fi


for package in $@   # $@ refers to all arguments passed to script
do
    dnf list installed $package
    if [ $? -ne 0 ] # $? is for previous command status. It gives 0 if git already installed, else non-zero
    then
        echo "$package does not exist, $package is installing now"
        dnf isntall $package -y
        VALIDATE $? "$package"   #calling VALIDATE function with 2 arguments
    else
        echo "$package is already isnatlled"
    fi
done

