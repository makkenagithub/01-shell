#!/bin/bash

THRESHOLD=75
DISK_USAGE=$(df -hT | grep xfs)  # displays the xfs type file systems and their memory usages


while IFS= read -r LINES
do
    CURRENT_USAGE=$(echo $LINES | awk -F " " '{print $6F}' | cut -d "%" -f1)    #6F gets 6th fragment and cut % filed
    PARTITION=$(echo $LINES | awk -F " " '{print $NF}') #NF is to get last fragment
    if [ CURRENT_USAGE -ge THRESHOLD ]
    then
        echo "Filesystem $PARTITION is $CURRENT_USAGE% full. Please check."
    fi
done <<< $DISK_USAGE 
