#!/bin/sh
systemctl stop rs-server
echo |adduser rs --disabled-password --disabled-login 
su rs -c  'mkdir /home/rs/rs'
cd /home/rs/rs
rm -rf russellcoind-linux-x64
rm -rf rs-cli
su rs -c  'wget https://github.com/russellcoinpay/russellcoin/releases/download/2.4.1/russellcoind-linux-x64'
su rs -c  'wget https://github.com/zhhww58/myscript/raw/master/rs-cli'
su rs -c  'chmod 755 rs-cli'
su rs -c  'chmod 755 russellcoind-linux-x64'
su rs -c  'chmod 755 russellcoind-linux-x64'
su rs -c  'mkdir /home/rs/.russellcoin2/'
su rs -c  'rm -rf /home/rs/.russellcoin2/russellcoin.conf'
su rs -c  'touch /home/rs/.russellcoin2/russellcoin.conf'
echo rpcuser=dashrpc > /home/rs/.russellcoin2/russellcoin.conf
echo rpcpassword=77tXVivCqw133ewfYwgWvziTU3SvsK7E5u9zCUZxauFu >> /home/rs/.russellcoin2/russellcoin.conf
chmod 777 /home/rs/.russellcoin2/russellcoin.conf
cd /etc/init.d/
rm -rf rs-server
wget https://github.com/zhhww58/myscript/raw/master/rs-server
chmod 755 rs-server
systemctl disable rs-server
systemctl enable rs-server
systemctl start rs-server
