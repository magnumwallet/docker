#!/bin/bash

./blockbook -sync -datadir=./data -blockchaincfg=./blockchaincfg.json -log_dir=./logs -dbcache=1073741824 -explorer=https://btc.mgnm.rocks -internal=:9030 -public=:9130 -logtostderr -debug