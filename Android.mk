LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_BOARD_PLATFORM), fiber)

include $(call all-makefiles-under,$(LOCAL_PATH))

endif
