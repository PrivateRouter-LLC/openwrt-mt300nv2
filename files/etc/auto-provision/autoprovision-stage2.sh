#!/bin/sh

# autoprovision stage 2: this script will be executed upon boot if the extroot was successfully mounted (i.e. rc.local is run from the extroot overlay)

. /etc/auto-provision/autoprovision-functions.sh

# Verify we are connected to the Internet
is_connected() {
    ping -q -c3 1.1.1.1 >/dev/null 2>&1
    return $?
}

# Log to the system log and echo if needed
log_say()
{
    echo "${1}"
    logger "${1}"
}

# Fix our DNS and update packages and do not check https certs
fixPackagesDNS()
{
    log_say "Fixing DNS and installing required packages for opkg"
    # Set our router's dns
    echo "nameserver 1.1.1.1" > /etc/resolv.conf

    log_say "Installing opkg packages"
    opkg --no-check-certificate update
    opkg --no-check-certificate install wget-ssl unzip ca-bundle ca-certificates
    opkg --no-check-certificate install git git-http jq curl unzip
}

installPackages()
{
    signalAutoprovisionWaitingForUser

    until (opkg update)
     do
        log "opkg update failed. No internet connection? Retrying in 15 seconds..."
        sleep 15
    done

    signalAutoprovisionWorking

    log "Autoprovisioning stage2 is about to install packages"
  sed -i 's,https,http,g' /etc/opkg/distfeeds.conf;

  log_say "updating all packages!"

   log_say "                                                                      "
   log_say " ███████████             ███                         █████            "
   log_say "░░███░░░░░███           ░░░                         ░░███             "
   log_say " ░███    ░███ ████████  ████  █████ █████  ██████   ███████    ██████ "
   log_say " ░██████████ ░░███░░███░░███ ░░███ ░░███  ░░░░░███ ░░░███░    ███░░███"
   log_say " ░███░░░░░░   ░███ ░░░  ░███  ░███  ░███   ███████   ░███    ░███████ "
   log_say " ░███         ░███      ░███  ░░███ ███   ███░░███   ░███ ███░███░░░  "
   log_say " █████        █████     █████  ░░█████   ░░████████  ░░█████ ░░██████ "
   log_say "░░░░░        ░░░░░     ░░░░░    ░░░░░     ░░░░░░░░    ░░░░░   ░░░░░░  "
   log_say "                                                                      "
   log_say "                                                                      "
   log_say " ███████████                        █████                             "
   log_say "░░███░░░░░███                      ░░███                              "
   log_say " ░███    ░███   ██████  █████ ████ ███████    ██████  ████████        "
   log_say " ░██████████   ███░░███░░███ ░███ ░░░███░    ███░░███░░███░░███       "
   log_say " ░███░░░░░███ ░███ ░███ ░███ ░███   ░███    ░███████  ░███ ░░░        "
   log_say " ░███    ░███ ░███ ░███ ░███ ░███   ░███ ███░███░░░   ░███            "
   log_say " █████   █████░░██████  ░░████████  ░░█████ ░░██████  █████           "
   log_say "░░░░░   ░░░░░  ░░░░░░    ░░░░░░░░    ░░░░░   ░░░░░░  ░░░░░            "

   opkg update
   #Go Go Packages
   opkg install base-files busybox ca-bundle cgi-io dnsmasq dropbear firewall fstools fwtool getrandom hostapd-common ip6tables iptables iw iwinfo jshn jsonfilter kernel kmod-ath kmod-ath9k kmod-ath9k-common kmod-cfg80211 kmod-gpio-button-hotplug kmod-ip6tables

   opkg install kmod-ipt-conntrack kmod-ipt-core kmod-ipt-nat kmod-ipt-offload kmod-lib-crc-ccitt kmod-mac80211 kmod-nf-conntrack kmod-nf-conntrack6 kmod-nf-flow kmod-nf-ipt kmod-nf-ipt6 kmod-nf-nat kmod-nf-reject kmod-nf-reject6 kmod-nls-base kmod-ppp kmod-pppoe

   opkg install kmod-pppox kmod-slhc kmod-usb-core kmod-usb-ehci libblobmsg-json20210516 libc libgcc1 libip4tc2 libip6tc2 libiwinfo-data libiwinfo-lua libiwinfo20210430 libjson-c5 libjson-script20210516 liblua5.1.5 liblucihttp-lua liblucihttp0 libnl-tiny1 libpthread

   opkg install libubox20210516 libubus-lua libubus20210630 libuci20130104 libuclient20201210 libustream-wolfssl20201210 libxtables12 logd lua luci luci-app-firewall luci-app-opkg luci-base luci-lib-base luci-lib-ip luci-lib-jsonc luci-lib-nixio luci-mod-admin-full

   opkg install luci-mod-network luci-mod-status luci-mod-system luci-proto-ipv6 luci-proto-ppp luci-ssl

   opkg install luci-theme-bootstrap luci-theme-openwrt-2020 luci-app-openvpn wireguard-tools luci-app-wireguard minidlna openvpn-openssl mtd netifd odhcp6c odhcpd-ipv6only openwrt-keyring opkg ppp ppp-mod-pppoe procd px5g-wolfssl

   opkg install opkg update git git-http jq curl bash wget kmod-usb-net-rndis luci-mod-dashboard luci-app-commands luci-app-vnstat rpcd-mod-luci luci-app-statistics luci-app-samba4 samba4-server luci-mod-admin-full luci-mod-network luci-mod-status luci-mod-system

   opkg install kmod-usb-net-cdc-eem kmod-usb-net-cdc-ether kmod-usb-net-cdc-subset kmod-nls-base kmod-usb-core kmod-usb-net kmod-usb-net-cdc-ether kmod-usb2 kmod-usb-net-ipheth usbmuxd libimobiledevice usbutils luci-app-nlbwmon luci-app-adblock nano ttyd fail2ban speedtest-netperf opkg install vsftpd samba36-server luci-app-samba

   opkg install git git-http jq curl bash wget kmod-usb-net-rndis luci-mod-dashboard luci-app-commands luci-app-vnstat
   opkg install rpcd-mod-luci luci-app-statistics luci-app-samba4 samba4-server luci-mod-admin-full luci-mod-network luci-mod-status luci-mod-system kmod-usb-net-cdc-eem
   opkg install kmod-usb-net-cdc-ether kmod-usb-net-cdc-subset kmod-nls-base kmod-usb-core kmod-usb-net kmod-usb-net-cdc-ether kmod-usb2 kmod-usb-net-ipheth
   opkg install usbmuxd libimobiledevice usbutils luci-app-nlbwmon luci-app-adblock nano ttyd fail2ban speedtest-netperf opkg install vsftpd samba36-server luci-app-samba

  ## V2RAYA INSTALLER ##
   log_say "Installing V2rayA..."
  ## download

  opkg update; opkg install unzip wget-ssl

    ## Remove DNSMasq

  opkg remove dnsmasq

  opkg install dnsmasq-full

  opkg install v2raya

  opkg install /etc/luci-app-v2raya_6_all.ipk
  sed -i 's,http,https,g' /etc/opkg/distfeeds.conf;

}

