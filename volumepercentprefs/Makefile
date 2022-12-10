ARCHS = arm64 armv7 arm64e
export TARGET = iphone:clang:10.3:7.0
include $(THEOS)/makefiles/common.mk
FINALPACKAGE=1
BUNDLE_NAME = VolumePercentPrefs

VolumePercentPrefs_FILES = vppRootListController.m
VolumePercentPrefs_INSTALL_PATH = /Library/PreferenceBundles
VolumePercentPrefs_FRAMEWORKS = UIKit
VolumePercentPrefs_PRIVATE_FRAMEWORKS = Preferences
VolumePercentPrefs_CFLAGS = -fobjc-arc
VolumePercentPrefs_LIBRARIES = colorpicker

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/VolumePercentPrefs.plist$(ECHO_END)
