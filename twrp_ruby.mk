#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common TWRP stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from ruby device
$(call inherit-product, device/xiaomi/ruby/device.mk)

## Device identifier 
 PRODUCT_DEVICE := ruby
 PRODUCT_NAME := twrp_ruby
 PRODUCT_BRAND := Xiaomi
 PRODUCT_MODEL := Redmi Note 12 PRO 5G
 PRODUCT_MANUFACTURER := Xiaomi 
  
 PRODUCT_GMS_CLIENTID_BASE := android-xiaomi
