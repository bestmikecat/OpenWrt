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
sed -i 's/192.168.1.1/192.168.5.1/g' package/base-files/files/bin/config_generate
#开启MU-MIMO
sed -i 's/mu_beamformer=0/mu_beamformer=1/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
# 修改默认wifi名称ssid
sed -i 's/ssid=OpenWrt/ssid=BM/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
# 修改默认wifi密码
sed -i 's/encryption=none/encryption=sae-mixed/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i '/set wireless.default_radio${devidx}.encryption=sae-mixed/a\set wireless.default_radio${devidx}.key=Aa2247701304' package/kernel/mac80211/files/lib/wifi/mac80211.sh
