# plugin web panel hidessh
panel hidessh menggunakan sistem pay as you go , tidak ada masa aktif ,jika saldo konsumen habis maka akun otomatis terhapus

# instalasi PLugin Web panel Hidessh
```
wget https://raw.githubusercontent.com/hidessh99/Developers/main/install-plugin.sh;chmod +x install-plugin.sh;./install-plugin.sh
```

# Informasi Penting Vmess

kamu perlu mengubah lokasi file xray dan path sesuai dengan auto script kamu 
perhatikan kode di bawah ini
```
uuid=$(cat /proc/sys/kernel/random/uuid) 
masaaktif=90
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vmess$/a\#@ '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vmessgrpc$/a\#@ '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
```

***1. lokasi config Xray Vmess***
```
/etc/xray/config.json // lokasi file xray kamu
```
- ubah sesuai dengan lokasi file xray kamu

***2. kamu juga bisa custom mau pakai uuid atau username***
- jika kamu menggunakan username $user
- jika kamu menggunakan uuid pakai $uuid

***3. edit Path sesuai script kamu***
```
sed -i '/#vmess$/a\#@ '"$user $exp"'\
```
atau 
```
sed -i '/#vmessgrpc$/a\#@ '"$user $exp"'\
```
- perhatihan kode diatas vmess
- jika kamu menggunakan path pribadi bisa mengubah ke path sesuai script kamu
- jika kamu memakai path whatever abaikan ini

***3. pastikan add vmess dan del vmess sama***
```
sed -i "/^#@ $user $exp/,/^},{/d" /etc/xray/config.json
```
- perhatikan kode diatas
- jika kamu menggunakan #@ di add vmess, di deleted akun vmess juga pelu #@
- wajib setiap protokol menggunakan kode yang berbeda


# Informasi Penting Trojan

kamu perlu mengubah lokasi file xray dan path sesuai dengan auto script kamu 
perhatikan kode di bawah ini
```
masaaktif=90
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#trojan$/a\#& '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /usr/local/etc/xray/config.json
sed -i '/#trojan-grpc$/a\#& '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /usr/local/etc/xray/config.json
```

***1. lokasi config Xray Trojan***
```
/usr/local/etc/xray/config.json // lokasi file xray kamu
```
- ubah sesuai dengan lokasi file xray kamu

***2. kamu juga bisa custom mau pakai uuid atau username***
- jika kamu menggunakan username $user
- jika kamu menggunakan uuid pakai $uuid

***3. edit Path sesuai script kamu***
```
sed -i '/#trojan$/a\#& '"$user $exp"'\
```
or 
```
sed -i '/#trojan-grpc$/a\#& '"$user $exp"'\
```
- jika kamu menggunakan path pribadi bisa mengubah ke path sesuai script kamu
- jika kamu memakai path whatever abaikan ini

***3. pastikan add vmess dan del vmess sama***
```
sed -i "/^#& $user $exp/,/^},{/d" /usr/local/etc/xray/config.json
```
- perhatikan kode diatas
- jika kamu menggunakan #& di add vmess, di deleted akun vmess juga pelu #&
- wajib setiap protokol menggunakan kode yang berbeda

# Informasi Penting SSH

untuk ssh universal bisa digunakan untuk semua auto installer script
- jika kamu ingin menambahkan beberapa informasi seperti Port , Payload dll
bisa di letahkan di bawah kode
```
echo -e "bugisisendiri:2082@$Login:$Pass"
```