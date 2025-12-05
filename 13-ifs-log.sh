#!/bin/bash

file="/etc/passwd"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ ! -f $file ]
then
    echo -e "$R source file : $file does not exist $N"
    exit 1
fi

while IFS=":" read -r username password userid groupid userfullname homedir shellpath
do
    echo "user name:$username"
    echo "user id:$userid"
    echo "user fullname: $userfullname"
done < $file