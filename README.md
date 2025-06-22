# OpenWrt Setup

OpenWrt自动化设置脚本集合

## 使用方法

一行命令安装：
```bash
curl -fsSL https://raw.githubusercontent.com/faker2048/openwrt-setup/master/setup.sh | sh

# 带加速
curl -fsSL https://gh-proxy.com/https://raw.githubusercontent.com/faker2048/openwrt-setup/master/setup.sh | sh
```

## 短链接
可以先创建一个短链接来手动输入
```
curl -s "http://tinyurl.com/api-create.php?url=https://gh-proxy.com/https://raw.githubusercontent.com/faker2048/openwrt-setup/master/setup.sh"
```

## 脚本功能

- `01-expend_root.sh` - 扩展根文件系统
- `02-set_up_lan_ip.sh` - 设置LAN IP为192.168.100.1
- `03-install-packages.sh` - 安装基础包和homeproxy

## 安装的软件包

- bash, curl, tmux
- sing-box
- homeproxy (修改版)

## 仓库地址

[https://github.com/faker2048/openwrt-setup](https://github.com/faker2048/openwrt-setup)
