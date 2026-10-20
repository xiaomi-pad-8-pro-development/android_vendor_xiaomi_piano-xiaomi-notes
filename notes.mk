# Shared Notes app, staged from the reviewed HyperOS 4 APK.
# Manifest's mandatory micloud-sdk reference is removed from the rebuilt APK.
# Rebuild the APK from parts/ the first time the product is configured.
ifeq ($(wildcard vendor/xiaomi/piano-xiaomi-notes/Android.bp),)
_piano_notes_staged := $(shell python3 vendor/xiaomi/piano-xiaomi-notes/stage-originals.py --from-parts >&2 && echo yes)
ifneq ($(_piano_notes_staged),yes)
$(error Staging Xiaomi Notes from vendor/xiaomi/piano-xiaomi-notes/parts failed)
endif
endif
_piano_notes_ok := $(shell python3 vendor/xiaomi/piano-xiaomi-notes/stage-originals.py --check >/dev/null 2>&1 && echo verified)
ifneq ($(_piano_notes_ok),verified)
$(error Xiaomi Notes staged APK failed manifest/integrity verification)
endif
PRODUCT_PACKAGES += MIUINotes
