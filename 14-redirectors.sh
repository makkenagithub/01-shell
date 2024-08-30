#!/bin/bash

# saving script logs to a file

LOG_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo "$0" | awk -F "." '{print $1F}') #get the script name without .sh
TIME_STAMP=$(date +%F-%H-%M-%S) #get the timestamp with date and time
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME-$TIME_STAMP.log" # log file name

 #create the log folder. -p is used here, If the folder does not exist, then it will create
 # If the folder alredy exist, then it will not give error
mkdir -p $LOG_FOLDER   


UID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

#USAGE function
USAGE(){
    echo -e "$R USAGE:: sudo su 14-redirectors.sh package1 package2 package3 ..."
    exit 1
}

#VALIDATE function
VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 installation $R failed $N, please check further" &>>$LOG_FILE
        exit 1
    else 
        echo -e "$2 insatlled $G successfully $N" &>>$LOG_FILE
    fi
}

echo "Script satrted executing at: $(date)" &>>$LOG_FILE

if [ $UID -ne 0 ]   # check root user or not
then
    echo -e "$R user does not have root previlages. please run with root previlages $N" &>>$LOG_FILE
    exit 1  # exit from script
fi

if [ $# -eq 0 ] # If the number of arguments passed is 0 , call USAGE function and exit.
do
    USAGE
done

for package in $@   # $@ refers to all arguments passed to script
do
    dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ] # $? is for previous command status. It gives 0 if git already installed, else non-zero
    then
        echo "$package does not exist, $package is installing now" &>>$LOG_FILE
        dnf isntall $package -y &>>$LOG_FILE
        VALIDATE $? "$package"   #calling VALIDATE function with 2 arguments
    else
        echo "$package is already isnatlled" &>>$LOG_FILE
    fi
done

