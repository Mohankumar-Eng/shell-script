#!/bin/bash

ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

Timestamp=$(date +%F-%H-%M-%S)
Logfile="/tmp/$0-$Timestamp.log"

echo "Script started executing at $Timestamp" &>> $Logfile

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2....$R Failed$N"
    else
        echo -e "$2.....$G Success$N"
    fi
}

if [ $ID -ne 0 ]
then
    echo -e "$R ERROR: Please run this script with root access$N"
else
    echo  "your are the root"
fi

for package in $@
do
    yum list installed $package &>> $Logfile
    if [ $? -ne 0 ]
    then
        yum install $package -y &>> $Logfile
        VALIDATE $? "installation of $package"
    else
        echo -e "installation of $package is already installed...$Y Skipping$N"
done