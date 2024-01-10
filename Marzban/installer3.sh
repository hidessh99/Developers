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
echo $response
token=$(echo $response | jq -r '.access_token')
echo $token > token.txt

