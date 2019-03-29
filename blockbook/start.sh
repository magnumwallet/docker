#!/bin/bash

./blockbook -sync -datadir=./data -blockchaincfg=./blockchaincfg.json -log_dir=./logs -dbcache=1073741824 -explorer=https://btc.mgnm.rocks -internal=:9030 -public=:9130 -logtostderr -debug

./blockbook -sync -datadir=./data -blockchaincfg=./myriad.json -log_dir=./logs -dbcache=1073741824 -explorer=https://xmy.mgnm.rocks -internal=:4021 -public=:2021 -logtostderr -debug