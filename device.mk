# 
 # Copyright (C) 2022 The Android Open Source Project 
 # Copyright (C) 2022 SebaUbuntu's TWRP device tree generator 
 # 
 # SPDX-License-Identifier: Apache-2.0 
 # 
  
 
 # A/B 
 AB_OTA_POSTINSTALL_CONFIG += \ 
     RUN_POSTINSTALL_system=true \ 
     POSTINSTALL_PATH_system=system/bin/otapreopt_script \ 
     FILESYSTEM_TYPE_system=ext4 \ 
     POSTINSTALL_OPTIONAL_system=true 
  
 # Boot control HAL 
 PRODUCT_PACKAGES += \ 
    android.hidl.base@1.0 \
    android.hardware.boot@1.2-impl \
    android.hardware.boot@1.2-impl.recovery \
    android.hardware.boot@1.2-service

# Additional binaries & libraries needed for recovery
TARGET_RECOVERY_DEVICE_MODULES += \
    libkeymaster4 \
    libkeymaster41 \
    libpuresoftkeymasterdevice
   
# Fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd
  
 PRODUCT_PACKAGES += \ 
     otapreopt_script \ 
     cppreopts.sh \ 
     update_engine \ 
     update_verifier \ 
     update_engine_sideload
