# OpenWrt Setup

OpenWrt自动化设置脚本集合

## 使用方法

一行命令安装：

```bash
# 使用wget（推荐，OpenWrt默认安装）
wget -U "" -O- https://gh-proxy.com/https://raw.githubusercontent.com/faker2048/openwrt-setup/master/setup.sh | sh

# 或使用curl（需要先安装curl）
curl -fsSL https://gh-proxy.com/https://raw.githubusercontent.com/faker2048/openwrt-setup/master/setup.sh | sh
```

## 脚本功能

- `01-expend_root.sh` - 扩展根文件系统（会自动重启）
- `02-set_up_lan_ip.sh` - 设置LAN IP为192.168.100.1
- `03-install-packages.sh` - 安装基础包和homeproxy

**注意：** 脚本会自动处理重启，无需手动干预。系统会在扩展根分区后自动重启并继续执行剩余步骤。

## 安装的软件包

- bash, curl, tmux
- sing-box
- homeproxy (修改版)

## Tips
可以先创建一个短链接来手动输入
```bash
# 创建setup.sh的短链接
curl -s "http://tinyurl.com/api-create.php?url=https://gh-proxy.com/https://raw.githubusercontent.com/faker2048/openwrt-setup/master/setup.sh"

# 创建镜像设置脚本的短链接
curl -s "http://tinyurl.com/api-create.php?url=https://gh-proxy.com/https://raw.githubusercontent.com/faker2048/openwrt-setup/master/scripts/00-setup_mirrors.sh"
```


## 仓库地址

[https://github.com/faker2048/openwrt-setup](https://github.com/faker2048/openwrt-setup)
