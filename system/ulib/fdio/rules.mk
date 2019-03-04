
LOCAL_DIR := $(GET_LOCAL_DIR)

ENABLE_NEW_SOCKET ?= false

MODULE := $(LOCAL_DIR)

MODULE_TYPE := userlib

MODULE_COMPILEFLAGS += -fvisibility=hidden

MODULE_SRCS += \
    $(LOCAL_DIR)/bsdsocket.c \
    $(LOCAL_DIR)/debug.c \
    $(LOCAL_DIR)/get-vmo.c \
    $(LOCAL_DIR)/fidl.c \
    $(LOCAL_DIR)/logger.c \
    $(LOCAL_DIR)/namespace.c \
    $(LOCAL_DIR)/null.c \
    $(LOCAL_DIR)/output.c \
    $(LOCAL_DIR)/pipe.c \
    $(LOCAL_DIR)/remoteio.c \
    $(LOCAL_DIR)/service.c \
    $(LOCAL_DIR)/socket.c \
    $(LOCAL_DIR)/spawn.c \
    $(LOCAL_DIR)/stubs.c \
    $(LOCAL_DIR)/uname.c \
    $(LOCAL_DIR)/unistd.c \
    $(LOCAL_DIR)/vmofile.c \
    $(LOCAL_DIR)/waitable.c \
    $(LOCAL_DIR)/watcher.c \
    $(LOCAL_DIR)/zxio.c \

MODULE_EXPORT := so

MODULE_SO_NAME := fdio

MODULE_FIDL_LIBS := \
    system/fidl/fuchsia-io \
    system/fidl/fuchsia-ldsvc \
    system/fidl/fuchsia-net \
    system/fidl/fuchsia-process

MODULE_STATIC_LIBS := \
    system/ulib/fidl \
    system/ulib/zxio \
    system/ulib/zxs \
    system/ulib/zx

MODULE_LIBS := system/ulib/zircon \
    system/ulib/c

include make/module.mk