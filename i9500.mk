#
# Copyright (C) 2015 The CyanogenMod Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

LOCAL_PATH := device/samsung/i9500

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Boot Animation
TARGET_SCREEN_HEIGHT := 960
TARGET_SCREEN_WIDTH := 540

# Ramdisk
PRODUCT_PACKAGES += \
	fstab.universal5410 \
	init.universal5410.rc \
	init.universal5410.usb.rc \
	init.universal5410.wifi.rc \
	ueventd.universal5410.rc

# Recovery Ramdisk
PRODUCT_PACKAGES += \
	init.recovery.universal5410.rc

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/recovery/etc/twrp.fstab:recovery/root/etc/twrp.fstab

# AAPT Config
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# ADB Debugging
ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.adb.secure=0 \
	ro.debuggable=1 \
	ro.secure=0

# ANT+
PRODUCT_PACKAGES += \
	AntHalService \
	com.dsi.ant.antradio_library \
	libantradio

# Audio
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/audio/audio_effects.conf:system/vendor/etc/audio_effects.conf \
	$(LOCAL_PATH)/configs/audio/audio_policy.conf:system/etc/audio_policy.conf \
	$(LOCAL_PATH)/configs/audio/mixer_paths.xml:system/etc/mixer_paths.xml

PRODUCT_PACKAGES += \
	AudioWorkaround \
	audio.a2dp.default \
	audio.primary.universal5410 \
	audio.r_submix.default \
	audio.usb.default \
	tinymix

PRODUCT_PROPERTY_OVERRIDES += \
	af.fast_track_multiplier=1 \
	audio.offload.disable=1

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
	bluetooth.hfp.client=1

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/bluetooth/bcm4335_prepatch.hcd:system/vendor/firmware/bcm4335_prepatch.hcd

# Camera
PRODUCT_PACKAGES += \
	camera.universal5410 \
	libhwjpeg

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	camera2.portability.force_api=1

# Charger
PRODUCT_PACKAGES += \
	charger_res_images

# Doze
PRODUCT_PACKAGES += \
	SamsungDoze

# FileSystem
PRODUCT_PACKAGES += \
	make_ext4fs \
	setup_fs

# GearCM Extras
PRODUCT_PACKAGES += \
	OTAUpdates \
	Screencast \
	Synapse \
	gearinit.sh

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/env/gearcm:system/etc/gearcm \
	$(LOCAL_PATH)/rootdir/etc/busybox:root/sbin/busybox \
	$(LOCAL_PATH)/synapse/config.json.generate:root/res/synapse/config.json.generate \
	$(LOCAL_PATH)/synapse/config.json.generate.audio:root/res/synapse/config.json.generate.audio \
	$(LOCAL_PATH)/synapse/config.json.generate.charger:root/res/synapse/config.json.generate.charger \
	$(LOCAL_PATH)/synapse/config.json.generate.cpu:root/res/synapse/config.json.generate.cpu \
	$(LOCAL_PATH)/synapse/config.json.generate.governor:root/res/synapse/config.json.generate.governor \
	$(LOCAL_PATH)/synapse/config.json.generate.io:root/res/synapse/config.json.generate.io \
	$(LOCAL_PATH)/synapse/config.json.generate.led:root/res/synapse/config.json.generate.led \
	$(LOCAL_PATH)/synapse/config.json.generate.mem:root/res/synapse/config.json.generate.mem \
	$(LOCAL_PATH)/synapse/config.json.generate.misc:root/res/synapse/config.json.generate.misc \
	$(LOCAL_PATH)/synapse/config.json.generate.screen:root/res/synapse/config.json.generate.screen \
	$(LOCAL_PATH)/synapse/config.json.generate.tools:root/res/synapse/config.json.generate.tools \
	$(LOCAL_PATH)/synapse/config.json.generate.tweaks:root/res/synapse/config.json.generate.tweaks \
	$(LOCAL_PATH)/synapse/sqlite3:root/res/synapse/sqlite3 \
	$(LOCAL_PATH)/synapse/uci:root/res/synapse/uci \
	$(LOCAL_PATH)/synapse/actions/boolean:root/res/synapse/actions/boolean \
	$(LOCAL_PATH)/synapse/actions/bracket-option:root/res/synapse/actions/bracket-option \
	$(LOCAL_PATH)/synapse/actions/buildprop:root/res/synapse/actions/buildprop \
	$(LOCAL_PATH)/synapse/actions/charge-source:root/res/synapse/actions/charge-source \
	$(LOCAL_PATH)/synapse/actions/colour:root/res/synapse/actions/colour \
	$(LOCAL_PATH)/synapse/actions/devtools:root/res/synapse/actions/devtools \
	$(LOCAL_PATH)/synapse/actions/dropcaches:root/res/synapse/actions/dropcaches \
	$(LOCAL_PATH)/synapse/actions/dropcaches_prof:root/res/synapse/actions/dropcaches_prof \
	$(LOCAL_PATH)/synapse/actions/generic:root/res/synapse/actions/generic \
	$(LOCAL_PATH)/synapse/actions/governor:root/res/synapse/actions/governor \
	$(LOCAL_PATH)/synapse/actions/gpuvolt:root/res/synapse/actions/gpuvolt \
	$(LOCAL_PATH)/synapse/actions/ioset:root/res/synapse/actions/ioset \
	$(LOCAL_PATH)/synapse/actions/led:root/res/synapse/actions/led \
	$(LOCAL_PATH)/synapse/actions/printk:root/res/synapse/actions/printk \
	$(LOCAL_PATH)/synapse/actions/sqlite:root/res/synapse/actions/sqlite \
	$(LOCAL_PATH)/synapse/actions/voltage:root/res/synapse/actions/voltage

