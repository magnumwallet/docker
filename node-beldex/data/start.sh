#!/bin/bash

/root/beldex/build/release/bin/beldexd --detach
/root/beldex-web-wallet/build/beldex-web-wallet -p 1985 -c /root/.beldex/beldex.json