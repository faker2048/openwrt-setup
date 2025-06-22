#!/bin/sh

BASE_URL="https://gh-proxy.com/https://raw.githubusercontent.com/faker2048/openwrt-setup/master/scripts"
SETUP_DIR="setup/openwrt"
STAGE_FILE="$SETUP_DIR/.setup_stage"

echo "Starting OpenWrt setup..."

# Create setup directory
echo "Creating setup directory: $SETUP_DIR"
mkdir -p "$SETUP_DIR"

# Download scripts
echo "Downloading scripts..."
wget -U "" -O "$SETUP_DIR/00-setup_mirrors.sh" "$BASE_URL/00-setup_mirrors.sh"
wget -U "" -O "$SETUP_DIR/01-expend_root.sh" "$BASE_URL/01-expend_root.sh"
wget -U "" -O "$SETUP_DIR/02-set_up_lan_ip.sh" "$BASE_URL/02-set_up_lan_ip.sh"
wget -U "" -O "$SETUP_DIR/03-install-packages.sh" "$BASE_URL/03-install-packages.sh"

# Make scripts executable
chmod +x "$SETUP_DIR"/*.sh

# Check current stage
STAGE=0
if [ -f "$STAGE_FILE" ]; then
    STAGE=$(cat "$STAGE_FILE")
fi

case $STAGE in
    0)
        echo "Stage 0: Setting up mirrors..."
        echo "1" > "$STAGE_FILE"
        sh "$SETUP_DIR/00-setup_mirrors.sh"
        ;;
    1)
        echo "Stage 1: Expanding root filesystem..."
        echo "2" > "$STAGE_FILE"
        
        # Create continuation script
        cat > /etc/uci-defaults/99-continue-setup << 'EOF'
#!/bin/sh
SETUP_DIR="setup/openwrt"
if [ -f "$SETUP_DIR/.setup_stage" ]; then
    sh /root/setup.sh
    rm -f /etc/uci-defaults/99-continue-setup
fi
EOF
        chmod +x /etc/uci-defaults/99-continue-setup
        
        sh "$SETUP_DIR/01-expend_root.sh"
        ;;
    2)
        echo "Stage 2: Setting up LAN IP..."
        echo "3" > "$STAGE_FILE"
        sh "$SETUP_DIR/02-set_up_lan_ip.sh"
        ;;
    3)
        echo "Stage 3: Installing packages..."
        rm -f "$STAGE_FILE"
        sh "$SETUP_DIR/03-install-packages.sh"
        echo "OpenWrt setup completed!"
        ;;
esac
