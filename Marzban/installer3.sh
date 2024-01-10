   #bin bash

    #bin get data
read -rp "domain (example:svr.hidessh.com) : " -e domain
read -rp "username: " -e username
read -rp "password: " -e password
read -rp "kouta (format GB example 50): " -e kouta
gb=1073741824
usage=$((kouta * gb))
echo $usage > kouta.txt
echo $domain > domain.txt

url=$domain/api/admin/token
response=$(curl -X POST -d "username=$username&password=$password&grant_type=password&scope=" -H "Accept: application/json" $url)
#echo $response
token=$(echo $response | jq -r '.access_token')
echo $token > token.txt

#add on Vmess
wget -O /usr/local/bin/add-vmess-user "https://raw.githubusercontent.com/hidessh99/Developers/main/Marzban/gen-vmess.sh"
wget -O /usr/local/bin/del-vmess-user "https://raw.githubusercontent.com/hidessh99/Developers/main/Marzban/del-vmess.sh"

#add on Trojan
wget -O /usr/local/bin/add-trojan-user "https://raw.githubusercontent.com/hidessh99/Developers/main/Marzban/gen-trojan.sh"
wget -O /usr/local/bin/del-trojan-user "https://raw.githubusercontent.com/hidessh99/Developers/main/Marzban/del-vmess.sh"

#permission
chmod +x /usr/local/bin/add-vmess-user
chmod +x /usr/local/bin/del-vmess-user
chmod +x /usr/local/bin/add-trojan-user
chmod +x /usr/local/bin/del-trojan-user

