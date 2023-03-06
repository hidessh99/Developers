#!/bin/bash
read -p "User: " -e user

if [ "$os_name" == "Ubuntu" ]
then
         killall -9 -u $user > /dev/null 2>&1
         userdel -f -r $user > /dev/null 2>&1
elif [ "$os_name" == "Debian" ]
then
        deluser=$(ps aux | grep "${user} \[priv\]" | sort -k 72 | awk '{print $2}')
        kill "${deluser}"
        killall -u $user > /dev/null 2>&1
        userdel -f -r $user > /dev/null 2>&1
elif [ "$os_name" == "CentOS" ]
then
        pkill -u $user > /dev/null 2>&1
        userdel $user > /dev/null 2>&1
fi