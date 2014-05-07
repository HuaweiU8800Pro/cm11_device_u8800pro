#
# Copyright (C) 2012 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from u8800pro device
$(call inherit-product, device/huawei/u8800pro/device.mk)

# Include all languages
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Set those variables here to overwrite the inherited values.
PRODUCT_NAME := full_u8800pro
PRODUCT_DEVICE := u8800pro
PRODUCT_BRAND := Huawei
PRODUCT_MANUFACTURER := Huawei
PRODUCT_MODEL := U8800Pro