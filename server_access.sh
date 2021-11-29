#!/bin/bash
#
# Created by Hanief Harun
# Email: hanief.harun@ceridian.com
# Website: https://skrinhitam.wordpress.com/
# GitHub: https://github.com/mhanief/
# Last update: 29/11/2021 (DD/MM/YYYY)
# Project: Workcloud
# Description: Bash script to access to Workcloud server
#
# Environment IP Adress
prd="52.192.178.150"
sch="13.231.178.37"
snd="3.112.228.130"
dev="52.195.3.145"
#
# Server pem key
jumpbox_pem="infra-prod-ec2-linux.pem"
instance_pem="WorkCloud_Sandbox.pem"
#
# Require user input
read -p "Your OpsWorks ID: " ops_id
echo -e "\nPlease Select the Environment: "
echo "1 = Production"
echo "2 = Schaeffler"
echo "3 = Sandbox"
echo "4 = Development"
echo
#
read -p "Environment: " env
read -p "Server IP: " server_ip
#
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
# Select function goes here
#
if  [[ $env = 1 ]]
then
        function instance_via_jumpbox(){
        echo "Connecting to: $1"
        ssh -i ~/.ssh/$instance_pem -o "ProxyCommand ssh -W %h:%p -i ~/.ssh/$jumpbox_pem corp-it@$prd" $ops_id@$1
        }
        instance_via_jumpbox $server_ip
elif [[ $env = 2 ]]
then
        function instance_via_jumpbox(){
        echo "Connecting to: $1"
        ssh -i ~/.ssh/$instance_pem -o "ProxyCommand ssh -W %h:%p -i ~/.ssh/$jumpbox_pem corp-it@$sch" $ops_id@$1
        }
        instance_via_jumpbox $server_ip
elif [[ $env = 3 ]]
then
        function instance_via_jumpbox(){
        echo "Connecting to: $1"
        ssh -i ~/.ssh/$instance_pem -o "ProxyCommand ssh -W %h:%p -i ~/.ssh/$jumpbox_pem corp-it@$snd" $ops_id@$1
        }
        instance_via_jumpbox $server_ip
elif [[ $env = 4 ]]
then
        function instance_via_jumpbox(){
        echo "Connecting to: $1"
        ssh -i ~/.ssh/$instance_pem -o "ProxyCommand ssh -W %h:%p -i ~/.ssh/$jumpbox_pem corp-it@$dev" $ops_id@$1
        }
        instance_via_jumpbox $server_ip
else
        echo -e "\nSelected Environment is not valid or currently not available"
        echo -e "Please select other Environment\n\n"
fi
# End of selection
# End of script
