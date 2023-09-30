# 
 # Copyright (C) 2023 The Android Open Source Project 
 # 
 # SPDX-License-Identifier: Apache-2.0 
 # 


LOCAL_PATH := device/xiaomi/ruby

 # Dynamic
    PRODUCT_USE_DYNAMIC_PARTITIONS := true

 # A/B
    ENABLE_VIRTUAL_AB := true

 # A/B
    AB_OTA_UPDATER := true
  
 # Boot control HAL 
 PRODUCT_PACKAGES += \ 
     android.hardware.boot@1.2-impl.recovery \ 
     android.hardware.boot@1.2-service 
  
 PRODUCT_PACKAGES += \ 
     update_engine \ 
     update_engine_sideload \ 
     update_verifier 

  
 PRODUCT_PACKAGES_DEBUG += \ 
     update_engine_client 
  
 AB_OTA_POSTINSTALL_CONFIG += \ 
     RUN_POSTINSTALL_system=true \ 
     POSTINSTALL_PATH_system=system/bin/otapreopt_script \ 
     FILESYSTEM_TYPE_system=erofs \ 
     POSTINSTALL_OPTIONAL_system=true 
  
 PRODUCT_PACKAGES += \ 
     otapreopt_script 
  
 PRODUCT_PACKAGES += \ 
     android.hardware.fastboot@1.0-impl-mock \  
  
 # Keymaster 
 TARGET_RECOVERY_DEVICE_MODULES += \ 
     libkeymaster4 \ 
     libkeymaster41 \ 
     libpuresoftkeymasterdevice 
  
 RECOVERY_LIBRARY_SOURCE_FILES += \ 
     $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster4.so \ 
     $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster41.so \ 
     $(TARGET_OUT_SHARED_LIBRARIES)/libpuresoftkeymasterdevice.so

# TWRP specific build flags
     TW_THEME := portrait_hdpi
     BOARD_CHARGER_DISABLE_INIT_BLANK := true
     TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
     TARGET_USE_CUSTOM_LUN_FILE_PATH := /config/usb_gadget/g1/functions/mass_storage.usb0/lun.%d/file
     TW_INCLUDE_RESETPROP := true
     TW_INCLUDE_REPACKTOOLS := true
     TW_EXCLUDE_DEFAULT_USB_INIT := true
     TW_EXTRA_LANGUAGES := true
     TW_INCLUDE_NTFS_3G := true
     TW_MAX_BRIGHTNESS := 2047
     TW_DEFAULT_BRIGHTNESS := 1200
     TARGET_USES_MKE2FS := true
     TW_DEVICE_VERSION := Redmi Note 12 Pro (Ruby)
     TW_NO_SCREEN_BLANK := true

     TWRP_INCLUDE_LOGCAT := true
     TARGET_USES_LOGD := true