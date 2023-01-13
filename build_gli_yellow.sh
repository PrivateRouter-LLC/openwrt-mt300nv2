#!/bin/bash

OUTPUT="$(pwd)/images"
BUILD_VERSION="22.03.3"
BOARD_NAME="ramips"
BOARD_SUBNAME="mt7620"
BUILDER="https://downloads.openwrt.org/releases/${BUILD_VERSION}/targets/${BOARD_NAME}/${BOARD_SUBNAME}/openwrt-imagebuilder-${BUILD_VERSION}-${BOARD_NAME}-${BOARD_SUBNAME}.Linux-x86_64.tar.xz"

BASEDIR=$(realpath "$0" | xargs dirname)

# download image builder
if [ ! -f "${BUILDER##*/}" ]; then
	wget "$BUILDER"
	tar xJvf "${BUILDER##*/}"
fi

[ -d "${OUTPUT}" ] || mkdir "${OUTPUT}"

cd openwrt-*/

# clean previous images
make clean

make image  PROFILE="glinet_gl-mt300n" \
          PACKAGES="kmod-rt2800-usb rt2800-usb-firmware kmod-cfg80211 kmod-lib80211 kmod-mac80211 kmod-rtl8192cu \
                     block-mount kmod-fs-ext4 kmod-usb-storage blkid mount-utils luci \
                     kmod-usb-storage kmod-usb-ohci kmod-usb-uhci e2fsprogs fdisk resize2fs dnsmasq" \
          FILES="${BASEDIR}/files/" \
          BIN_DIR="$OUTPUT"
