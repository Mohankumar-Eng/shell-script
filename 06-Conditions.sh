#!/bin/bash

Num=$1

if[ $Num -gt 100 ]
then
    echo "given number $Num is greater than 100"
else
    echo "given number $Num is not greater than 100"
fi