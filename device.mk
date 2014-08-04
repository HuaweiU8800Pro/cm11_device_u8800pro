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

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

# Include proprietary stuff
$(call inherit-product-if-exists, vendor/huawei/u8800pro/u8800pro-vendor.mk)

# Use standard dalvik heap sizes
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

DEVICE_PACKAGE_OVERLAYS += device/huawei/u8800pro/overlay

PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# init
PRODUCT_COPY_FILES += \
    device/huawei/u8800pro/root/init.huawei.rc:root/init.huawei.rc \
    device/huawei/u8800pro/root/init.huawei.usb.rc:root/init.huawei.usb.rc \
    device/huawei/u8800pro/root/ueventd.huawei.rc:root/ueventd.huawei.rc \
    device/huawei/u8800pro/root/init.qcom.sh:root/init.qcom.sh \
    device/huawei/u8800pro/root/fstab.huawei:root/fstab.huawei    
    
# ETC
PRODUCT_COPY_FILES += \
    device/huawei/u8800pro/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml \
    device/huawei/u8800pro/prebuilt/etc/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh \
    device/huawei/u8800pro/prebuilt/etc/init.qcom.sdio.sh:system/etc/init.qcom.sdio.sh \
    device/huawei/u8800pro/prebuilt/etc/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/huawei/u8800pro/prebuilt/etc/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
    device/huawei/u8800pro/prebuilt/etc/audio_policy.conf:system/etc/audio_policy.conf \
    device/huawei/u8800pro/prebuilt/etc/media_codecs.xml:system/etc/media_codecs.xml \
    device/huawei/u8800pro/prebuilt/20uncapfps:system/etc/init.d/20uncapfps
    
# Video and OMX
PRODUCT_PACKAGES += \
    libOmxCore \
    libOmxVdec \
    libOmxVenc \
    libmm-omxcore \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxQcelp13Enc \
    LibOmxEvrcEnc \
    libstagefrighthw \
    libcamera_client
    
# Graphics 
PRODUCT_PACKAGES += \
    gralloc.msm7x30 \
    copybit.msm7x30 \
    hwcomposer.msm7x30 \
    libgenlock \
    libmemalloc \
    liboverlay \
    libQcomUI \
    libtilerenderer \
    libI420colorconvert \
    libc2dcolorconvert
    
# Audio
PRODUCT_PACKAGES += \
    libaudio-resampler \
    libdashplayer \
    libaudioutils \
    memtrack.msm7x30
    
# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.primary.msm7x30 \
    audio_policy.msm7x30    
	
# Lights
PRODUCT_PACKAGES += \
    lights.msm7x30 \
    power.u8800pro

# GPS
PRODUCT_PACKAGES += \
    gps.msm7x30

# Other
PRODUCT_PACKAGES += \
    dexpreopt \
    libnetcmdiface

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs
    
# Misc
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory 

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Radio
PRODUCT_PROPERTY_OVERRIDES += \
    ril.subscription.types=NV,RUIM \
    ro.use_data_netmgrd=true \
    ro.config.ehrpd=true \
    ro.ril.shutdown=true \
    ro.multi.rild=false \
    ro.config.dualmic=true \
    ro.telephony.call_ring.delay=0

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
    debug.camera.landscape=true \
    debug.camcorder.disablemeta=0
    
# Camera			
PRODUCT_PACKAGES += \
    Camera \
    camera.msm7x30 \
    libcamera
    
# Hardware MAC address tool
PRODUCT_PACKAGES += \
	hwmac
	
# Torch
PRODUCT_PACKAGES += \
	Torch
	
# Build FFMPEG Packages
PRODUCT_PACKAGES += \
    libavcodec \
    libavformat \
    libswscale \
    libswresample \
    libavutil
    
# Stagefright FFMPEG plugin
PRODUCT_PACKAGES += \
    libstagefright_soft_ffmpegadec \
    libstagefright_soft_ffmpegvdec \
    libFFmpegExtractor \
    libnamparser
    
# Wireless AP
PRODUCT_PACKAGES += \
    hostapd_cli \
    hostapd
    
# iptables
PRODUCT_PACKAGES += \
	iptables \
	ip6tables

