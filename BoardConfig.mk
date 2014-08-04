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

# Inherit from the proprietary version if exists
-include vendor/huawei/u8800pro/BoardConfigVendor.mk

USE_CAMERA_STUB := false
#BOARD_HAVE_PRE_KITKAT_AUDIO_BLOB := true

TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := scorpion
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi

TARGET_ARCH_LOWMEM := true

TARGET_BOARD_PLATFORM := msm7x30
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
TARGET_BOOTLOADER_BOARD_NAME := u8800pro

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

TARGET_USE_SCORPION_BIONIC_OPTIMIZATION := true
TARGET_USE_SCORPION_PLD_SET := true
TARGET_SCORPION_BIONIC_PLDOFFS := 6
TARGET_SCORPION_BIONIC_PLDSIZE := 128

# this line is needed in order to pass huawei logo
BOARD_WANTS_EMMC_BOOT := true

# without this line display is synced with unbearably low framerate 
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true

# needed for camera 
COMMON_GLOBAL_CFLAGS += -DQCOM_NO_SECURE_PLAYBACK
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS

# Camera
BOARD_NEEDS_MEMORYHEAPPMEM := true
COMMON_GLOBAL_CFLAGS += -DICS_CAMERA_BLOB
BOARD_USES_QCOM_LEGACY_CAM_PARAMS := true
CAMERA_USES_SURFACEFLINGER_CLIENT_STUB := true
BOARD_USES_LEGACY_CAMERA := true
TARGET_DISABLE_ARM_PIE := true
BOARD_USES_PMEM_ADSP := true
BOARD_USES_CAMERA_FAST_AUTOFOCUS := true

#screenshot & app preview fix
BOARD_USE_MHEAP_SCREENSHOT := true
TARGET_DISPLAY_INSECURE_MM_HEAP := true

TARGET_OTA_ASSERT_DEVICE := u8800pro,U8800PRO

# Qualcomm Hardware
BOARD_USES_QCOM_HARDWARE := true
#TARGET_USES_QCOM_BSP := true
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true
TARGET_QCOM_DISPLAY_VARIANT := legacy
TARGET_QCOM_MEDIA_VARIANT := legacy

# Graphics
USE_OPENGL_RENDERER := true
TARGET_USES_ION := false
TARGET_USES_C2D_COMPOSITION := true
COMMON_GLOBAL_CFLAGS += -DREFRESH_RATE=60 -DQCOM_HARDWARE
TARGET_DISPLAY_USE_RETIRE_FENCE := true
TARGET_DISPLAY_INSECURE_MM_HEAP := true
BOARD_USES_PMEM_ADSP := true
BOARD_EGL_CFG := device/huawei/u8800pro/egl.cfg
TARGET_NO_HW_VSYNC := true
BOARD_EGL_WORKAROUND_BUG_10194508 := true

# Audio
TARGET_QCOM_AUDIO_VARIANT := caf
BOARD_USES_LEGACY_ALSA_AUDIO := true
BOARD_QCOM_TUNNEL_LPA_ENABLED := false
BOARD_QCOM_VOIP_ENABLED := true

# Web Rendering
ENABLE_WEBGL := true

#uncomment the following line only when rebuilding without cleaning first
#PRODUCT_PREBUILT_WEBVIEWCHROMIUM := yes

# HACK: Use old Webkit for pmem compatibility
TARGET_FORCE_CPU_UPLOAD := true

# RIL
BOARD_RIL_CLASS := ../../../device/huawei/u8800pro/RIL/

