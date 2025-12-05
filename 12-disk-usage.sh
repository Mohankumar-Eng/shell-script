#!/bin/bash

disk_usage=$(df -hT | grep -vE "tmp/file")

disk_threshold=1
mes=" "
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

while IFS= read line
do
    usage=$(echo $line | awk '{print $6f}' | cut -d % f1)
    partition=$(echo $line | awk '{print $6f}')
    if [ $usage -ge $disk_threshold ]
    then
        mes+="High disk usage on $partition: $usage\n"
    fi
done <<<$disk_usage
echo -e "message:$mes"