#bash script
access_token=$(cat token.txt)
domain=$(cat domain.txt)
read -rp "username: " -e username
url=$domain/api/user/$username

response=$(curl -X DELETE -H "Accept: application/json" -H "Authorization: Bearer $access_token" $url)
echo $response
