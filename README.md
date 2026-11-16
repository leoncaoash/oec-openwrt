# OEC OpenWrt · candidate build

This repository targets **Onething OEC (RK3566)** and **OpenWrt 25.12.6**. It uses the existing OEC U-Boot, **not** a generic Rockchip disk image.

## Default network

- `eth0`: upstream WAN, DHCP
- RTL8153 `eth1`: downstream LAN, `192.168.88.1/24`
- DHCP LAN: `192.168.88.100` through `192.168.88.199`
- Firewall: LAN → WAN allowed; NAT masquerade on WAN
- USB wireless RTL8822BU driver included, but AP must be configured and tested separately

## Included services

LuCI (Chinese requested and build fails if its package option is unavailable), ttyd, WireGuard, ZeroTier, both USB drivers. **Mihomo/OpenClash is not included**; these need a separately verified package source and configuration.

## Build

GitHub Actions → OEC OpenWrt → Run workflow. The workflow generates a *candidate*, not an automatically safe flash image.

## Before flashing — important

1. Verify that a tested OEC recovery procedure and recovery image are available.
2. Back up original p5, p6 and p7, especially p7 `/overlay` (may include Docker data), **before** writing anything.
3. Existing p7 overlay contains files from another system. A new read-only `/etc/uci-defaults` cannot reliably override an old overlay. Plan an isolated/clean first boot and a recovery path; do not reuse the old upperdir.
4. Test USB RTL8153 if it has a different dynamic interface name; static `eth1` is based on the current system and may change in a new kernel.
5. The generated `kernel.img`, `rockchip.dtb`, `rootfs.squashfs` were not yet tested by booting this OEC. This package contains **no flash script** and intentionally performs no partition writes.
6. The device-tree injection is into the prepared kernel tree. This is suitable for a build trial, not a maintained upstream board patch. The default kernel Image is not proof of compatibility with the board boot chain.

## Source

`files/rk3566-onething-edge-cube.dts` is taken from the user's supplied source. `files/oec.mk` selects the device. First-boot network setup lives under `files/etc/uci-defaults/99-oec-network`.
