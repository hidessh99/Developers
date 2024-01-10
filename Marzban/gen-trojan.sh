ACCESS_TOKEN=$(cat token.txt)
usage=$(cat kouta.txt)
domain=$(cat domain.txt)
tls=443
none=80

read -rp "username: " -e username
read -rp "password: " -e password
URL=$domain/api/user


# Data JSON yang akan dikirimkan
json_data='{
  "username": "'"$username"'",
  "note": "created bye panel hidessh",
  "proxies": {
	"trojan": {}
  },
  "data_limit": "'"$usage"'",
  "data_limit_reset_strategy": "no_reset",
  "status": "active",
  "inbounds": {
    "vless": [
      "VLESS_REALITY_FALLBACK",
      "VLESS_REALITY_GRPC",
      "VLESS_WS",
      "VLESS_WS_ANTIADS",
      "VLESS_WS_ANTIPORN",
      "VLESS_GRPC"
    ],
    "trojan": [
      "TROJAN_TCP",
      "TROJAN_WS",
      "TROJAN_WS_ANTIADS",
      "TROJAN_WS_ANTIPORN",
      "TROJAN_GRPC"
    ],
    "vmess": [
      "VMESS_TCP",
      "VMESS_WS",
      "VMESS_WS_ANTIADS",
      "VMESS_WS_ANTIPORN",
      "VMESS_GRPC"
    ],
    "shadowsocks": [
      "SHADOWSOCKS_TCP",
      "SHADOWSOCKS_WS",
      "SHADOWSOCKS_WS_ANTIADS",
      "SHADOWSOCKS_WS_ANTIPORN",
      "SHADOWSOCKS_GRPC",
      "SHADOWSOCKS_OUTLINE"
    ]
  }
}'


response=$(curl -X POST -d "$json_data" -H "Content-Type: application/json" -H "Accept: application/json" -H "Authorization: Bearer $ACCESS_TOKEN" $URL)

note=$(echo $response | jq -r '.note')
username=$(echo $response | jq -r '.username')
created=$(echo $response | jq -r '.created_at')
subs=$(echo $response | jq -r '.subscription_url')
uuid=$(echo $response | jq -r '.proxies.trojan.password')

trojan1=$(echo $response | jq -r '.links[0]')
trojan2=$(echo $response | jq -r '.links[1]')
trojan3=$(echo $response | jq -r '.links[2]')
trojan4=$(echo $response | jq -r '.links[3]')

urlsub=$domain$subs


clear
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | tee -a /etc/log-create-user.log
echo -e "        TROJAN ACCOUNT         " | tee -a /etc/log-create-user.log
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | tee -a /etc/log-create-user.log
echo -e "Remarks : ${username}" | tee -a /etc/log-create-user.log
echo -e "Host/IP : ${domain}" | tee -a /etc/log-create-user.log
echo -e "port : ${tls}" | tee -a /etc/log-create-user.log
echo -e "Key : ${uuid}" | tee -a /etc/log-create-user.log
echo -e "Path : " | tee -a /etc/log-create-user.log
echo -e "ServiceName : " | tee -a /etc/log-create-user.log
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | tee -a /etc/log-create-user.log
echo -e "Link WS : ${trojan2}" | tee -a /etc/log-create-user.log
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | tee -a /etc/log-create-user.log
echo -e "Link Non TLS : ${trojan3}" | tee -a /etc/log-create-user.log
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | tee -a /etc/log-create-user.log
echo -e "Link GRPC : ${trojan4}" | tee -a /etc/log-create-user.log
echo -e "Link Subcribe : ${urlsub}" | tee -a /etc/log-create-user.log
echo "" | tee -a /etc/log-create-user.log
