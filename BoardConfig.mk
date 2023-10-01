c # 
 # Copyright (C) 2023 The Android Open Source Project 
 # 
 # SPDX-License-Identifier: Apache-2.0 
 # 
  
 DEVICE_PATH := device/xiaomi/ruby

 # For building with minimal manifest  
 ALLOW_MISSING_DEPENDENCIES := true 

 # A/B
 AB_OTA_UPDATER := true
 AB_OTA_PARTITIONS := \
    boot \
    dtbo \
    system \
    system_ext \
    product \
    vendor \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor

 # Architecture 
 TARGET_ARCH             := arm64 
 TARGET_ARCH_VARIANT     := armv8-a 
 TARGET_CPU_ABI          := arm64-v8a 
 TARGET_CPU_ABI2         := 
 TARGET_CPU_VARIANT      := generic 
 TARGET_CPU_VARIANT_RUNTIME := cortex-a55 
  
 TARGET_2ND_ARCH         := arm 
 TARGET_2ND_ARCH_VARIANT := armv7-a-neon
 TARGET_2ND_CPU_ABI      := armeabi-v7a 
 TARGET_2ND_CPU_ABI2     := armeabi 
 TARGET_2ND_CPU_VARIANT  := generic 
 TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55 
  
 # Bootloader 
 TARGET_NO_BOOTLOADER          := true 
 TARGET_USES_UEFI              := true 
  
 # Platform 
 TARGET_BOARD_PLATFORM         := mt6877
  
 # Kernel 
 BOARD_KERNEL_PAGESIZE         := 2048 
 TARGET_KERNEL_ARCH            := arm64 
 TARGET_KERNEL_HEADER_ARCH     := arm64 
 BOARD_KERNEL_IMAGE_NAME       := Image
 TARGET_KERNEL_CONFIG          := ruby_defconfig
 TARGET_KERNEL_SOURCE          := kernel/xiaomi/ruby
 BOARD_BOOT_HEADER_VERSION     := 2 
 BOARD_INCLUDE_DTB_IN_BOOTIMG := true

 BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2
 BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
 BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
 BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
 BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET) 

# Kernel - prebuilt  
 TARGET_FORCE_PREBUILT_KERNEL := true  
 ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)  
 TARGET_PREBUILT_KERNEL := $(PREBUILT_PATH)/kernel  
 TARGET_PREBUILT_DTB    := $(PREBUILT_PATH)/dtb.img  
 BOARD_MKBOOTIMG_ARGS   += --dtb $(TARGET_PREBUILT_DTB)  
 BOARD_INCLUDE_DTB_IN_BOOTIMG :=  
 endif 
  
 # Verified Boot 
 BOARD_AVB_ENABLE := true
 BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3 
  
 # VNDK Treble 
 BOARD_VNDK_VERSION := current 

 # Partitions 
 BOARD_FLASH_BLOCK_SIZE                := 131072 
 BOARD_RECOVERYIMAGE_PARTITION_SIZE    := 134217728
 BOARD_BOOTIMAGE_PARTITION_SIZE        := 134217728
 BOARD_KERNEL_BASE                     := 0x40078000
 BOARD_KERNEL_TAGS_OFFSET              := 0x07c08000
 BOARD_RAMDISK_OFFSET                  := 0x11088000
 BOARD_DTB_OFFSET                      := 0x07c08000 
  
 # Dynamic Partitions 
 BOARD_SUPER_PARTITION_SIZE        := 9126805504 
 BOARD_SUPER_PARTITION_GROUPS      := xiaomi_dynamic_partitions 
 BOARD_XIAOMI_DYNAMIC_PARTITIONS_SIZE := 9122611200 
 BOARD_XIAOMI_DYNAMIC_PARTITIONS_PARTITION_LIST := \
         system \
         vendor \
         product

 BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
 BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs 

 BOARD_USES_PRODUCTIMAGE := true 
 BUILD_WITHOUT_VENDOR := true
  
 # Workaround for error copying vendor files to recovery ramdisk 
 BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := erofs
 BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := erofs
 TARGET_COPY_OUT_VENDOR  := vendor
 TARGET_COPY_OUT_PRODUCT := product
  
 # Filesystems 
 TARGET_USERIMAGES_USE_EXT4    := true 
 TARGET_USERIMAGES_USE_F2FS    := true 
 TARGET_USES_MKE2FS            := true 

 # System Properties 
 TARGET_SYSTEM_PROP := $(DEVICE_PATH)/system.prop 
  
 # Despite being VA/B device, there is a dedicated recovery partition 
 BOARD_HAS_LARGE_FILESYSTEM     := true 
 BOARD_HAS_NO_SELECT_BUTTON     := true 
 BOARD_SUPPRESS_SECURE_ERASE    := true 
 TARGET_RECOVERY_PIXEL_FORMAT   := "RGBX_8888" 
 BOARD_USES_RECOVERY_AS_BOOT    := true 
 TARGET_NO_RECOVERY             := true
 TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab 

 # TWRP - Specifics 
 TW_THEME                := portrait_hdpi
 TW_BRIGHTNESS_PATH      := "/sys/class/leds/lcd-backlight/brightness"
 TW_DEFAULT_LANGUAGE     := en 
 TW_USE_TOOLBOX          := true 
 TW_INCLUDE_NTFS_3G      := true  
 TW_INCLUDE_REPACKTOOLS  := true 
 TW_INCLUDE_RESETPROP    := true 
 TW_MAX_BRIGHTNESS       := 2047 
 TW_DEFAULT_BRIGHTNESS   := 200 
 TW_EXCLUDE_APEX         := true 
 TW_INCLUDE_FASTBOOTD    := true
  
 # Set panel refresh rate to 90 Hertz for smoother experience 
 # Possible supported frequencies: 30, 60, 90, 120 
 TW_FRAMERATE := 90 
 TW_BATTERY_SYSFS_WAIT_SECONDS := 6 
 TW_EXCLUDE_DEFAULT_USB_INIT   := true 
  
 # TWRP - Crypto 
 TW_INCLUDE_CRYPTO               := true 
 TW_INCLUDE_CRYPTO_FBE           := true 
 TW_INCLUDE_FBE_METADATA_DECRYPT := true 
 
# Hack: prevent anti rollback 
 PLATFORM_SECURITY_PATCH      := 2099-12-31 
 VENDOR_SECURITY_PATCH        := 2099-12-31 
 PLATFORM_VERSION             := 20.1.0 
 PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)

 # Debug
 TARGET_USES_LOGD        := true
 TWRP_INCLUDE_LOGCAT     := true 
