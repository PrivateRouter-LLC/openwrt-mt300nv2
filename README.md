# How to Flash a GL.iNet Router with PrivateRouter OpenWRT 📡

Welcome to the repository housing build files for our OpenWRT image for GL.iNet MT300N-V2 Routers.

## Purchase Options 🛒
- Get a pre-flashed GL.iNet router from [PrivateRouter.com](https://privaterouter.com)
- Flash it yourself following this guide.

## Why PrivateRouter OpenWRT vs Vanilla OpenWRT? 🤔
- Regularly updated mainline OpenWRT builds.
- Enhanced functionality using a modified version of [openwrt-auto-extroot](https://github.com/attila-lendvai/openwrt-auto-extroot).
- Expand package storage to 500MB for apps like Samba, DLNA, Syncthing, and more.

## Requirements 📋
- GL.iNet Router (any model)
- x1 USB drives for additional storage
- Storage enables running apps like V2ray, OpenVPN, WireGuard, SSTP, OpenConnect, etc.
  
![requirements](https://github.com/PrivateRouter-LLC/SelfHostedApps/blob/main/images/requirements.png?raw=true)


## Setup Your Environment 🖥️
- Tutorial uses Windows (similar for MacOS/Linux).
- Download `sysupgrade.bin` file from this repo.
- Set computer's IP to static: `192.168.1.2` with netmask `255.255.255.0`.

## Access GL.iNet Uboot 🔄
1. Connect computer to router's LAN port.
2. Hold the reset button on the router for 5 seconds or until the uboot menu appears.
3. Upgrade firmware via uboot (http://192.168.1.1). GL.iNet firmware blocks upgrades, so use uboot.

## Stage 1: Initial Setup 🛠️
- Installs minimum packages and partitions USB for storage.
- Change IP address from static to automatic.
- Access new OpenWRT menu at http://192.168.1.1. Monitor under system log.

## Stage 2: Internet Connection 🌐
- Connect router to the internet.
- Monitor progress under status/system log.
- Router checks into PrivateRouter GitHub repo, installs necessary packages.

## Stage 3: Finalization 🎉
- Router verifies package installations and updates.
- Access 500MB package storage under system/software menu.
- Installs PrivateRouter theme, TorGuard VPN packages, app store, mesh WiFi, etc.

## Benefits of PrivateRouter OpenWRT 🌟
- Extra storage capability.
- Custom-built apps for TorGuard VPN's services.
- batman-adv mesh capabilities for complex local networks.

## Additional Apps and Features 🔧
- Install apps from the app menu or System/software menu.
- Mainline OpenWRT repo apps available.

🎊 Congratulations! Your GL.iNet WiFi router now surpasses its intended capabilities and embraces true open-source spirit. 🚀
