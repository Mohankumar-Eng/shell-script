#!/bin/bash

file="/etc/passwd"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ ! -f $file ]
then
    echo -e "$R source filr : $file does not exit $N"
    exit 1
fi

while IFS= ":" read -r username password userid groupid userfullname homedir shellpath
do
    echo "user name:$user_name"
    echo "user id:$user_id"
    echo "user_fullname: $user_fullname"
done < $file