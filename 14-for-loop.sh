#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
LOG_FOLDER="/var/log/package-install-logs"
SCRIPT_NAME=$(echo $0 | cut -d '.' -f1)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOG_FOLDER
echo "Script execution started at: $(date)" | tee -a $LOG_FILE


if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR: : You must be run this script as root user $N" tee -a $LOG_FILE
    exit 1
else
    echo -e "$G You are the root user, you can run this script $N" | tee -a $LOG_FILE
fi

VALIDATE() {
    if [ $1 -eq 0 ]
    then
        echo -e "$G $2 is installed successfully $N" | tee -a $LOG_FILE
    else
        echo -e "$R ERROR: $2 is not installed $N" | tee -a $LOG_FILE
    fi
}

for package in $@
do
    dnf list installed $package
    if [ $? -eq 0 ]
    then
        echo -e "$R $package is not installed $N...$G going to install it$N"
        dnf install $package -y &>> $LOG_FILE
        VALIDATE $? "$package"
    else
        echo -e "$G $package is already installed $N" | tee -a $LOG_FILE
    fi
done
