#!/bin/bash

#warning read documentasi in github Readme.md

#add on SSH
wget -O /usr/local/bin/add-ssh-user "https://raw.githubusercontent.com/hidessh99/Developers/main/add-ssh.sh"
wget -O /usr/local/bin/del-ssh-user "https://raw.githubusercontent.com/hidessh99/Developers/main/del-ssh.sh"

#add on Vmess
wget -O /usr/local/bin/add-vmess-user "https://raw.githubusercontent.com/hidessh99/Developers/main/add-vmess.sh"
wget -O /usr/local/bin/add-vmess-user "https://raw.githubusercontent.com/hidessh99/Developers/main/del-vmess.sh"

#add on Trojan
wget -O /usr/local/bin/add-trojan-user "https://raw.githubusercontent.com/hidessh99/Developers/main/add-tr.sh"
wget -O /usr/local/bin/del-trojan-user "https://raw.githubusercontent.com/hidessh99/Developers/main/del-tr.sh"

#permission
chmod +x /usr/local/bin/add-ssh-user
chmod +x /usr/local/bin/del-ssh-user
chmod +x /usr/local/bin/add-vmess-user
chmod +x /usr/local/bin/del-vmess-user
chmod +x /usr/local/bin/add-trojan-user
chmod +x /usr/local/bin/del-trojan-user