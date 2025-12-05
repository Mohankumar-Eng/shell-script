#!/bin/bash

SOURCE_DIRECTORY="/tmp/shell-script-logs"
#DAYS_TO_KEEP=14
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

files_to_delete=$(find $SOURCE_DIRECTORY -type f -mtime +14 -name "*.log")

if [ ! -d $SOURCE_DIRECTORY ]
then
    echo -e "$R Source Directory : $SOURCE_DIRECTORY does not exist $N"
    exit 1
fi

while IFS= read -r line
do
    echo "Deleting file: $line"
    rm -rf
done <<< $files_to_delete

