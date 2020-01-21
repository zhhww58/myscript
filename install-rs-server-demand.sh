#!/bin/sh
systemctl stop rs-server
systemctl disable rs-server
rs-cli stop
killall -9 russellcoin-64-245d

echo |adduser rs --disabled-password --disabled-login
su rs -c  'mkdir /home/rs/rs'
cd /home/rs/rs
rm -rf /home/rs/rs/russellcoind-linux-x64
rm -rf /home/rs/rs/rs-cli
rm -rf /etc/init.d/rs-server
rm -rf russellcoind-linux-x64
rm -rf rs-cli
rm -rf russellcoin-64-245d
rm -rf russellcoin-64-245-cli
su rs -c  'wget https://github.com/zhhww58/myscript/raw/master/russellcoind-linux-x64'
su rs -c  'wget https://github.com/zhhww58/myscript/raw/master/rs-cli'
su rs -c  'chmod 755 rs-cli'
su rs -c  'chmod 755 russellcoind-linux-x64'
su rs -c  'mkdir /home/rs/.russellcoin2/'
su rs -c  'rm -rf /home/rs/.russellcoin2/russellcoin.conf'
su rs -c  'touch /home/rs/.russellcoin2/russellcoin.conf'

echo server=1 > /home/rs/.russellcoin2/russellcoin.conf
echo daemon=1 >> /home/rs/.russellcoin2/russellcoin.conf
echo rpcuser=dashrpc >> /home/rs/.russellcoin2/russellcoin.conf
echo rpcpassword=77tXVivCqw133ewfYwgWvziTU3SvsK7E5u9zCUZxauFu >> /home/rs/.russellcoin2/russellcoin.conf
echo >>/home/rs/.russellcoin2/russellcoin.conf
echo \#\#masternode conf\#\#>>/home/rs/.russellcoin2/russellcoin.conf
echo >>/home/rs/.russellcoin2/russellcoin.conf
echo \#masternode=1 >>/home/rs/.russellcoin2/russellcoin.conf
echo \#masternodeprivkey= >>/home/rs/.russellcoin2/russellcoin.conf
echo \#masternodeaddr= >>/home/rs/.russellcoin2/russellcoin.conf


chmod 755 /home/rs/.russellcoin2/russellcoin.conf
chown -R rs:rs /home/rs/.russellcoin2/russellcoin.conf
rm -rf /usr/bin/start-rs
rm -rf /usr/bin/rs-cli
echo su -c '"/home/rs/rs/russellcoind-linux-x64 $1 $2 $3 $4 $5 $6 $7\"' >/home/rs/rs/start-rs.sh
echo su -c '"/home/rs/rs/rs-cli $1 $2 $3 $4 $5 $6 $7\"' >/home/rs/rs/rs-cli.sh
chmod 777 /home/rs/rs/start-rs.sh
chmod 777 /home/rs/rs/rs-cli.sh
rm -rf /usr/bin/start-rs
rm -rf /usr/bin/rs-cli
ln -s /home/rs/rs/start-rs.sh /usr/bin/start-rs
ln -s /home/rs/rs/rs-cli.sh /usr/bin/rs-cli

cd /etc/init.d/
rm -rf rs-server

