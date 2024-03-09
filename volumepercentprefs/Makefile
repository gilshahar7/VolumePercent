FINALPACKAGE = 1
ARCHS = arm64 arm64e
THEOS_PACKAGE_SCHEME=rootless
TARGET := iphone:clang:16.5:15.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = VolumePercentPrefs

VolumePercentPrefs_FILES = vppRootListController.m EXMColorPickerCell.m
VolumePercentPrefs_FRAMEWORKS = UIKit
VolumePercentPrefs_PRIVATE_FRAMEWORKS = Preferences
VolumePercentPrefs_INSTALL_PATH = /Library/PreferenceBundles
VolumePercentPrefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
