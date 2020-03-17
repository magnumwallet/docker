#!/bin/bash

cp -n -r /opt/data/* /mnt/data/

exec "$@"