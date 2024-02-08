# Internal version
PB_VERSION := PasuPare
PB_BUILD_TYPE := PasuFic

PIXELBUILDS_VERSION := Kasumi_$(TARGET_PRODUCT_SHORT)-$(PB_VERSION)-$(shell date +%Y%m%d-%H%M)

# There must be a better way to have build system handle these props,
# copying the configuration from base versioning Makefile feels so
# wrong.
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.build.version.custom=$(PB_VERSION) \
    ro.build.version.device=$(TARGET_PRODUCT_SHORT) \
    ro.pb.build.version=$(PIXELBUILDS_VERSION) \
    ro.pb.buildtype=$(PB_BUILD_TYPE)
