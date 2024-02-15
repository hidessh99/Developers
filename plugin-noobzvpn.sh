#!/bin/bash

#noobz dan akun ssh

#add on SSH
wget -O /usr/local/bin/add-ssh-user "https://raw.githubusercontent.com/hidessh99/Developers/main/add-noobzvpn.sh"
wget -O /usr/local/bin/del-ssh-user "https://raw.githubusercontent.com/hidessh99/Developers/main/del-noobzvpn.sh"

#permission
chmod +x /usr/local/bin/add-ssh-user
chmod +x /usr/local/bin/del-ssh-user

