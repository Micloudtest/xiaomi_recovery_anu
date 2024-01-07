#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

# Inherit from fleur device
$(call inherit-product, device/xiaomi/ruby/device.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/pb/config/common.mk)

## Device identifier 
 PRODUCT_DEVICE := ruby 
 PRODUCT_NAME   := twr_ruby
 PRODUCT_BRAND := Xiaomi 
 PRODUCT_MODEL := Redmi Note 12 Pro 5G
 PRODUCT_MANUFACTURER := Xiaomi

