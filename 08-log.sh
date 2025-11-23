#!/bin/bash

ID=$(id -u)

Timestamp=$(date +%F-%H-%M-%s)

Logfile="/tmp/$0-$Timestamp.log"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "installing....$2 \e[31m FAILED \e[0m"
        exit 1
    else
        echo -e "installing.....$2 \e[32m SUCCESS\e[0m"
    fi
}

if [ $ID -ne 0 ]
then
    echo "ERROR: please run this script root access"
    exit 1
else
    echo "you are the root"
fi

yum install mysqll -y &>> $Logfile
VALIDATE $? "MYSQL" 
yum install git -y &>> $Logfile
VALIDATE $? "GIT" 