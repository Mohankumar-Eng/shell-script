#!/bin/bash

ID=$(id -u)

Timestamp=$(date +%F-%H-%M-%s)

Logfile="/tmp/$0-$Timestamp.log"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "installing....$2 FAILED"
    else
        echo "installing.....$2 SUCCESS"
    fi
}

if [ $ID -ne 0 ]
then
    echo "ERROR: please run this script root access"
else
    echo "you are the root"
fi

yum install mysql -y
VALIDATE $? "MYSQL" &>> Logfile
yum install git -y
VALIDATE $? "GIT" &>> Logfile