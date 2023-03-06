#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################

MYIP=$(curl -sS ipv4.icanhazip.com)
domain=$(cat /usr/local/etc/xray/domain)
pathtrojan=$(cat /usr/local/hidessh/trojan.txt)
pathtrojangprc=$(cat /usr/local/hidessh/trojangprc.txt)
none=80
tls=443
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
read -rp "User: " -e user
user_EXISTS=$(grep -w $user /usr/local/etc/xray/config.json | wc -l)
if [[ ${user_EXISTS} == '1' ]]; then
clear
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "                  ${WB}Add Trojan Account${NC}                "
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "${YB}A client with the specified name was already created, please choose another name.${NC}"
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
exit 0;
fi
done

read -p "Password (UUID): " uuid

if [[ "$uuid" == "" ]]; then
 echo "Password is required!"
 exit 1
fi

masaaktif=90
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#trojan$/a\#& '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /usr/local/etc/xray/config.json
sed -i '/#trojan-grpc$/a\#& '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /usr/local/etc/xray/config.json

trojanlink="trojan://$uuid@$domain:$tls?path=$pathtrojan&security=tls&host=$domain&type=ws&sni=$domain#$user"
trojanlink1="trojan://${uuid}@$domain:$none?path=$pathtrojan&security=none&host=$domain&type=ws#$user"
trojanlink2="trojan://${uuid}@$domain:$tls?security=tls&encryption=none&type=grpc&serviceName=$pathtrojangrpc&sni=$domain#$user"
sleep 1 && systemctl restart xray > /dev/null 2>&1
clear
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | tee -a /etc/log-create-user.log
echo -e "        TROJAN ACCOUNT         " | tee -a /etc/log-create-user.log
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | tee -a /etc/log-create-user.log
echo -e "Remarks : ${user}" | tee -a /etc/log-create-user.log
4echo -e "Host/IP : ${domain}" | tee -a /etc/log-create-user.log
echo -e "port : ${tls}" | tee -a /etc/log-create-user.log
echo -e "Key : ${uuid}" | tee -a /etc/log-create-user.log
7 echo -e "Path : ${pathtrojan}" | tee -a /etc/log-create-user.log
echo -e "ServiceName : ${pathtrojangprc}" | tee -a /etc/log-create-user.log
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | tee -a /etc/log-create-user.log
echo -e "Link WS : ${trojanlink}" | tee -a /etc/log-create-user.log
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | tee -a /etc/log-create-user.log
echo -e "Link Non TLS : ${trojanlink1}" | tee -a /etc/log-create-user.log
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | tee -a /etc/log-create-user.log
echo -e "Link GRPC : ${trojanlink2}" | tee -a /etc/log-create-user.log
echo "" | tee -a /etc/log-create-user.log