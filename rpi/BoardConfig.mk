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

# Select the SoC
include device/3rd/rpi/bsp/soc.mk

BOARD_SYSTEMIMAGE_PARTITION_SIZE := $(shell echo $$((112 * 1024 * 1024)))
BOARD_USERDATAIMAGE_PARTITION_SIZE := $(shell echo $$((64 * 1024 * 1024)))
BOARD_CACHEIMAGE_PARTITION_SIZE := $(shell echo $$((64 * 1024 * 1024)))

# No ramdisk.
#BOARD_BUILD_SYSTEM_ROOT_IMAGE := true

# No ramdisk.
BOARD_USES_FULL_RECOVERY_IMAGE := true

# This is an emulator build.
#TARGET_SKIP_OTA_PACKAGE := true

# Use clang.
#USE_CLANG_PLATFORM_BUILD := true


PRODUCT_COPY_FILES += \
    device/3rd/rpi/fstab.device:root/fstab.rpi

BOARD_SEPOLICY_DIRS += \
    device/3rd/rpi/sepolicy
