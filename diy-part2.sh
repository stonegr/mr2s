#!/bin/bash

# Modify default IP
sed -i 's/192.168.1.1/192.168.100.180/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
sed -i 's/LEDE/Stone/g' package/base-files/files/bin/config_generate

# openssl enable asm
sed -i '/OPENSSL_TARGET:=linux-$(call qstrip,$(CONFIG_ARCH))-openwrt/i \
OPENSSL_OPTIONS += enable-asm\
OPENSSL_OPTIONS += -march=armv8-a+crypto\n' package/libs/openssl/Makefile
