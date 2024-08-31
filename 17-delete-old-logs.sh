#!/bin/bash

#deleting logs older than 14 days

SOURCE_DIR="home/ec2-user/logs"

if [ -d $SOURCE_DIR ]
then
    echo "$SOURCE_DIR exists"
else
    echo "$SOURCE_DIR does not exist"
    exit 1
fi

$FILES=(find $SOURCE_DIR -name "*.log" -mtime +14)

echo "Files are: $FILES"

#while loop: IFS is internal filed separator. Its empty here. It ignores while space.
# -r is not to ignore special characters like /
while IFS= read -r file
do 
    echo "deleting the file: $file"
    rm -rf $file
done <<< $FILES     # FILES is given as input to while loop.


