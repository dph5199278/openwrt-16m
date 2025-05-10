#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# remove kmod-usb-net-rtl8150
sed -i 's/kmod-usb-net-rtl8150//g' target/linux/x86/Makefile

# remove kmod-usb-net-rtl8152-vendor
sed -i 's/kmod-usb-net-rtl8152-vendor//g' target/linux/x86/Makefile
