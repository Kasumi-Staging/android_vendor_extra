# Fixup props found across the device trees

# Disable frame rate override
# Having this enabled causes the UI to be rendered in 30 FPS during
# video playback using apps like YouTube and Chrome.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.surface_flinger.enable_frame_rate_override?=false
