 # 
 # Copyright (C) 2023 The Android Open Source Project 
 # 
 # SPDX-License-Identifier: Apache-2.0 
 # 

 # Building with minimal manifest 
 ALLOW_MISSING_DEPENDENCIES := true 
  
 # Boot control, Firmware 
 PRODUCT_PACKAGES += \ 
     android.hardware.boot@1.2-impl.recovery \ 
     miui_prebuilt 
  
 # FastbootD support 
 PRODUCT_PACKAGES += \ 
     android.hardware.fastboot@1.1-impl-mock \ 
     fastbootd 
  
 # Update engine 
 PRODUCT_PACKAGES += \ 
     update_engine \ 
     update_engine_sideload \ 
     update_verifier 
  
 PRODUCT_PACKAGES_DEBUG += \ 
     update_engine_client 
  
 PRODUCT_PACKAGES += \ 
     otapreopt_script \ 
     checkpoint_gc 
  
 # Display Size & Density 
 TARGET_SCREEN_HEIGHT  := 2400 
 TARGET_SCREEN_DENSITY := 390 
 TARGET_SCREEN_WIDTH   := 1080 
  
 # Virutal A/B 
 ENABLE_VIRTUAL_AB := true 
 AB_OTA_POSTINSTALL_CONFIG += \ 
     RUN_POSTINSTALL_system=true \ 
     POSTINSTALL_PATH_system=system/bin/otapreopt_script \ 
     FILESYSTEM_TYPE_system=erofs \ 
     POSTINSTALL_OPTIONAL_system=true 
  
 AB_OTA_POSTINSTALL_CONFIG += \ 
     RUN_POSTINSTALL_vendor=true \ 
     POSTINSTALL_PATH_vendor=bin/checkpoint_gc \ 
     FILESYSTEM_TYPE_vendor=erofs \ 
     POSTINSTALL_OPTIONAL_vendor=true 
  
 # TWRP - Specifics 
 TW_THEME                := portrait_hdpi 
 TW_DEFAULT_LANGUAGE     := en 
 TW_USE_TOOLBOX          := true 
 TW_INCLUDE_NTFS_3G      := true 
 TW_INCLUDE_FUSE_EXFAT   := true 
 TW_INCLUDE_FUSE_NTFS    := true 
 TW_INCLUDE_REPACKTOOLS  := true 
 TW_INCLUDE_RESETPROP    := true 
 TW_INCLUDE_LIBRESETPROP := true 
 TW_MAX_BRIGHTNESS       := 2047 
 TW_EXTRA_LANGUAGES      := true 
 TW_DEFAULT_BRIGHTNESS   := 200 
 TW_EXCLUDE_APEX         := true 
 TW_HAS_EDL_MODE         := true 
 TW_INCLUDE_FASTBOOTD    := true 
 TWRP_INCLUDE_LOGCAT     := true 
  
 # Set panel refresh rate to 90 Hertz for smoother experience 
 # Possible supported frequencies: 30, 60, 90, 120 
 TW_FRAMERATE := 90 
  
 TW_CUSTOM_CPU_TEMP_PATH := "/sys/class/thermal/thermal_zone7/temp" 
 TW_BRIGHTNESS_PATH      := "/sys/class/backlight/panel0-backlight/brightness" 

 TW_BATTERY_SYSFS_WAIT_SECONDS := 6 
 TW_EXCLUDE_DEFAULT_USB_INIT   := true 
 TW_USE_SERIALNO_PROPERTY_FOR_DEVICE_ID := true 
  
 # TWRP - Crypto 
 TW_INCLUDE_CRYPTO               := true 
 TW_INCLUDE_CRYPTO_FBE           := true 
 TW_INCLUDE_FBE_METADATA_DECRYPT := true 
 PLATFORM_VERSION                := 99.87.36 
 PLATFORM_VERSION_LAST_STABLE    := $(PLATFORM_VERSION) 
  
 PLATFORM_SECURITY_PATCH := 2127-12-31 
 VENDOR_SECURITY_PATCH   := $(PLATFORM_SECURITY_PATCH) 
 BOOT_SECURITY_PATCH     := $(PLATFORM_SECURITY_PATCH)
