#!/bin/bash

date=$(date)
echo "Current date and time is: $date"

echo "please enter your username:"
read username
echo "enter your passwd:"
read passwd

echo "please enter your username:"
read -s username
echo "please enter your passwd:"
read -s passwd
