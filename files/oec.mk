
# Onething OEC - RK3566
# OpenWrt 25.12.6

define Device/onething_oec
  $(Device/rk3566)
  DEVICE_VENDOR := Onething
  DEVICE_MODEL := OEC
  DEVICE_DTS := rk3566-onething-edge-cube
  SUPPORTED_DEVICES := onething,edge-cube onething,oec
  DEVICE_PACKAGES := kmod-rtw88-8822bu wpad-basic-mbedtls
  IMAGES :=
endef

TARGET_DEVICES += onething_oec
