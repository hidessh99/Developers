#!/bin/bash
read -p "User: " -e user
exp=$(grep -wE "^#& $user" "/usr/local/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
sed -i "/^#& $user $exp/,/^},{/d" /usr/local/etc/xray/config.json
systemctl restart xray > /dev/null 2>&1