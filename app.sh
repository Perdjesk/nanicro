#!/bin/sh

set -ev

mkdir /ngrok/
cd /ngrok
curl https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip -o ./ngrok.zip
unzip ngrok.zip
ls -al

mkdir /www
echo "<h1>BLU</h1>" > /www/index.html
cd /www && nohup python -m SimpleHTTPServer 8000 & 
sleep 5
curl localhost:8000
nohup /ngrok/ngrok http --log-level debug --log stdout 8000 > /var/log/ngrok.log &
sleep 10
grep "Hostname:" /var/log/ngrok.log
sleep 900
