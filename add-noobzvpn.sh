#!/bin/bash
IP=$(wget -qO- ifconfig.me/ip);
#bisa custom domain sendiri
domain=$(cat /etc/v2ray/domain)

read -p "Username : " Login
read -p "Password : " Pass

#custom masa aktif akun vpn 30 day
masaaktif=30 
#noobz perintah
noobzvpns --add-user $Login $Pass
noobzvpns --expired-user $masaaktif

#perintah akun ssh
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
expi="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
hariini=`date -d "0 days" +"%Y-%m-%d"`
expi=`date -d "$masaaktif days" +"%Y-%m-%d"`

clear
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | tee -a /etc/log-create-user.log
echo -e "         Noobzvpn Account Account      " | tee -a /etc/log-create-user.log
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | tee -a /etc/log-create-user.log
echo -e "Username       : $Login "
echo -e "Password       : $Pass"
echo -e "Remarks : $Login" | tee -a /etc/log-create-user.log
echo -e "Domain : $domain" | tee -a /etc/log-create-user.log
echo -e "==============================="
