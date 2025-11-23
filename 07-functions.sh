#!/bin/bash

ID=$(id -u)

VALIDATE() {
    if [ $1 -ne 0 ]
    then 
        echo "Installing....$2 FALIED"
        exit 1
    else
        echo "Installing......$2 SUCCESS"
    fi
}

if [ $ID -ne 0 ]
then
    echo "ERROR: please run this script with root access"
    exit 1
else
    echo "your are the root"
fi

yum install mysql -y
VALIDATE $? "MySQL"
yum install git -y
VALIDATE $? "GIT"