#!/bin/sh

echo "配置OpenWrt镜像源..."

# 备份原配置
cp /etc/opkg/distfeeds.conf /etc/opkg/distfeeds.conf.bak

# 替换为清华镜像源
sed -i 's|downloads.openwrt.org|mirrors.tuna.tsinghua.edu.cn/openwrt|g' /etc/opkg/distfeeds.conf

# 更新软件包列表
opkg update

echo "镜像源配置完成！" 