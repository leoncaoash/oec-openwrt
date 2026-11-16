
# Onething OEC - RK3566
# OpenWrt 25.12.6

define Device/onething_oec
  $(Device/rk3566)

  DEVICE_VENDOR := Onething
  DEVICE_MODEL := OEC

  DEVICE_DTS := rk3566-onething-edge-cube
  SUPPORTED_DEVICES := onething,edge-cube onething,oec

  # Raw ARM64 kernel for U-Boot booti
  KERNEL_NAME := Image
  KERNEL := kernel-bin
  KERNEL_INSTALL := 1

  # USB Ethernet RTL8153 and WiFi RTL8822BU
  DEVICE_PACKAGES += \
    kmod-usb-net-rtl8152 \
    kmod-rtw88-8822bu \
    wpad-basic-mbedtls

  # Disable default Rockchip disk images
  IMAGES :=
endef

TARGET_DEVICES += onething_oec
