#!/bin/bash
#Last updated: 07/16/2019
#This script searches through the RASP tools and replaces $FPAAHOME with an environment variable that 
#can be set by the user.

find . -type f -exec sed -i 's/\/home\/ubuntu/$FPAAHOME/g' {} +
