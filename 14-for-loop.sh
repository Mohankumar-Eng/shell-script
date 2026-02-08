#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"


if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR: : You must be run this script as root user $N"
    exit 1
else
    echo -e "$G You are the root user, you can run this script $N"
fi

VALIDATE() {
    if [ $1 -eq 0 ]
    then
        echo -e "$G $2 is installed successfully $N"
    else
        echo -e "$R ERROR: $2 is not installed $N"
    fi
}

for package in $@
do
    dnf list installed $package
    if [ $? -eq 0 ]
    then
        echo -e "$R $package is not installed $N...$G going to install it$N"
        dnf install $package -y
        VALIDATE $? "$package"
    else
        echo -e "$G $package is already installed $N"
    fi
done