# Wifi
WIFI_BAND                        := 802_11_ABGN
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := WEXT
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER             := WEXT
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
PRODUCT_WIRELESS_TOOLS           := true
BOARD_WLAN_DEVICE                := bcmdhd
BOARD_HOSTPAD_DEVICE             := bcmdhd
WIFI_DRIVER_MODULE_NAME          := "bcm4329"
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/bcm4329.ko"
WIFI_DRIVER_FW_PATH_STA          := "/system/vendor/firmware/fw_bcm4329.bin"
WIFI_DRIVER_FW_PATH_AP           := "/system/vendor/firmware/fw_bcm4329_apsta.bin"
WIFI_DRIVER_MODULE_ARG           := "firmware_path=/system/vendor/firmware/fw_bcm4329.bin nvram_path=/system/vendor/firmware/nvram.txt"
# flag for huawei
BOARD_USE_HUAWEI_BCM_WIFI := true
# Fix fur null WiFi MAC
BOARD_USE_SERNUM_FOR_MAC := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/huawei/u8800pro/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := device/huawei/u8800pro/bluetooth/vnd_msm7x30.txt

# GPS
BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := msm7x30
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000
BOARD_GPS_LIBRARIES := libloc_api

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Kernel
# AND is arm-linux-androideabi (used to compile the ROM)
TARGET_GCC_VERSION_AND := 4.9.1
# ARM is arm-eabi (used to compile the kernel)
#TARGET_KERNEL_CUSTOM_TOOLCHAIN := arm-cortex_a8-linux-gnueabi-linaro_4.9.1-2014.06
#TARGET_KERNEL_CUSTOM_TOOLCHAIN_SUFFIX := arm-eabi-
#TARGET_GCC_VERSION_ARM := 4.9.1
TARGET_KERNEL_CUSTOM_TOOLCHAIN := arm-eabi-4.4.3
TARGET_KERNEL_SOURCE := kernel/huawei/u8800pro
TARGET_KERNEL_CONFIG := u8800pro_defconfig
BOARD_KERNEL_CMDLINE := console=ttyDCC0 androidboot.hardware=huawei androidboot.selinux=permissive
BOARD_INSTALLER_CMDLINE := $(BOARD_KERNEL_CMDLINE)
BOARD_KERNEL_BASE := 0x00200000
BOARD_KERNEL_PAGESIZE := 4096

# File System
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_USE_USB_MASS_STORAGE_SWITCH := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/class/android_usb/android0/f_mass_storage/lun%d/file"
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
TARGET_USE_CUSTOM_SECOND_LUN_NUM := 1
BOARD_VOLD_MAX_PARTITIONS := 14

BOARD_BOOTIMAGE_PARTITION_SIZE     := 0x00A00000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00A00000
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 536870912
BOARD_USERDATAIMAGE_PARTITION_SIZE := 373293056
BOARD_CACHEIMAGE_PARTITION_SIZE    := 402653184
BOARD_FLASH_BLOCK_SIZE             := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true
RECOVERY_CHARGEMODE := true
BOARD_UMS_LUNFILE := "/sys/class/android_usb/android0/f_mass_storage/lun0/file"
TARGET_RECOVERY_INITRC := device/huawei/u8800pro/recovery/recovery.rc
BOARD_RECOVERY_RMT_STORAGE := true
TARGET_RECOVERY_FSTAB            := device/huawei/u8800pro/root/fstab.huawei
RECOVERY_FSTAB_VERSION           := 2

# Custom releasetools for old partition table.
TARGET_PROVIDES_RELEASETOOLS := true

# ETC
TARGET_SPECIFIC_HEADER_PATH := device/huawei/u8800pro/include

TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp

TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := ./device/huawei/u8800pro/releasetools/ota_from_target_files

BOARD_HARDWARE_CLASS := device/huawei/u8800pro/cmhw/

# SELinux
BOARD_SEPOLICY_DIRS := \
device/huawei/u8800pro/sepolicy

BOARD_SEPOLICY_UNION := \
        file_contexts \
        genfs_contexts \
        app.te \
        btmacreader.te \
        device.te \
        drmserver.te \
        init_shell.te \
        file.te \
        rild.te \
        sensors_config.te \
        shell.te \
        surfaceflinger.te \
        system.te \
        zygote.te