# GPS
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/gps/gps.cer:system/etc/gps.cer \
	$(LOCAL_PATH)/configs/gps/gps.conf:system/etc/gps.conf \
	$(LOCAL_PATH)/configs/gps/gps.xml:system/etc/gps.xml

# GPU
PRODUCT_PACKAGES += \
	pvrsrvctl \
	libcorkscrew

PRODUCT_PROPERTY_OVERRIDES += \
	ro.opengles.version=131072

# Hardware Manager
PRODUCT_PACKAGES += \
	AdvancedDisplay

# Hardware Permissions
PRODUCT_COPY_FILES += \
	external/ant-wireless/antradio-library/com.dsi.ant.antradio_library.xml:system/etc/permissions/com.dsi.ant.antradio_library.xml \
	frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.consumerir.xml:system/etc/permissions/android.hardware.consumerir.xml \
	frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
	frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
	frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
	frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# HW Composer
PRODUCT_PACKAGES += \
	hwcomposer.exynos5 \
	libion

# IR
PRODUCT_PACKAGES += \
	consumerir.universal5410

# Keylayouts
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/idc/sec_touchscreen.idc:system/usr/idc/sec_touchscreen.idc \
	$(LOCAL_PATH)/configs/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
	$(LOCAL_PATH)/configs/keylayout/sec_touchkey.kl:system/usr/keylayout/sec_touchkey.kl

# Keystore
PRODUCT_PACKAGES += \
	keystore.exynos5

# Lights
PRODUCT_PACKAGES += \
	lights.universal5410

# Media
PRODUCT_COPY_FILES += \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
	$(LOCAL_PATH)/configs/media/media_codecs.xml:system/etc/media_codecs.xml \
	$(LOCAL_PATH)/configs/media/media_profiles.xml:system/etc/media_profiles.xml

# Memory Tracker HAL
PRODUCT_PACKAGES += \
	memtrack.exynos5

# MobiCore
PRODUCT_PACKAGES += \
	mcDriverDaemon

# NFC
PRODUCT_PACKAGES += \
	com.android.nfc_extras \
	libnfc-nci \
	libnfc_nci_jni \
	nfc_nci.bcm2079x.universal5410 \
	NfcNci \
	Tag

# NFCEE access control + configuration
NFCEE_ACCESS_PATH := $(LOCAL_PATH)/configs/nfc/nfcee_access.xml

PRODUCT_COPY_FILES += \
	$(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml \
	$(LOCAL_PATH)/configs/nfc/libnfc-brcm.conf:system/etc/libnfc-brcm.conf

# OMX
PRODUCT_PACKAGES += \
	libExynosOMX_Core \
	libOMX.Exynos.AVC.Decoder \
	libOMX.Exynos.AVC.Encoder \
	libOMX.Exynos.MP3.Decoder \
	libOMX.Exynos.MPEG2.Decoder \
	libOMX.Exynos.MPEG4.Decoder \
	libOMX.Exynos.MPEG4.Encoder \
	libOMX.Exynos.VP8.Decoder \
	libOMX.Exynos.WMV.Decoder \
	libstagefrighthw

# Power
PRODUCT_PACKAGES += \
	power.universal5410

# Radio
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/ril/sbin/cbd:system/bin/cbd

PRODUCT_PACKAGES += \
	libsecril-client \
	libsecril-client-sap \
	SamsungServiceMode

PRODUCT_PROPERTY_OVERRIDES += \
	ro.telephony.call_ring.multiple=false \
	ro.telephony.call_ring.delay=3000 \
	ro.telephony.ril_class=ExynosXMM6360RIL \
	mobiledata.interfaces=pdp0,gprs,ppp0,rmnet0,rmnet1

# SELinux
ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.build.selinux=0

PRODUCT_PROPERTY_OVERRIDES += \
	ro.build.selinux=0

# SuperSU
PRODUCT_PACKAGES += \
	.installed_su_daemon \
	99SuperSUDaemon \
	daemonsu \
	install-recovery \
	libsupol.so \
	su \
	sugote \
	SuperSU \
	supolicy

PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.root_access=0

# Tethering Config
PRODUCT_PROPERTY_OVERRIDES += \
	net.tethering.noprovisioning=true

# USB
PRODUCT_PACKAGES += \
	com.android.future.usb.accessory

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mtp

PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.isUsbOtgEnabled=true

# VM Config
PRODUCT_PROPERTY_OVERRIDES += \
	dalvik.vm.checkjni=false \
	dalvik.vm.dex2oat-filter=everything \
	dalvik.vm.dex2oat-flags=--no-watch-dog \
	dalvik.vm.image-dex2oat-filter=everything \
	dalvik.vm.isa.arm.features=lpae,div \
	ro.kernel.android.checkjni=0

# Wi-Fi
PRODUCT_PACKAGES += \
	dhcpcd.conf \
	hostapd \
	libnetcmdiface \
	libwpa_client \
	wpa_supplicant \
	wpa_supplicant.conf

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
	$(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf

PRODUCT_PROPERTY_OVERRIDES += \
	wifi.interface=wlan0

# call dalvik heap config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)

# call hwui memory config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

# call the proprietary setup
$(call inherit-product-if-exists, vendor/samsung/i9500/i9500-vendor.mk)