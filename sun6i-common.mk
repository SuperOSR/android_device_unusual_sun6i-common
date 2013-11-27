$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

include device/unusual/sun6i-common/prebuild/tools/tools.mk

# ext4 filesystem utils
PRODUCT_PACKAGES += \
	e2fsck \
	libext2fs \
	libext2_blkid \
	libext2_uuid \
	libext2_profile \
	libext2_com_err \
	libext2_e2p \
	make_ext4fs 

PRODUCT_PACKAGES += \
	audio.primary.fiber \
	audio.a2dp.default \
	audio.usb.default \
	audio.r_submix.default

PRODUCT_PACKAGES += \
	libcedarxbase \
	libcedarxosal \
	libcedarv \
	libcedarv_base \
	libcedarv_adapter \
	libve \
	libaw_audio \
	libaw_audioa \
	libswdrm \
	libstagefright_soft_cedar_h264dec \
	libfacedetection \
	libthirdpartstream \
	libcedarxsftstream \
	libsunxi_alloc \
	libsrec_jni \
	libjpgenc \
	libstagefrighthw \
	libOmxCore \
	libOmxVdec \
	libOmxVenc \
	libaw_h264enc \
	libI420colorconvert

PRODUCT_COPY_FILES += \
	device/unusual/sun6i-common/media_codecs.xml:system/etc/media_codecs.xml \
	device/unusual/sun6i-common/hardware/audio/audio_policy.conf:system/etc/audio_policy.conf \
	device/unusual/sun6i-common/hardware/audio/phone_volume.conf:system/etc/phone_volume.conf

# cedar crack lib so
PRODUCT_COPY_FILES += \
	device/unusual/sun6i-common/CedarX-Crack/libdemux_rmvb.so:system/lib/libdemux_rmvb.so \
	device/unusual/sun6i-common/CedarX-Crack/librm.so:system/lib/librm.so \
	device/unusual/sun6i-common/CedarX-Crack/libswa1.so:system/lib/libswa1.so \
	device/unusual/sun6i-common/CedarX-Crack/libswa2.so:system/lib/libswa2.so
	
# wfd no invite
PRODUCT_COPY_FILES += \
    device/unusual/sun6i-common/wfd_blacklist.conf:system/etc/wfd_blacklist.conf

#exdroid HAL
PRODUCT_PACKAGES += \
   lights.fiber \
   camera.fiber \
   sensors.fiber \
   gps.fiber

#install apk to system/app 
PRODUCT_PACKAGES +=  \
   4KPlayer \
   libjni_mosaic \
   libjni_eglfence
   
#install apk's lib to system/lib
PRODUCT_PACKAGES +=  \
   libebookdec.so \
   libScanFileLib.so \
   libjni_googlepinyinime_latinime_5.so \
   libjni_googlepinyinime_5.so \
   libcyberplayer.so \
   libffmpeg.so \
   libgetcpuspec.so \
   libp2p-jni.so \
   libstlport_shared.so
	
# init.rc
PRODUCT_COPY_FILES += \
	device/unusual/sun6i-common/init.rc:root/init.rc \
	device/unusual/sun6i-common/init.sun6i.usb.rc:root/init.sun6i.usb.rc

# table core hardware
PRODUCT_COPY_FILES += \
    device/unusual/sun6i-common/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml
    
# softwinner	
PRODUCT_PACKAGES +=  \
   android.softwinner.framework.jar \
   SoftWinnerService.apk \
   backup/SoftWinnerService.apk \
   libsoftwinner_servers.so \
   libupdatesoftwinner.so \
   updatesoftwinner 

#egl
PRODUCT_COPY_FILES += \
       $(call find-copy-subdir-files,*,$(LOCAL_PATH)/prebuild/apkdata/txt2epub,system/txt2epub)  \
       device/unusual/sun6i-common/egl/pvrsrvctl:system/vendor/bin/pvrsrvctl \
       device/unusual/sun6i-common/egl/libusc.so:system/vendor/lib/libusc.so \
       device/unusual/sun6i-common/egl/libglslcompiler.so:system/vendor/lib/libglslcompiler.so \
       device/unusual/sun6i-common/egl/libIMGegl.so:system/vendor/lib/libIMGegl.so \
       device/unusual/sun6i-common/egl/libpvr2d.so:system/vendor/lib/libpvr2d.so \
       device/unusual/sun6i-common/egl/libpvrANDROID_WSEGL.so:system/vendor/lib/libpvrANDROID_WSEGL.so \
       device/unusual/sun6i-common/egl/libPVRScopeServices.so:system/vendor/lib/libPVRScopeServices.so \
       device/unusual/sun6i-common/egl/libsrv_init.so:system/vendor/lib/libsrv_init.so \
       device/unusual/sun6i-common/egl/libsrv_um.so:system/vendor/lib/libsrv_um.so \
       device/unusual/sun6i-common/egl/libEGL_POWERVR_SGX544_115.so:system/vendor/lib/egl/libEGL_POWERVR_SGX544_115.so \
       device/unusual/sun6i-common/egl/libGLESv1_CM_POWERVR_SGX544_115.so:system/vendor/lib/egl/libGLESv1_CM_POWERVR_SGX544_115.so \
       device/unusual/sun6i-common/egl/libGLESv2_POWERVR_SGX544_115.so:system/vendor/lib/egl/libGLESv2_POWERVR_SGX544_115.so \
       device/unusual/sun6i-common/egl/gralloc.sun6i.so:system/vendor/lib/hw/gralloc.sun6i.so \
       device/unusual/sun6i-common/egl/hwcomposer.sun6i.so:system/vendor/lib/hw/hwcomposer.sun6i.so \
       device/unusual/sun6i-common/egl/egl.cfg:system/lib/egl/egl.cfg \
       device/unusual/sun6i-common/sensors.sh:system/bin/sensors.sh

PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.strictmode.visual=0 \
	persist.sys.strictmode.disable=1

PRODUCT_PROPERTY_OVERRIDES += \
	ro.opengles.version=131072

PRODUCT_PROPERTY_OVERRIDES += \
	ro.kernel.android.checkjni=0

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PROPERTY_OVERRIDES += \
	ro.reversion.aw_sdk_tag=exdroid4.2.2_r1-a31-v3.2 \
	ro.sys.cputype=QuadCore-A31Series

PRODUCT_PROPERTY_OVERRIDES += \
	wifi.interface=wlan0 \
	wifi.supplicant_scan_interval=15 \
	keyguard.no_require_sim=true

PRODUCT_PROPERTY_OVERRIDES += \
	persist.demo.hdmirotationlock=0
	
BUILD_NUMBER := $(shell date +%Y%m%d)
