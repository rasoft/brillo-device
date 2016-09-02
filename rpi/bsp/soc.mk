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

LOCAL_PATH := device/3rd/rpi/bsp

# Arm32 device.
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a
TARGET_CPU_VARIANT := generic
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_KERNEL_ARCH := $(TARGET_ARCH)

# Disable building kernel and bootloader until we really support them.
TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := false

# FIXME: Need to dynamically grab the serial number of the device from the hardware.
BOARD_KERNEL_CMDLINE := dwc_otg.lpm_enable=0 console=ttyAMA0,115200 console=tty1 root=/dev/mmcblk0p2 rootfstype=ext4 elevator=deadline rootwait androidboot.hardware=rpi androidboot.selinux=permissive
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true

BOARD_FLASH_BLOCK_SIZE := 512
BOARD_NAND_PAGE_SIZE := 512
BOARD_NAND_SPARE_SIZE := 64

PRODUCT_COPY_FILES += \
  $(LOCAL_PATH)/init.rpi.rc:root/init.rpi.rc \
  $(LOCAL_PATH)/initnetwork.sh:system/bin/initnetwork.sh \
  system/core/rootdir/init.usb.rc:root/init.usb.rc \
  system/core/rootdir/ueventd.rc:root/ueventd.rc \
  $(LOCAL_PATH)/ueventd.rpi.rc:root/ueventd.rpi.rc \

BOARD_SEPOLICY_DIRS += \
	$(LOCAL_PATH)/sepolicy \

TARGET_KERNEL_SRC := hardware/bsp/kernel/hzak/rpi-4.1.y
TARGET_KERNEL_DEFCONFIG := bcm2709_defconfig
TARGET_KERNEL_CONFIGS := $(realpath $(LOCAL_PATH)/soc.kconf)
TARGET_KERNEL_DTB := bcm2709-rpi-2-b.dtb

DEVICE_PACKAGES += \
    keystore.default

# Audio utilities. You may not need these for a product.
DEVICE_PACKAGES += \
    tinyplay tinypcminfo tinymix tinycap

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/boot/LICENCE.broadcom:boot/LICENCE.broadcom \
	$(LOCAL_PATH)/boot/COPYING.linux:boot/COPYING.linux \
	$(LOCAL_PATH)/boot/bootcode.bin:boot/bootcode.bin \
	$(LOCAL_PATH)/boot/config.txt:boot/config.txt \
	$(LOCAL_PATH)/boot/start.elf:boot/start.elf \
	$(LOCAL_PATH)/boot/fixup.dat:boot/fixup.dat \
	$(LOCAL_PATH)/boot/cmdline.txt:boot/cmdline.txt

#$(PRODUCT_OUT)/boot/recovery.img: $(PRODUCT_OUT)/kernel
#	$(hide)$(ACP) $< $@

#$(PRODUCT_OUT)/boot/recovery.rfs: $(PRODUCT_OUT)/system.img
#	$(hide)$(ACP) $< $@

#droid: $(PRODUCT_OUT)/boot/recovery.img $(PRODUCT_OUT)/boot/recovery.rfs

