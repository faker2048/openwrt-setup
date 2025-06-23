#!/bin/sh

opkg update 

# basic packages
opkg install bash curl tmux

# sing-box
opkg install sing-box

# homeproxy modified version
wget https://gh-proxy.com/https://github.com/faker2048/homeproxy/releases/download/v2025.6.24.2/luci-app-homeproxy_dev-1750695135-4fd7c35_all.ipk
opkg install luci-app-homeproxy_dev-1750695135-4fd7c35_all.ipk
rm luci-app-homeproxy_dev-1750695135-4fd7c35_all.ipk

echo "all packages installed"