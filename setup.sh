#!/bin/sh

BASE_URL="https://gh-proxy.com/https://raw.githubusercontent.com/faker2048/openwrt-setup/master/scripts"

echo "Starting OpenWrt setup..."

# Execute scripts in order
echo "1. Expanding root filesystem..."
curl -fsSL "$BASE_URL/01-expend_root.sh" | sh

echo "2. Setting up LAN IP..."
curl -fsSL "$BASE_URL/02-set_up_lan_ip.sh" | sh

echo "3. Installing packages..."
curl -fsSL "$BASE_URL/03-install-packages.sh" | sh

echo "OpenWrt setup completed!"
