#!/bin/bash

echo '===== 新增设备配置...'

##### 增加配置项
echo '' >> target/linux/ath79/image/tiny-tp-link.mk
echo 'define Device/tplink_tl-wr886n-v5' >> target/linux/ath79/image/tiny-tp-link.mk
echo '  $(Device/tplink-16mlzma)' >> target/linux/ath79/image/tiny-tp-link.mk
echo '  SOC := tp9343' >> target/linux/ath79/image/tiny-tp-link.mk
echo '  DEVICE_MODEL := TL-WR886N' >> target/linux/ath79/image/tiny-tp-link.mk
echo '  DEVICE_VARIANT := v1' >> target/linux/ath79/image/tiny-tp-link.mk
echo '  TPLINK_HWID := 0x08860005' >> target/linux/ath79/image/tiny-tp-link.mk
echo '  SUPPORTED_DEVICES += tl-wr886n-v5' >> target/linux/ath79/image/tiny-tp-link.mk
echo 'endef' >> target/linux/ath79/image/tiny-tp-link.mk
echo 'TARGET_DEVICES += tplink_tl-wr886n-v5' >> target/linux/ath79/image/tiny-tp-link.mk

##### 闪存扩展为16M（影响全部，不通用）
sed -i 's/<0x020000 0x3d0000>/<0x020000 0xfd0000>/g' target/linux/ath79/dts/tp9343_tplink_tl-wx.dtsi
sed -i 's/<0x3f0000 0x010000>/<0xff0000 0x010000>/g' target/linux/ath79/dts/tp9343_tplink_tl-wx.dtsi

##### 新增设备树
echo '// SPDX-License-Identifier: GPL-2.0-or-later OR MIT' > target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '#include <dt-bindings/leds/common.h>' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '#include "tp9343_tplink_tl-wx.dtsi"' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '/ {' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '	compatible = "tplink,tl-wr886n-v5", "qca,tp9343";' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '	model = "TP-Link TL-WR886N v5";' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '	aliases {' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '		led-boot = &led_system;' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '		led-failsafe = &led_system;' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '		led-running = &led_system;' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '		led-upgrade = &led_system;' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '	};' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '	keys {' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '		compatible = "gpio-keys";' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '		reset {' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '			label = "Reset button";' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '			linux,code = <KEY_RESTART>;' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '			linux,input-type = <EV_KEY>;' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '			gpios = <&gpio 1 GPIO_ACTIVE_LOW>;' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '			debounce-interval = <60>;' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '		};' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '	};' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '	leds {' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '		compatible = "gpio-leds";' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts

echo '' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '		led_system: system {' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '			label = "green:system";' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '			gpios = <&gpio 8 GPIO_ACTIVE_LOW>;' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '			default-state = "on";' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '		};' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts

echo '' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '		wan {' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '			label = "green:wan";' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '			gpios = <&gpio 2 GPIO_ACTIVE_LOW>;' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '		};' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts

echo '' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '		lan1 {' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '			label = "green:lan1";' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '			gpios = <&gpio 4 GPIO_ACTIVE_LOW>;' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '		};' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts

echo '' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '		lan2 {' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '			label = "green:lan2";' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '			gpios = <&gpio 5 GPIO_ACTIVE_LOW>;' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '		};' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts

echo '' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '		lan3 {' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '			label = "green:lan3";' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '			gpios = <&gpio 6 GPIO_ACTIVE_LOW>;' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '		};' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts

echo '' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '		lan4 {' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '			label = "green:lan4";' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '			gpios = <&gpio 7 GPIO_ACTIVE_LOW>;' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '		};' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts

echo '	};' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '};' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '&eth1 {' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '	nvmem-cells = <&macaddr_uboot_1fc00>;' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '	nvmem-cell-names = "mac-address";' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '	mac-address-increment = <(-1)>;' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts
echo '};' >> target/linux/ath79/dts/tp9343_tplink_tl-wr886n-v5.dts

