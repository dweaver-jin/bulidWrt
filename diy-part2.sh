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
sed -i 's/192.168.1.1/192.168.50.252/g' package/base-files/files/bin/config_generate

#添加额外软件包
@ git clone https://github.com/lisaac/luci-app-dockerman.git package/openwrt-packages/luci-app-dockerman
# svn co https://github.com/xiaorouji/openwrt-package/trunk/package/brook package/openwrt-packages/brook
# svn co https://github.com/xiaorouji/openwrt-package/trunk/package/chinadns-ng package/openwrt-packages/chinadns-ng
# svn co https://github.com/xiaorouji/openwrt-package/trunk/package/trojan-go package/openwrt-packages/trojan-go
# svn co https://github.com/xiaorouji/openwrt-package/trunk/package/trojan-plus package/openwrt-packages/trojan-plus
# svn co https://github.com/xiaorouji/openwrt-package/trunk/lienol/luci-app-passwall package/openwrt-packages/luci-app-passwall
svn co https://github.com/siropboy/mypackages/trunk/luci-app-autopoweroff package/openwrt-packages/luci-app-autopoweroff
svn co https://github.com/siropboy/mypackages/trunk/luci-app-control-timewol package/openwrt-packages/luci-app-control-timewol
git clone https://github.com/tty228/luci-app-serverchan.git package/openwrt-packages/luci-app-serverchan
git clone https://github.com/jerrykuku/luci-app-jd-dailybonus.git package/openwrt-packages/luci-app-jd-dailybonus
git clone https://github.com/jerrykuku/node-request.git package/openwrt-packages/node-request
git clone https://github.com/bin20088/luci-theme-argon-mc.git package/openwrt-packages/luci-theme-argon-mc
git clone https://github.com/Leo-Jo-My/luci-theme-opentomcat.git package/openwrt-packages/luci-theme-opentomcat
git clone https://github.com/bin20088/luci-theme-butongwifi.git package/openwrt-packages/luci-theme-butongwifi
git clone https://github.com/openwrt-develop/luci-theme-atmaterial.git package/openwrt-packages/luci-theme-atmaterial
#git clone https://github.com/bin20088/luci-app-koolproxyR.git package/openwrt-packages/luci-app-koolproxyR
#git clone https://github.com/bin20088/luci-app-koolddns.git package/openwrt-packages/luci-app-koolddns
# git clone https://github.com/fw876/helloworld.git package/openwrt-packages/helloworld
git clone https://github.com/tuanqing/install-program package/openwrt-packages/install-program
svn co https://github.com/0saga0/OpenClash/trunk/luci-app-openclash package/openwrt-packages/luci-app-openclash
svn co https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom/trunk/luci-theme-infinityfreedom package/openwrt-packages/luci-theme-infinityfreedom

sed -i 's|PKG_SOURCE_URL:=http://releases-cdn.verysync.com/releases/$(PKG_VERSION)|PKG_SOURCE_URL:=http://dl.verysync.net/$(PKG_VERSION)|g' package/lean/verysync/Makefile

#赋予koolddns权限
chmod 0755 package/openwrt-packages/luci-app-koolddns/root/etc/init.d/koolddns
chmod 0755 package/openwrt-packages/luci-app-koolddns/root/usr/share/koolddns/aliddns

./scripts/feeds update -a
./scripts/feeds install -a
