
# Onething OEC - RK3566
# OpenWrt 25.12

define Device/onething_oec
  $(Device/rk3566)
  DEVICE_VENDOR := Onething
  DEVICE_MODEL := OEC
  DEVICE_DTS := rk3566-onething-edge-cube
  SUPPORTED_DEVICES := onething,edge-cube onething,oec
  IMAGES :=
endef
TARGET_DEVICES += onething_oec
