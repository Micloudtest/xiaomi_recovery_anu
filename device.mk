# 
 # Copyright (C) 2022 The Android Open Source Project 
 # Copyright (C) 2022 SebaUbuntu's TWRP device tree generator 
 # 
 # SPDX-License-Identifier: Apache-2.0 
 # 
 

ENABLE_VIRTUAL_AB := true
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    boot \
    product \
    system \
    vendor \
    vbmeta_system \
    vbmeta_vendor
    
 
 # A/B 
 AB_OTA_POSTINSTALL_CONFIG += \ 
     RUN_POSTINSTALL_system=true \ 
     POSTINSTALL_PATH_system=system/bin/otapreopt_script \ 
     FILESYSTEM_TYPE_system=ext4 \ 
     POSTINSTALL_OPTIONAL_system=true 
  
 # Boot control HAL 
 PRODUCT_PACKAGES += \ 
    android.hidl.base@1.0 \
    android.hardware.boot@1.1-impl \ 
    android.hardware.boot@1.1-impl.recovery \ 
    android.hardware.boot@1.2-mtkimpl.recovery

# Fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd
  
# Keymaster 
 TARGET_RECOVERY_DEVICE_MODULES += \ 
     libkeymaster4 \ 
     libkeymaster41 \ 
     libpuresoftkeymasterdevice 
  
 RECOVERY_LIBRARY_SOURCE_FILES += \ 
     $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster4.so \ 
     $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster41.so \ 
     $(TARGET_OUT_SHARED_LIBRARIES)/libpuresoftkeymasterdevice.so
   
 PRODUCT_PACKAGES += \ 
     otapreopt_script \ 
     cppreopts.sh \ 
     update_engine \ 
     update_verifier \ 
     update_engine_sideload

# API 
 PRODUCT_SHIPPING_API_LEVEL := 31 
  
 # VNDK 
 PRODUCT_TARGET_VNDK_VERSION := 32
