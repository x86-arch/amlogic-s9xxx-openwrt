#!/bin/bash
#========================================================================================================================
# https://github.com/ophub/amlogic-s9xxx-openwrt
# Description: Automatically Build OpenWrt for Amlogic S9xxx STB
# Function: Diy script (After Update feeds, Modify the default IP, hostname, theme, add/remove software packages, etc.)
# Source code repository: https://github.com/coolsnowwolf/lede / Branch: master
#========================================================================================================================

# ------------------------------- Main source started -------------------------------
#
# Modify default theme（FROM uci-theme-bootstrap CHANGE TO luci-theme-material）
sed -i 's/luci-theme-bootstrap/luci-theme-material/g' ./feeds/luci/collections/luci/Makefile

# Modify some code adaptation
sed -i 's/LUCI_DEPENDS.*/LUCI_DEPENDS:=\@\(arm\|\|aarch64\)/g' package/lean/luci-app-cpufreq/Makefile

# Add autocore support for armvirt
sed -i 's/TARGET_rockchip/TARGET_rockchip\|\|TARGET_armvirt/g' package/lean/autocore/Makefile

# Modify default IP（FROM 192.168.1.1 CHANGE TO 192.168.31.4）
# sed -i 's/192.168.1.1/192.168.31.4/g' package/base-files/files/bin/config_generate

# Modify default root's password（FROM 'password'[$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.] CHANGE TO 'your password'）
# sed -i 's/root::0:0:99999:7:::/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0:0:99999:7:::/g' /etc/shadow

# Replace the default software source
# sed -i 's#openwrt.proxy.ustclug.org#mirrors.bfsu.edu.cn\\/openwrt#' package/lean/default-settings/files/zzz-default-settings
#
# ------------------------------- Main source ends -------------------------------

# ------------------------------- Other started -------------------------------
#
# Add luci-app-amlogic
svn co https://github.com/ophub/luci-app-amlogic/trunk/luci-app-amlogic package/luci-app-amlogic

# Add p7zip
# svn co https://github.com/hubutui/p7zip-lede/trunk package/p7zip

# coolsnowwolf default software package replaced with Lienol related software package
# rm -rf feeds/packages/utils/{containerd,libnetwork,runc,tini}
# svn co https://github.com/Lienol/openwrt-packages/trunk/utils/{containerd,libnetwork,runc,tini} feeds/packages/utils

# Add third-party software packages (The entire repository)
# git clone https://github.com/libremesh/lime-packages.git package/lime-packages
# Add third-party software packages (Specify the package)
# svn co https://github.com/libremesh/lime-packages/trunk/packages/{shared-state-pirania,pirania-app,pirania} package/lime-packages/packages
# Add to compile options (Add related dependencies according to the requirements of the third-party software package Makefile)
# sed -i "/DEFAULT_PACKAGES/ s/$/ pirania-app pirania ip6tables-mod-nat ipset shared-state-pirania uhttpd-mod-lua/" target/linux/armvirt/Makefile

svn co https://github.com/xiaorouji/openwrt-passwall/trunk/brook package/brook

svn co https://github.com/xiaorouji/openwrt-passwall/trunk/chinadns-ng package/chinadns-ng

svn co https://github.com/xiaorouji/openwrt-passwall/trunk/dns2socks package/dns2socks

svn co https://github.com/xiaorouji/openwrt-passwall/trunk/hysteria package/hysteria

svn co https://github.com/xiaorouji/openwrt-passwall/trunk/ipt2socks package/ipt2socks

svn co https://github.com/xiaorouji/openwrt-passwall/trunk/kcptun package/kcptun


svn co https://github.com/xiaorouji/openwrt-passwall/trunk/microsocks package/microsocks

svn co https://github.com/xiaorouji/openwrt-passwall/trunk/naiveproxy package/naiveproxy

svn co https://github.com/xiaorouji/openwrt-passwall/trunk/pdnsd-alt package/pdnsd-alt

svn co https://github.com/xiaorouji/openwrt-passwall/trunk/shadowsocks-rust package/shadowsocks-rust

svn co https://github.com/xiaorouji/openwrt-passwall/trunk/shadowsocksr-libev package/shadowsocksr-libev

svn co https://github.com/xiaorouji/openwrt-passwall/trunk/simple-obfs package/simple-obfs

svn co https://github.com/xiaorouji/openwrt-passwall/trunk/ssocks package/ssocks

svn co https://github.com/xiaorouji/openwrt-passwall/trunk/tcping package/tcping

svn co https://github.com/xiaorouji/openwrt-passwall/trunk/trojan-go package/trojan-go

svn co https://github.com/xiaorouji/openwrt-passwall/trunk/trojan-plus package/trojan-plus

svn co https://github.com/xiaorouji/openwrt-passwall/trunk/trojan package/trojan

svn co https://github.com/xiaorouji/openwrt-passwall/trunk/v2ray-core package/v2ray-core

svn co https://github.com/xiaorouji/openwrt-passwall/trunk/v2ray-plugin package/v2ray-plugin

svn co https://github.com/xiaorouji/openwrt-passwall/trunk/xray-core package/xray-core

svn co https://github.com/xiaorouji/openwrt-passwall/trunk/xray-plugin package/xray-plugin

svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash/ package/luci-app-openclash

svn co https://github.com/xiaorouji/openwrt-passwall/trunk/luci-app-passwall package/luci-app-passwal

# Apply patch
# git apply ../router-config/patches/{0001*,0002*}.patch --directory=feeds/luci
#
# ------------------------------- Other ends -------------------------------

