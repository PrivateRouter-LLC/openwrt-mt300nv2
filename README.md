# How to Flash a GL.iNet Router with PrivateRouter OpenWRT 📡

Welcome to the repository housing build files for our OpenWRT image for GL.iNet MT300N-V2 Routers.

## Purchase Options 🛒
- Get a pre-flashed GL.iNet router from [PrivateRouter.com](https://privaterouter.com)
- Or flash it yourself by following this guide.

## Why PrivateRouter OpenWRT vs Vanilla OpenWRT? 🤔
- Regularly updated mainline OpenWRT builds.
- Enhanced functionality using a modified version of [openwrt-auto-extroot](https://github.com/attila-lendvai/openwrt-auto-extroot).
- Expand package storage to 500MB for apps like Samba, DLNA, Syncthing, and more.

## Requirements 📋
- GL.iNet Router (any model)
- 1x USB drive for additional storage
- Storage enables running apps like V2ray, OpenVPN, WireGuard, SSTP, OpenConnect, etc.
  
![requirements](https://github.com/PrivateRouter-LLC/SelfHostedApps/blob/main/images/requirements.png?raw=true)

## Setup Your Environment 🖥️
- Tutorial uses Windows (similar for MacOS/Linux).
- Download `sysupgrade.bin` file from this repo.
- Set computer's IP to static: `192.168.1.2` with netmask `255.255.255.0`.

![set static ip](https://github.com/PrivateRouter-LLC/SelfHostedApps/blob/main/images/set_static_ip.png?raw=true)

## Access GL.iNet Uboot 🔄
1. Connect computer to router's LAN port.
2. Hold the reset button on the router until the Uboot menu appears, which usually takes about 5 seconds.
3. Upgrade firmware via uboot (http://192.168.1.1). GL.iNet firmware blocks upgrades, so use uboot.

![hold reset](https://github.com/PrivateRouter-LLC/SelfHostedApps/blob/main/images/press_and_hold_reset.png?raw=true)

Upload the .bin firmware:
![choose a file](https://github.com/PrivateRouter-LLC/SelfHostedApps/blob/main/images/screely-1705000832586.png?raw=true)

Click Update Firmware:
![upload firmware](https://github.com/PrivateRouter-LLC/SelfHostedApps/blob/main/images/screely-1705000855542.png?raw=true)

## Stage 1: Initial Setup 🛠️
- Installs minimum packages and partitions USB for storage.
- Change IP address from static to automatic.
- Access new OpenWRT menu at http://192.168.8.1. Monitor the system log.

Set your IP back to automatic:
![switch to automatic IP](https://github.com/PrivateRouter-LLC/SelfHostedApps/blob/main/images/switch_to_automatic.png?raw=true)

Point your web browser to http://192.168.8.1 and click login:
![login](https://github.com/PrivateRouter-LLC/SelfHostedApps/blob/main/images/screely-1705000892982.png?raw=true)

Navigate to System / status to verify the USB has been partitioned and wait for it to reboot:
![partition usb](https://github.com/PrivateRouter-LLC/SelfHostedApps/blob/main/images/screely-1705000932607.png?raw=true)

## Stage 2: Internet Connection 🌐
- Connect router to the internet.
- Monitor progress under status/system log.
- Router checks into PrivateRouter GitHub repo, installs necessary packages.

Plug in an internet cable to the WAN port or navigate to Network / Wireless and connect to an existing WiFi network:
![plug in internet](https://github.com/PrivateRouter-LLC/SelfHostedApps/blob/main/images/plug_in_internet.png?raw=true)

The router will wait for Internet access before proceeding to the next stage:
![waiting for internet](https://github.com/PrivateRouter-LLC/SelfHostedApps/blob/main/images/screely-1705000978115.png?raw=true)

Once internet is enabled, let the install process do its thing:
![internet enabled](https://github.com/PrivateRouter-LLC/SelfHostedApps/blob/main/images/screely-1705001016356.png?raw=true)

While the install is running you can visit System software and see that your OpenWRT router now has 500mb package storage:
![500mb package storage](https://github.com/PrivateRouter-LLC/SelfHostedApps/blob/main/images/screely-1705001097340.png?raw=true)

## Stage 3: Finalization 🎉
- Router verifies package installations and updates.
- Access 500MB package storage under system/software menu.
- Installs PrivateRouter theme, TorGuard VPN packages, app store, mesh WiFi, etc.

After the last reboot, wait a few minutes and click refresh. You should see the Argon theme installed:
![Argon](https://github.com/PrivateRouter-LLC/SelfHostedApps/blob/main/images/screely-1705001190710.png?raw=true)

## Benefits of PrivateRouter OpenWRT 🌟
- Extra storage capability.
- Custom-built apps for TorGuard VPN's services.
- batman-adv mesh capabilities for complex local networks.
- TorGuard WireGuard, OpenVPN, SSTP, Openconnect, V2rayA

Log out and then log back into OpenWRT to see the newly installed apps, change your password and have a look around. Once the remaining apps are installed, you can add more, because you have 500mb app storage space:
![apps](https://github.com/PrivateRouter-LLC/SelfHostedApps/blob/main/images/screely-1705001293512.png?raw=true)

You can now enable V2rayA if required:
![V2ray](https://github.com/PrivateRouter-LLC/SelfHostedApps/blob/main/images/screely-1705001318068.png?raw=true)

Enable/Disable WiFi under Network/Wireless:
![wifi](https://github.com/PrivateRouter-LLC/SelfHostedApps/blob/main/images/screely-1705001337000.png?raw=true)

If your Gli WiFi router supports Mesh, Batman-adv will be installed:
![mesh](https://github.com/PrivateRouter-LLC/SelfHostedApps/blob/main/images/screely-1705001375186.png?raw=true)

Built in TorGuard VPN Wireguard, OpenVPN, SSTP, OpenConnect:
![built in VPN](https://github.com/PrivateRouter-LLC/SelfHostedApps/blob/main/images/screely-1705001250334.png?raw=true)

## Additional Apps and Features 🔧
- Install apps from the app menu or System/software menu.
- Mainline OpenWRT repo apps available.

Install any app with OpenWRT support:
![software](https://github.com/PrivateRouter-LLC/SelfHostedApps/blob/main/images/screely-1705001398395.png?raw=true)

🎊 Congratulations! Your GL.iNet WiFi router now surpasses its intended capabilities and embraces true open-source spirit. 🚀

# :earth_americas: FLASH THE PLANET!!!! :earth_americas:
