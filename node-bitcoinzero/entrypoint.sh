#!/bin/bash

cp -n -r /opt/data/* /mnt/data/

if grep -Fxq "#bznodeprivkey=" /mnt/data/bitcoinzero.conf
then
cd /opt/data
/opt/bitcoinzero/src/bitcoinzerod -datadir=/tmp/ &
APP_PID=$!
sleep 30
PRKEY=`/opt/bitcoinzero/src/bitcoinzero-cli -datadir=/tmp/ bznode genkey`
kill $APP_PID
sed -i "s/#bznodeprivkey=/bznodeprivkey=$PRKEY/" /mnt/data/bitcoinzero.conf
fi

exec "$@"