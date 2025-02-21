#!/bin/bash

#Check if there is no input given
if [ $# -eq 0 ]
then
        read -p 'add host IP: ' IP
        read -p 'add host name: ' Name

#Else if input given check which have substring "10.10." (the IP)
elif [[ $1 =~ "10.10." ]]
then
        IP=$1
        Name=$2
else
        IP=$2
        Name=$1
fi

#Add host name to the system 
echo "$IP $Name.htb" >> /etc/hosts

#Enumerate the given IP
nmap -sC -sV -T5 $IP -oN /home/kali/nmap/$Name
nmap -p- -T5  $IP -oN /home/kali/nmap/$Name-allports

