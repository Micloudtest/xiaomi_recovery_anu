 # 
 # Copyright (C) 2023 The Android Open Source Project 
 # Copyright (C) 2023 SebaUbuntu's TWRP device tree generator 
 # 
 # SPDX-License-Identifier: Apache-2.0 
 #  
  
DEVICE_PATH := device/xiaomi/ruby

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    system \
    system_ext \
    vendor \
    product \
    boot \
    vbmeta_vendor \
    vbmeta_system

BOARD_USES_RECOVERY_AS_BOOT := true

# Architecture 
 TARGET_ARCH := arm64 
 TARGET_ARCH_VARIANT := armv8-a 
 TARGET_CPU_ABI := arm64-v8a 
 TARGET_CPU_ABI2 := 
 TARGET_CPU_VARIANT := generic 
 TARGET_CPU_VARIANT_RUNTIME := cortex-a55 

 TARGET_2ND_ARCH := arm 
 TARGET_2ND_ARCH_VARIANT := armv7-a-neon 
 TARGET_2ND_CPU_ABI := armeabi-v7a 
 TARGET_2ND_CPU_ABI2 := armeabi 
 TARGET_2ND_CPU_VARIANT := generic 
 TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55 

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := ruby
TARGET_NO_RECOVERY := true

# Platform
TARGET_BOARD_PLATFORM := mt6877

# Kernel
 BOARD_BOOTIMG_HEADER_VERSION := 2
 BOARD_KERNEL_BASE := 0x40078000
 BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2
 BOARD_KERNEL_PAGESIZE := 2048
 BOARD_RAMDISK_OFFSET := 0x11088000
 BOARD_KERNEL_TAGS_OFFSET := 0x07c08000

 TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
 TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
 BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
 BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
 BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
 BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
 BOARD_KERNEL_IMAGE_NAME := Image.gz

# AVB
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 134217728
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_PRODUCT := product

# Dynamic Partitions
BOARD_SUPER_PARTITION_SIZE := 9126805504 # TODO: Fix hardcoded value
BOARD_SUPER_PARTITION_GROUPS := xiaomi_dynamic_partitions
BOARD_XIAOMI_DYNAMIC_PARTITIONS_PARTITION_LIST := system vendor product
BOARD_XIAOMI_DYNAMIC_PARTITIONS_SIZE := 9122611200 # TODO: Fix hardcoded value

# System as Root
BOARD_SUPPRESS_SECURE_ERASE := true

# Metadata
BOARD_USES_METADATA_PARTITION := true
BOARD_ROOT_EXTRA_FOLDERS += metadata

# Security patch level
PLATFORM_VERSION := 13
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
BOOT_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab

# Display
TARGET_SCREEN_DENSITY := 440
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 2047
TW_DEFAULT_BRIGHTNESS := 1200

# StatusBar
TW_STATUS_ICONS_ALIGN := center
TW_CUSTOM_CPU_POS := "300"
TW_CUSTOM_CLOCK_POS := "70"
TW_CUSTOM_BATTERY_POS := "790"

# Tool
TW_INCLUDE_REPACKTOOLS := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_LIBRESETPROP := true
TW_INCLUDE_LPDUMP := true
TW_INCLUDE_LPTOOLS := true

# Crypto
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true

# TWRP Configuration
#TW_DEVICE_VERSION := Norikhsan90
TW_FRAMERATE := 90
TW_THEME := portrait_hdpi
TW_INCLUDE_NTFS_3G := true 
TW_EXTRA_LANGUAGES := true
TW_BACKUP_EXCLUSIONS := /data/fonts
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_NO_SCREEN_BLANK := true
TW_SCREEN_BLANK_ON_BOOT := true
BOARD_HAS_NO_SELECT_BUTTON := true
TW_NO_HAPTICS := true
TW_INCLUDE_FASTBOOTD := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := /config/usb_gadget/g1/functions/mass_storage.usb0/lun.%d/file

# This device does not support fastboot boot, do *NOT* remove!
TW_NO_FASTBOOT_BOOT := true

# Log
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
