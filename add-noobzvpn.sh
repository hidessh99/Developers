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
clear
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | tee -a /etc/log-create-user.log
echo -e "         Noobzvpn Account Account      " | tee -a /etc/log-create-user.log
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | tee -a /etc/log-create-user.log
echo -e "Username       : $Login "
echo -e "Password       : $Pass"
echo -e "Remarks : $Login" | tee -a /etc/log-create-user.log
echo -e "Domain : $domain" | tee -a /etc/log-create-user.log
echo -e "==============================="
