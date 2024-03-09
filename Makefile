FINALPACKAGE = 1
ARCHS = arm64 arm64e
THEOS_PACKAGE_SCHEME=rootless
TARGET := iphone:clang:16.5:15.0
INSTALL_TARGET_PROCESSES = SpringBoard


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = VolumePercent

VolumePercent_FILES = Tweak.xm
VolumePercent_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += volumepercentprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
