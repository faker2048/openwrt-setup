#!/bin/sh

opkg update 

# basic packages
opkg install bash curl tmux

# sing-box
opkg install sing-box

# homeproxy modified version
wget https://gh-proxy.com/https://github.com/faker2048/homeproxy/releases/download/v2025.1.20/luci-app-homeproxy_dev-1737315154-ae25be1_all.ipk
opkg install luci-app-homeproxy_dev-1737315154-ae25be1_all.ipk
rm luci-app-homeproxy_dev-1737315154-ae25be1_all.ipk

echo "all packages installed"