#!/bin/sh
systemctl stop rs-server
systemctl disable rs-server
echo |adduser rs --disabled-password --disabled-login 
mkdir /home/rs/rs
chown -R rs:rs /home/rs/rs/
rm -rf /home/rs/rs/russellcoind-linux-x64
rm -rf /home/rs/rs/rs-cli
rm -rf /etc/init.d/rs-server
cp russellcoind-linux-x64 /home/rs/rs/russellcoind-linux-x64
cp rs-cli /home/rs/rs/rs-cli
cp rs-server /etc/init.d/rs-server
chown -R rs:rs /home/rs/rs/
chmod 755 /home/rs/rs/rs-cli && chmod 755 /home/rs/rs/russellcoind-linux-x64 && chmod 755 /etc/init.d/rs-server
su rs -c  'mkdir /home/rs/.russellcoin2/'
su rs -c  'rm -rf /home/rs/.russellcoin2/russellcoin.conf'
su rs -c  'touch /home/rs/.russellcoin2/russellcoin.conf'
su rs -c  'echo rpcuser=dashrpc > /home/rs/.russellcoin2/russellcoin.conf'
su rs -c  'echo rpcpassword=77tXVivCqw133ewfYwgWvziTU3SvsK7E5u9zCUZxauFu >> /home/rs/.russellcoin2/russellcoin.conf'
systemctl enable rs-server
systemctl start rs-server
