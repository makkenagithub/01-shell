#!/bin/bash

# this scrpit is to backup the files from source dir and zip them and place to destination dir.
# User provides the source dir, destination dir and number of days old to backup the files.
# if user does not provide number of days , then default value is 14 days

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}   #if $3 is empty , default is 14 days. 
TIME_STAMP="$(date +%F-%H-%M-%S)"

if [ $# -lt 2 ]
then 
    echo "USAGE:: 18-backup.sh <source dir> <dest dir> <days(optional)>"
    exit 1
fi

#check source directory exist or not
if [ ! -d $SOURCE_DIR ]
then
    echo "source directory $SOURCE_DIR does not exist"
    exit 1
fi

#check destination directory exist or not
if [ ! -d $DEST_DIR ]
then
    echo "source directory $DEST_DIR does not exist"
    exit 1
fi

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +$DAYS)

if [[ ! -z $FILES ]]  # if $FILES is not empty. single [ gave error initially. [[ worked fine 
then
    echo "Files older than $DAYS exist"
    ZIP_FILE="$DEST_DIR/app-logs-$TIME_STAMP.zip"
    find $SOURCE_DIR -name "*.log" -mtime +$DAYS | zip $ZIP_FILE -@ # -@ is to zip all the files found
    if [ -f $ZIP_FILE ]
    then
        echo "Successfully zipped the files older than $DAYS"
        #now remove the files in source directory
        while IFS=  read -r file
        do
            echo "deleting the file: $file"
            rm -rf $file
        done <<< $FILES
    else
        echo "Zipping failed"
        exit 1
    fi

else
    echo "No files exist older than $DAYS"
    exit 1
fi
