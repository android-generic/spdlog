LOCAL_PATH := $(call my-dir)

##Make spdlog_headers
include $(CLEAR_VARS)
LOCAL_MODULE := spdlog_headers
LOCAL_LICENSE_KINDS := SPDX-license-identifier-MIT
LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)/include
include $(BUILD_HEADER_LIBRARY)

##Build libspdlog
include $(CLEAR_VARS)
LOCAL_CPP_INCLUDES := $(LOCAL_PATH)
LOCAL_CPPFLAGS := -fexceptions -DSPDLOG_FMT_EXTERNAL -DSPDLOG_COMPILED_LIB=
LOCAL_HEADER_LIBRARIES := spdlog_headers libbase_headers
LOCAL_SHARED_LIBRARIES := libbase
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := libspdlog
LOCAL_SRC_FILES :=		\
	$(call all-cpp-files-under, src)
include $(BUILD_SHARED_LIBRARY) 
