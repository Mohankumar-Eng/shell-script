#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo -e "\e[31m ERROR: : You must be run this script as root user \e[0m"
    exit 1
else
    echo -e "\e[32m You are the root user, you can run this script \e[0m"
fi

