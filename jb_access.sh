#!/bin/bash
#
# Created by Hanief Harun
# Email: hanief.harun@ceridian.com
# Website: https://skrinhitam.wordpress.com/
# GitHub: https://github.com/mhanief/
# Last update: 29/11/2021 (DD/MM/YYYY)
# Project: Workcloud
# Description: Access to Workcloud Jumpboxes
#
# Environment IP Adress
prd="XXX.XXX.XXX.XXX"
sch="XXX.XXX.XXX.XXX"
snd="XXX.XXX.XXX.XXX"
dev="XXX.XXX.XXX.XXX"
#
# Require user input
echo "Please Select the Environment"
echo
echo "1 = Production"
echo "2 = Schaeffler"
echo "3 = Sandbox"
echo "4 = Development"
echo
#
read -p "Environment: " env
###########################################################
# if else Statement Example for further reference
#
# if  [[ $env = 1 ]]
# then
#       echo "your env ${prd}"
# elif [[ $env = 2 ]]
# then
#       echo "your env ${sch}"
# elif [[ $env = 3 ]]
# then
#       echo "your env ${snd}"
# elif [[ $env = 4 ]]
# then
#       echo "your env ${dev}"
# else
#       printf "\nPlease select the correct option\n\n"
# fi
###########################################################
#
# Selection function goes here
#
if  [[ $env = 1 ]]
then
        ssh -i ~/.ssh/infra-prod-ec2-linux.pem corp-it@$prd
elif [[ $env = 2 ]]
then
        ssh -i ~/.ssh/infra-prod-ec2-linux.pem corp-it@$sch
elif [[ $env = 3 ]]
then
        ssh -i ~/.ssh/infra-prod-ec2-linux.pem corp-it@$snd
elif [[ $env = 4 ]]
then
        ssh -i ~/.ssh/infra-prod-ec2-linux.pem corp-it@$dev
else
        printf "\nSelected Environment is not valid or currently not available"
        printf "\nPlease select other Environment\n\n"
fi
# End of selection
# End of script
