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

svn co https://github.com/x86-arch/NueXini_Packages/trunk/UnblockNeteaseMusic-Go package/UnblockNeteaseMusic-Go
svn co https://github.com/x86-arch/NueXini_Packages/trunk/UnblockNeteaseMusic package/UnblockNeteaseMusic
svn co https://github.com/x86-arch/NueXini_Packages/trunk/adbyby package/adbyby
svn co https://github.com/x86-arch/NueXini_Packages/trunk/adguardhome package/adguardhome
svn co https://github.com/x86-arch/NueXini_Packages/trunk/amule package/amule
svn co https://github.com/x86-arch/NueXini_Packages/trunk/antileech package/antileech
svn co https://github.com/x86-arch/NueXini_Packages/trunk/autocore package/autocore
svn co https://github.com/x86-arch/NueXini_Packages/trunk/automount package/automount
svn co https://github.com/x86-arch/NueXini_Packages/trunk/baidupcs-web package/baidupcs-web
svn co https://github.com/x86-arch/NueXini_Packages/trunk/brook package/brook
svn co https://github.com/x86-arch/NueXini_Packages/trunk/chinadns-ng package/chinadns-ng
svn co https://github.com/x86-arch/NueXini_Packages/trunk/csstidy package/csstidy
svn co https://github.com/x86-arch/NueXini_Packages/trunk/ddns-scripts_aliyun package/ddns-scripts_aliyun
svn co https://github.com/x86-arch/NueXini_Packages/trunk/ddns-scripts_dnspod package/ddns-scripts_dnspod
svn co https://github.com/x86-arch/NueXini_Packages/trunk/dns2socks package/dns2socks
svn co https://github.com/x86-arch/NueXini_Packages/trunk/dnsforwarder package/dnsforwarder
svn co https://github.com/x86-arch/NueXini_Packages/trunk/dnsproxy package/dnsproxy
svn co https://github.com/x86-arch/NueXini_Packages/trunk/dsmboot package/dsmboot
svn co https://github.com/x86-arch/NueXini_Packages/trunk/frp package/frp
svn co https://github.com/x86-arch/NueXini_Packages/trunk/gmediarender package/gmediarender
svn co https://github.com/x86-arch/NueXini_Packages/trunk/hysteria package/hysteria
svn co https://github.com/x86-arch/NueXini_Packages/trunk/ipt2socks package/ipt2socks
svn co https://github.com/x86-arch/NueXini_Packages/trunk/iptvhelper package/iptvhelper
svn co https://github.com/x86-arch/NueXini_Packages/trunk/ipv6-helper package/ipv6-helper
svn co https://github.com/x86-arch/NueXini_Packages/trunk/k3-brcmfmac4366c-firmware package/k3-brcmfmac4366c-firmware
svn co https://github.com/x86-arch/NueXini_Packages/trunk/k3screenctrl package/k3screenctrl
svn co https://github.com/x86-arch/NueXini_Packages/trunk/kcptun package/kcptun
svn co https://github.com/x86-arch/NueXini_Packages/trunk/ksmbd-tools package/ksmbd-tools
svn co https://github.com/x86-arch/NueXini_Packages/trunk/ksmbd package/ksmbd
svn co https://github.com/x86-arch/NueXini_Packages/trunk/libcryptopp package/libcryptopp
svn co https://github.com/x86-arch/NueXini_Packages/trunk/lua-maxminddb package/lua-maxminddb
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-accesscontrol package/luci-app-accesscontrol
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-adblock-plus package/luci-app-adblock-plus
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-adbyby-plus package/luci-app-adbyby-plus
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-adguardhome package/luci-app-adguardhome
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-airplay2 package/luci-app-airplay2
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-airwhu package/luci-app-airwhu
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-amule package/luci-app-amule
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-argon-config package/luci-app-argon-config
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-arpbind package/luci-app-arpbind
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-autoreboot package/luci-app-autoreboot
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-autotimeset package/luci-app-autotimeset
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-baidupcs-web package/luci-app-baidupcs-web
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-cifs-mount package/luci-app-cifs-mount
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-cifsd package/luci-app-cifsd
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-control-weburl package/luci-app-control-weburl
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-cpufreq package/luci-app-cpufreq
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-diskman package/luci-app-diskman
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-dnsforwarder package/luci-app-dnsforwarder
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-docker package/luci-app-docker
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-dockerman package/luci-app-dockerman
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-easymesh package/luci-app-easymesh
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-eqos package/luci-app-eqos
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-familycloud package/luci-app-familycloud
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-filetransfer package/luci-app-filetransfer
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-frpc package/luci-app-frpc
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-frps package/luci-app-frps
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-godproxy package/luci-app-godproxy
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-guest-wifi package/luci-app-guest-wifi
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-haproxy-tcp package/luci-app-haproxy-tcp
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-ipsec-vpnd package/luci-app-ipsec-vpnd
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-iptvhelper package/luci-app-iptvhelper
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-jd-dailybonus package/luci-app-jd-dailybonus
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-kodexplorer package/luci-app-kodexplorer
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-ksmbd package/luci-app-ksmbd
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-modeminfo package/luci-app-modeminfo
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-music-remote-center package/luci-app-music-remote-center
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-mwan3helper package/luci-app-mwan3helper
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-n2n_v2 package/luci-app-n2n_v2
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-netdata package/luci-app-netdata
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-netspeedtest package/luci-app-netspeedtest
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-nfs package/luci-app-nfs
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-nft-qos package/luci-app-nft-qos
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-nodogsplash package/luci-app-nodogsplash
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-nps package/luci-app-nps
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-oaf package/luci-app-oaf
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-omcproxy package/luci-app-omcproxy
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-openclash package/luci-app-openclash
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-openvpn-server package/luci-app-openvpn-server
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-pppoe-relay package/luci-app-pppoe-relay
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-pptp-server package/luci-app-pptp-server
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-ps3netsrv package/luci-app-ps3netsrv
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-pushbot package/luci-app-pushbot
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-qbittorrent package/luci-app-qbittorrent
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-ramfree package/luci-app-ramfree
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-rclone package/luci-app-rclone
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-samba4 package/luci-app-samba4
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-serverchan package/luci-app-serverchan
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-smartdns package/luci-app-smartdns
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-softethervpn package/luci-app-softethervpn
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-ssr-plus package/luci-app-ssr-plus
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-ssrserver-python package/luci-app-ssrserver-python
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-syncdial package/luci-app-syncdial
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-tcpdump package/luci-app-tcpdump
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-tencentddns package/luci-app-tencentddns
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-ttnode package/luci-app-ttnode
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-ttyd package/luci-app-ttyd
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-udp2raw package/luci-app-udp2raw
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-unblockmusic package/luci-app-unblockmusic
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-usb-printer package/luci-app-usb-printer
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-uugamebooster package/luci-app-uugamebooster
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-v2ray-server package/luci-app-v2ray-server
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-verysync package/luci-app-verysync
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-vlmcsd package/luci-app-vlmcsd
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-vsftpd package/luci-app-vsftpd
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-vssr package/luci-app-vssr
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-webadmin package/luci-app-webadmin
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-wrtbwmon package/luci-app-wrtbwmon
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-xlnetacc package/luci-app-xlnetacc
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-zerotier package/luci-app-zerotier
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-lib-docker package/luci-lib-docker
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-lib-fs package/luci-lib-fs
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-proto-bonding package/luci-proto-bonding
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-theme-argon package/luci-theme-argon
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-theme-infinityfreedom package/luci-theme-infinityfreedom
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-theme-netgear package/luci-theme-netgear
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-theme-rosy package/luci-theme-rosy
svn co https://github.com/x86-arch/NueXini_Packages/trunk/mentohust package/mentohust
svn co https://github.com/x86-arch/NueXini_Packages/trunk/microsocks package/microsocks
svn co https://github.com/x86-arch/NueXini_Packages/trunk/mt package/mt
svn co https://github.com/x86-arch/NueXini_Packages/trunk/mtk-eip93 package/mtk-eip93
svn co https://github.com/x86-arch/NueXini_Packages/trunk/n2n_v2 package/n2n_v2
svn co https://github.com/x86-arch/NueXini_Packages/trunk/naiveproxy package/naiveproxy
svn co https://github.com/x86-arch/NueXini_Packages/trunk/node-request package/node-request
svn co https://github.com/x86-arch/NueXini_Packages/trunk/npc package/npc
svn co https://github.com/x86-arch/NueXini_Packages/trunk/ntfs3-mount package/ntfs3-mount
svn co https://github.com/x86-arch/NueXini_Packages/trunk/ntfs3 package/ntfs3
svn co https://github.com/x86-arch/NueXini_Packages/trunk/oaf package/oaf
svn co https://github.com/x86-arch/NueXini_Packages/trunk/open-app-filter package/open-app-filter
svn co https://github.com/x86-arch/NueXini_Packages/trunk/openwrt-fullconenat package/openwrt-fullconenat
svn co https://github.com/x86-arch/NueXini_Packages/trunk/pdnsd-alt package/pdnsd-alt
svn co https://github.com/x86-arch/NueXini_Packages/trunk/polarssl package/polarssl
svn co https://github.com/x86-arch/NueXini_Packages/trunk/ps3netsrv package/ps3netsrv
svn co https://github.com/x86-arch/NueXini_Packages/trunk/qBittorrent-static package/qBittorrent-static
svn co https://github.com/x86-arch/NueXini_Packages/trunk/qBittorrent package/qBittorrent
svn co https://github.com/x86-arch/NueXini_Packages/trunk/qtbase package/qtbase
svn co https://github.com/x86-arch/NueXini_Packages/trunk/qttools package/qttools
svn co https://github.com/x86-arch/NueXini_Packages/trunk/r8125 package/r8125
svn co https://github.com/x86-arch/NueXini_Packages/trunk/r8152 package/r8152
svn co https://github.com/x86-arch/NueXini_Packages/trunk/r8168 package/r8168
svn co https://github.com/x86-arch/NueXini_Packages/trunk/rblibtorrent package/rblibtorrent
svn co https://github.com/x86-arch/NueXini_Packages/trunk/rclone-ng package/rclone-ng
svn co https://github.com/x86-arch/NueXini_Packages/trunk/rclone-webui-react package/rclone-webui-react
svn co https://github.com/x86-arch/NueXini_Packages/trunk/rclone package/rclone
svn co https://github.com/x86-arch/NueXini_Packages/trunk/redsocks2 package/redsocks2
svn co https://github.com/x86-arch/NueXini_Packages/trunk/shadowsocks-rust package/shadowsocks-rust
svn co https://github.com/x86-arch/NueXini_Packages/trunk/shadowsocksr-libev package/shadowsocksr-libev
svn co https://github.com/x86-arch/NueXini_Packages/trunk/simple-obfs package/simple-obfs
svn co https://github.com/x86-arch/NueXini_Packages/trunk/smartdns package/smartdns
svn co https://github.com/x86-arch/NueXini_Packages/trunk/speedtest package/speedtest
svn co https://github.com/x86-arch/NueXini_Packages/trunk/srelay package/srelay
svn co https://github.com/x86-arch/NueXini_Packages/trunk/ssocks package/ssocks
svn co https://github.com/x86-arch/NueXini_Packages/trunk/tcping package/tcping
svn co https://github.com/x86-arch/NueXini_Packages/trunk/tcpping package/tcpping
svn co https://github.com/x86-arch/NueXini_Packages/trunk/trojan-go package/trojan-go
svn co https://github.com/x86-arch/NueXini_Packages/trunk/trojan-plus package/trojan-plus
svn co https://github.com/x86-arch/NueXini_Packages/trunk/trojan package/trojan
svn co https://github.com/x86-arch/NueXini_Packages/trunk/udp2raw-tunnel package/udp2raw-tunnel
svn co https://github.com/x86-arch/NueXini_Packages/trunk/uugamebooster package/uugamebooster
svn co https://github.com/x86-arch/NueXini_Packages/trunk/v2ray-core package/v2ray-core
svn co https://github.com/x86-arch/NueXini_Packages/trunk/v2ray-plugin package/v2ray-plugin
svn co https://github.com/x86-arch/NueXini_Packages/trunk/verysync package/verysync
svn co https://github.com/x86-arch/NueXini_Packages/trunk/vlmcsd package/vlmcsd
svn co https://github.com/x86-arch/NueXini_Packages/trunk/vsftpd-alt package/vsftpd-alt
svn co https://github.com/x86-arch/NueXini_Packages/trunk/wol package/wol
svn co https://github.com/x86-arch/NueXini_Packages/trunk/wxbase package/wxbase
svn co https://github.com/x86-arch/NueXini_Packages/trunk/xray-core package/xray-core
svn co https://github.com/x86-arch/NueXini_Packages/trunk/xray-plugin package/xray-plugin
svn co https://github.com/x86-arch/NueXini_Packages/trunk/luci-app-passwall package/luci-app-passwall
git clone https://github.com/giaulo/luci-app-filebrowser.git package/luci-app-filebrowser
# Apply patch
# git apply ../router-config/patches/{0001*,0002*}.patch --directory=feeds/luci
#
# ------------------------------- Other ends -------------------------------

