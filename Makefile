ARCHS = arm64 armv7 arm64e
export TARGET = iphone:clang:10.3:7.0
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = VolumePercent
VolumePercent_FILES = Tweak.xm
VolumePercent_LIBRARIES = colorpicker

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += volumepercentprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
