
LOCAL_DIR := $(GET_LOCAL_DIR)

MODULE := $(LOCAL_DIR)

MODULE_TYPE := userapp
MODULE_GROUP := misc

MODULE_SRCS += \
    $(LOCAL_DIR)/main.c

MODULE_LIBS := \
    system/ulib/hid \
    system/ulib/zircon \
    system/ulib/fdio \
    system/ulib/c

MODULE_FIDL_LIBS := \
    system/fidl/zircon-input \

include make/module.mk