autoprovisionStage2()
{
    log "Autoprovisioning stage2 speaking"

    # TODO this is a rather sloppy way to test whether stage2 has been done already, but this is a shell script...
    if [ $(uci get system.@system[0].log_type) == "file" ]; then
        log "Seems like autoprovisioning stage2 has been done already. Running stage3."
        #/root/autoprovision-stage3.py
    else
        signalAutoprovisionWorking

    echo "nameserver 1.1.1.1" > /etc/resolv.conf
	  log_say "Updating system time using ntp; otherwise the openwrt.org certificates are rejected as not yet valid."
    ntpd -d -q -n -p 0.openwrt.pool.ntp.org

        # CUSTOMIZE: with an empty argument it will set a random password and only ssh key based login will work.
        # please note that stage2 requires internet connection to install packages and you most probably want to log in
        # on the GUI to set up a WAN connection. but on the other hand you don't want to end up using a publically
        # available default password anywhere, therefore the random here...
        #setRootPassword ""

        installPackages

        cat >${overlay_root}/etc/rc.local <<EOF
chmod a+x /etc/stage3.sh
bash /etc/stage3.sh || exit 1
EOF

        mkdir -p /var/log/archive

        # logrotate is complaining without this directory
        mkdir -p /var/lib

        uci set system.@system[0].log_type=file
        uci set system.@system[0].log_file=/var/log/syslog
        uci set system.@system[0].log_size=0

        uci commit
        sync
        reboot
    fi
}

# Check and wait for Internet connection
while ! is_connected; do
    log_say "Waiting for Internet connection..."
    sleep 1
done
log_say "Internet connection established"

fixPackagesDNS

autoprovisionStage2
