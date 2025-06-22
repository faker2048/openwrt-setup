# setup openwrt lan ip to 192.168.100.1

#!/bin/sh

# 设置LAN接口IP地址为192.168.100.1
uci set network.lan.ipaddr='192.168.100.1'
uci set network.lan.netmask='255.255.255.0'
uci commit network

# 重启网络服务
/etc/init.d/network restart

echo "LAN IP已设置为192.168.100.1"
