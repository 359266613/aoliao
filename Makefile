DEBUG = 0
FINALPACKAGE = 1

TARGET = iphone:clang:latest:15.0
ARCHS = arm64 arm64e

INSTALL_TARGET_PROCESSES = SpringBoard


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Stheno SthenoCamera SthenoKeyboard

Stheno_FILES = $(shell find Sources/Stheno -name '*.swift') Sources/Support/SthenoPaths.mm
Stheno_SWIFT_BRIDGING_HEADER = Stheno-Bridging-Header.h
Stheno_SWIFT_VERSION = 5
Stheno_CFLAGS = -fobjc-arc
Stheno_FRAMEWORKS = UIKit SwiftUI QuartzCore IOKit
Stheno_LIBRARIES = substrate
Stheno_LDFLAGS = -Wl,-undefined,dynamic_lookup

SthenoCamera_FILES = Sources/SthenoCamera/SthenoCamera.xm Sources/Support/SthenoPaths.mm
SthenoCamera_CFLAGS = -fobjc-arc
SthenoCamera_FRAMEWORKS = Foundation
SthenoCamera_LIBRARIES = substrate

SthenoKeyboard_FILES = Sources/SthenoKeyboard/SthenoKeyboard.xm Sources/Support/SthenoPaths.mm
SthenoKeyboard_CFLAGS = -fobjc-arc
SthenoKeyboard_FRAMEWORKS = UIKit Foundation
SthenoKeyboard_LIBRARIES = substrate

include $(THEOS_MAKE_PATH)/tweak.mk
