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
     BOARD_CHARGER_DISABLE_INIT_BLANK := true
     
  