# Kasumi Extras - Mother repo for all extras for Kasumi
# Copyright (C) 2024 Project Kasumi
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

LOCAL_PATH := $(call my-dir)

# Set the product brand to Kasumi
PRODUCT_BRAND ?= Kasumi

# Versioning stuff
include $(LOCAL_PATH)/version.mk

# Include Kasumi Tones
-include vendor/kasumi/tones/config.mk

# Check for GCGOP variable and include it
ifeq ($(KASUMI_INCLUDE_GCGOP), true)
    $(call inherit-product, vendor/kasumi/gcgop/config.mk)
endif

# Build Bandori Wallpapers Stub if we're building Google's Wallpaper
# Picker
# TODO: Test our stub on AOSP Wallpaper Picker and remove the
#       conditional if it's happy with our stub. If it's not happy with
#       it, try to make an RRO overlay for it and build it instead.
ifneq ($(strip WallpaperPickerGoogleRelease,$(PRODUCT_PACKAGES)),)
    # We're building Google's Wallpaper Picker.
    PRODUCT_PACKAGES += BandoriWallpapersStub
else
    # We're most probably building AOSP Wallpaper Picker. Read the TODO
    PRODUCT_PACKAGES += BandoriWallpapersStub
endif

# And lastly, include our overlays! You'll most probably have to adapt
# the names of the strings in them for them to work fine!
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += \
    vendor/kasumi/overlay/common \
    vendor/kasumi/overlay/banner

PRODUCT_PACKAGE_OVERLAYS += \
    vendor/kasumi/overlay/common \
    vendor/kasumi/overlay/banner