# USB
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp,adb \
    ro.additionalmounts=/storage/sdcard1 \
    ro.vold.switchablepair=/storage/sdcard0,/storage/sdcard1 \
    ro.emmc.sdcard.partition=14 \
    ro.vold.umsdirtyratio=50 \
    ro.emmc=1 \
    ro.zygote.disable_gl_preload=true

# dalvik vm
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapstartsize=5m \
    dalvik.vm.heapgrowthlimit=64m \
    dalvik.vm.heapsize=128m \
    dalvik.vm.dexopt-data-only=1

# system prop for opengles version
PRODUCT_PROPERTY_OVERRIDES += \
    debug.composition.type=gpu \
    debug.hwc.fakevsync=1 \
    ro.opengles.version=131072 \
    debug.egl.recordable.rgba8888=1 \
    ro.bq.gpu_to_cpu_unsupported=1 \
    debug.sf.hw=1 \
    debug.egl.hw=1 \
    com.qc.hardware=true \
    DEVICE_PROVISIONED=1 \
    persist.webview.provider=classic \
    ro.sf.lcd_density=240 \
    ro.config.low_ram=true \
    dalvik.vm.jit.codecachesize=0 \
    ro.ksm.default=1

# Wi-Fi
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=eth0 \
    wifi.supplicant_scan_interval=15
    
# Enable transparent status bar in low_ram
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.force_highendgfx=true
    
# Disable SELinux
PRODUCT_PROPERTY_OVERRIDES += \
    ro.boot.selinux=permissive
    
# Camera
PRODUCT_PROPERTY_OVERRIDES += \
    debug.camera.landscape=true
    
# Enable Adaptive Multi-Rate Wideband
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.enable.amr.wideband=1
    
# BLUETOOTH
PRODUCT_COPY_FILES += \
    device/huawei/u8800pro/prebuilt/etc/dhcpcd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    device/huawei/u8800pro/prebuilt/etc/init.bcm.bt.sh:system/etc/bluetooth/init.bcm.bt.sh \
    device/huawei/u8800pro/prebuilt/etc/bluetooth/BCM4329.hcd:system/etc/firmware/BCM4329.hcd
    
# WIFI
PRODUCT_COPY_FILES += \
    device/huawei/u8800pro/prebuilt/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/huawei/u8800pro/prebuilt/wifi/nvram.txt:system/vendor/firmware/nvram.txt

PRODUCT_COPY_FILES += \
    device/huawei/u8800pro/prebuilt/vendor/firmware/fw_bcm4329.bin:system/vendor/firmware/fw_bcm4329.bin \
    device/huawei/u8800pro/prebuilt/vendor/firmware/fw_bcm4329_abg.bin:system/vendor/firmware/fw_bcm4329_abg.bin \
    device/huawei/u8800pro/prebuilt/vendor/firmware/fw_bcm4329_apsta.bin:system/vendor/firmware/fw_bcm4329_apsta.bin

# KEY
PRODUCT_COPY_FILES += \
    device/huawei/u8800pro/prebuilt/usr/keychars/surf_keypad.kcm:system/usr/keychars/surf_keypad.kcm \
    device/huawei/u8800pro/prebuilt/usr/keylayout/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
    device/huawei/u8800pro/prebuilt/usr/keylayout/fluid-keypad.kl:system/usr/keylayout/fluid-keypad.kl \
    device/huawei/u8800pro/prebuilt/usr/keylayout/msm_tma300_ts.kl:system/usr/keylayout/msm_tma300_ts.kl \
    device/huawei/u8800pro/prebuilt/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/huawei/u8800pro/prebuilt/usr/keylayout/surf_keypad.kl:system/usr/keylayout/surf_keypad.kl \
    device/huawei/u8800pro/prebuilt/usr/idc/atmel-rmi-touchscreen.idc:system/usr/idc/atmel-rmi-touchscreen.idc \
    device/huawei/u8800pro/prebuilt/usr/idc/synaptics.idc:system/usr/idc/synaptics.idc

# Video and Omx
#PRODUCT_COPY_FILES += \
#    device/huawei/u8800pro/prebuilt/lib/libdivxdrmdecrypt.so:system/lib/libdivxdrmdecrypt.so \
#    device/huawei/u8800pro/prebuilt/lib/libQmageDecoder.so:system/lib/libQmageDecoder.so
    
