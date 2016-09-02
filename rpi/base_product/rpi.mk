#
# Copyright 2015 The Android Open Source Project
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

$(call inherit-product, device/3rd/rpi/brillo_base.mk)

PRODUCT_NAME := rpi
PRODUCT_BRAND := Brillo

PRODUCT_DEVICE := rpi

# Install rpi-specific config file for weaved.
PRODUCT_COPY_FILES += \
  device/3rd/rpi/base_product/weaved.conf:system/etc/weaved/weaved.conf

# Debug factility
PRODUCT_PACKAGES += \
	debuggerd
