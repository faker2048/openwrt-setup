#!/bin/sh

BASE_URL="https://gh-proxy.com/https://raw.githubusercontent.com/faker2048/openwrt-setup/master/scripts"
SETUP_DIR="setup/openwrt"

echo "Starting OpenWrt setup..."

# Create setup directory
echo "Creating setup directory: $SETUP_DIR"
mkdir -p "$SETUP_DIR"

# Download scripts
echo "Downloading scripts..."
curl -fsSL "$BASE_URL/01-expend_root.sh" -o "$SETUP_DIR/01-expend_root.sh"
curl -fsSL "$BASE_URL/02-set_up_lan_ip.sh" -o "$SETUP_DIR/02-set_up_lan_ip.sh"
curl -fsSL "$BASE_URL/03-install-packages.sh" -o "$SETUP_DIR/03-install-packages.sh"

# Make scripts executable
chmod +x "$SETUP_DIR"/*.sh

# Execute scripts in order
echo "1. Expanding root filesystem..."
sh "$SETUP_DIR/01-expend_root.sh"

echo "2. Setting up LAN IP..."
sh "$SETUP_DIR/02-set_up_lan_ip.sh"

echo "3. Installing packages..."
sh "$SETUP_DIR/03-install-packages.sh"

echo "OpenWrt setup completed!"
