 # 
 # Copyright (C) 2023 The Android Open Source Project 
 # 
 # SPDX-License-Identifier: Apache-2.0 
 # 
  
 DEVICE_PATH := device/xiaomi/ruby
  
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
 TARGET_OTA_ASSERT_DEVICE      := ruby,rubypro
  
 # Kernel 
 BOARD_KERNEL_PAGESIZE         := 2048 
 TARGET_KERNEL_ARCH            := arm64 
 TARGET_KERNEL_HEADER_ARCH     := arm64 
 BOARD_KERNEL_IMAGE_NAME       := Image
 TARGET_KERNEL_CONFIG          := ruby_defconfig
 TARGET_KERNEL_SOURCE          := kernel/xiaomi/ruby
 BOARD_BOOT_HEADER_VERSION     := 2 
 TARGET_KERNEL_CLANG_COMPILE   := true
 BOARD_INCLUDE_DTB_IN_BOOTIMG := true
 BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2
 BOARD_KERNEL_CMDLINE += androidboot.init_fatal_reboot_target=bootloader
 BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
 BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
 BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
 BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)

# Kernel - prebuilt  
 TARGET_FORCE_PREBUILT_KERNEL := true  
 ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)  
 TARGET_PREBUILT_KERNEL := $(PREBUILT_PATH)/kernel  
 TARGET_PREBUILT_DTB    := $(PREBUILT_PATH)/dtb.img  
 BOARD_MKBOOTIMG_ARGS   += --dtb $(TARGET_PREBUILT_DTB)  
 BOARD_INCLUDE_DTB_IN_BOOTIMG :=  
 endif 

 # GSI && GKI 
 BOARD_USES_GENERIC_KERNEL_IMAGE := true 
 BOARD_MOVE_GSI_AVB_KEYS_TO_VENDOR_BOOT := true 
   
 # Despite being VA/B device, there is a dedicated recovery partition 
 BOARD_USES_RECOVERY_AS_BOOT := true 
 BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := false 
  
 # Use LZ4 Ramdisk compression instead of GZIP 
 BOARD_RAMDISK_USE_LZ4 := true 
  
 # Power 
 ENABLE_CPUSETS    := true 
 ENABLE_SCHEDBOOST := true 
  
 # A/B
AB_OTA_UPDATER := true
TW_INCLUDE_REPACKTOOLS := true

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
  
 # Verified Boot 
 BOARD_AVB_ENABLE := true 
  
 # VNDK Treble 
 BOARD_VNDK_VERSION := current 

 # Partitions 
 BOARD_FLASH_BLOCK_SIZE                := 131072 
 BOARD_RECOVERYIMAGE_PARTITION_SIZE    := 134217728 
 BOARD_DTBOIMG_PARTITION_SIZE          := 33554432 
 BOARD_BOOTIMAGE_PARTITION_SIZE        := 134217728
 BOARD_KERNEL_BASE                     := 0x40078000
 BOARD_KERNEL_TAGS_OFFSET              := 0x07c08000
 BOARD_RAMDISK_OFFSET                  := 0x11088000
 BOARD_DTB_OFFSET                      := 0x07c08000
  
 BOARD_USES_METADATA_PARTITION := true 
 BOARD_USES_VENDOR_DLKMIMAGE   := true 
 BOARD_USES_SYSTEM_DLKMIMAGE   := true
 BOARD_USES_SYSTEM_EXTIMAGE    := true 
  
 # Dynamic Partitions 
 BOARD_SUPER_PARTITION_SIZE        := 9126805504 
 BOARD_SUPER_PARTITION_GROUPS      := xiaomi_dynamic_partitions 
 BOARD_XIAOMI_DYNAMIC_PARTITIONS_SIZE := 9122611200 
 BOARD_XIAOMI_DYNAMIC_PARTITIONS_PARTITION_LIST := \
         system \
         system_ext \
         vendor \
         product

 BOARD_PARTITION_LIST := $(call to-upper, $(BOARD_XIAOMI_DYNAMIC_PARTITIONS_PARTITION_LIST)) 
 $(foreach p, $(BOARD_PARTITION_LIST), $(eval BOARD_$(p)IMAGE_FILE_SYSTEM_TYPE := erofs)) 
 $(foreach p, $(BOARD_PARTITION_LIST), $(eval TARGET_COPY_OUT_$(p) := $(call to-lower, $(p)))) 
  
 BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs 
 TARGET_COPY_OUT_SYSTEM_EXT := system_ext 
 TARGET_COPY_OUT_PRODUCT    := product 
  
 # Filesystems 
 TARGET_USERIMAGES_USE_EXT4    := true 
 TARGET_USERIMAGES_USE_F2FS    := true 
 TARGET_USES_MKE2FS            := true 
 BOARD_HAS_LARGE_FILESYSTEM    := true 
  
 # Workaround for error copying vendor files to recovery ramdisk 
 BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4 
 TARGET_COPY_OUT_VENDOR := vendor 
  
 # System Properties 
 TARGET_SYSTEM_PROP := $(DEVICE_PATH)/system.prop 
  
 # Recovery 
 BOARD_HAS_LARGE_FILESYSTEM     := true 
 BOARD_HAS_NO_SELECT_BUTTON     := true 
 BOARD_SUPPRESS_SECURE_ERASE    := true 
 TARGET_RECOVERY_PIXEL_FORMAT   := "RGBX_8888" 
 BOARD_USES_RECOVERY_AS_BOOT    := true 
 TARGET_NO_RECOVERY             := true
 TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab 

 # Debug
 TARGET_USES_LOGD := true
 TWRP_INCLUDE_LOGCAT := true
