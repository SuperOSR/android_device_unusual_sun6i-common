LOCAL_PATH := $(call my-dir)

ifneq ($(filter fiber,(TARGET_BOARD_PLATFORM)),)

include $(call all-makefiles-under,$(LOCAL_PATH))

endif