##### 新增led控制
echo '' > target/linux/ath79/tiny/base-files/etc/board.d/01_leds
echo '. /lib/functions/uci-defaults.sh' >> target/linux/ath79/tiny/base-files/etc/board.d/01_leds
echo '' >> target/linux/ath79/tiny/base-files/etc/board.d/01_leds
echo 'board_config_update' >> target/linux/ath79/tiny/base-files/etc/board.d/01_leds
echo '' >> target/linux/ath79/tiny/base-files/etc/board.d/01_leds
echo 'ucidef_set_led_netdev "wan" "WAN" "green:wan" "eth1"' >> target/linux/ath79/tiny/base-files/etc/board.d/01_leds
echo 'ucidef_set_led_switch "lan1" "LAN1" "green:lan1" "switch0" "0x10"' >> target/linux/ath79/tiny/base-files/etc/board.d/01_leds
echo 'ucidef_set_led_switch "lan2" "LAN2" "green:lan2" "switch0" "0x08"' >> target/linux/ath79/tiny/base-files/etc/board.d/01_leds
echo 'ucidef_set_led_switch "lan3" "LAN3" "green:lan3" "switch0" "0x04"' >> target/linux/ath79/tiny/base-files/etc/board.d/01_leds
echo 'ucidef_set_led_switch "lan4" "LAN4" "green:lan4" "switch0" "0x02"' >> target/linux/ath79/tiny/base-files/etc/board.d/01_leds
echo '' >> target/linux/ath79/tiny/base-files/etc/board.d/01_leds
echo 'board_config_flush' >> target/linux/ath79/tiny/base-files/etc/board.d/01_leds
echo '' >> target/linux/ath79/tiny/base-files/etc/board.d/01_leds
echo 'exit 0' >> target/linux/ath79/tiny/base-files/etc/board.d/01_leds

##### 新增network配置
echo '' > target/linux/ath79/tiny/base-files/etc/board.d/02_network
echo '. /lib/functions/system.sh' >> target/linux/ath79/tiny/base-files/etc/board.d/02_network
echo '. /lib/functions/uci-defaults.sh' >> target/linux/ath79/tiny/base-files/etc/board.d/02_network
echo '' >> target/linux/ath79/tiny/base-files/etc/board.d/02_network
echo 'ath79_setup_interfaces()' >> target/linux/ath79/tiny/base-files/etc/board.d/02_network
echo '{' >> target/linux/ath79/tiny/base-files/etc/board.d/02_network
echo '	ucidef_set_interfaces_lan_wan "eth0" "eth1"' >> target/linux/ath79/tiny/base-files/etc/board.d/02_network
echo '	ucidef_add_switch "switch0" \' >> target/linux/ath79/tiny/base-files/etc/board.d/02_network
echo '		"0@eth0" "1:lan:4" "2:lan:3" "3:lan:2" "4:lan:1"' >> target/linux/ath79/tiny/base-files/etc/board.d/02_network
echo '}' >> target/linux/ath79/tiny/base-files/etc/board.d/02_network
echo '' >> target/linux/ath79/tiny/base-files/etc/board.d/02_network
echo 'board_config_update' >> target/linux/ath79/tiny/base-files/etc/board.d/02_network
echo 'board=$(board_name)' >> target/linux/ath79/tiny/base-files/etc/board.d/02_network
echo 'ath79_setup_interfaces $board' >> target/linux/ath79/tiny/base-files/etc/board.d/02_network
echo 'board_config_flush' >> target/linux/ath79/tiny/base-files/etc/board.d/02_network
echo '' >> target/linux/ath79/tiny/base-files/etc/board.d/02_network
echo 'exit 0' >> target/linux/ath79/tiny/base-files/etc/board.d/02_network

echo '===== 新增设备配置成功'

echo '===== 修改主机名...'
sed -i "s/hostname='ImmortalWrt'/hostname='TL-WR886N'/g" package/base-files/files/bin/config_generate
echo '===== 修改主机名成功'

echo '===== 修改默认主题...'
##### Set argon as default theme
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-light/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-nginx/Makefile
echo '===== 修改默认主题成功'

echo '===== 修改IP设置...'
# Modify default IP 
sed -i 's/192.168.1.1/192.168.128.127/g' package/base-files/files/bin/config_generate
sed -i 's/192.168.1.1/192.168.128.127/g' feeds/luci/modules/luci-mod-system/htdocs/luci-static/resources/view/system/flash.js
sed -i 's/192.168.1.1/192.168.128.127/g' feeds/luci/modules/luci-mod-system/htdocs/luci-static/resources/view/system/flash.js
sed -i 's/immortalwrt.lan/tplogin.lan/g' feeds/luci/modules/luci-mod-system/htdocs/luci-static/resources/view/system/flash.js
echo '===== 修改IP设置成功'


# 移除不用软件包
# rm -rf feeds/luci/applications/luci-app-netdata
# rm -rf feeds/luci/applications/luci-app-pptp-server
# rm -rf feeds/packages/net/smartdns
# rm -rf feeds/packages/utils/syncthing
# rm -rf feeds/packages/net/amule
