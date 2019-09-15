RYZ_MOD_VERSION := Anxiety
RYZ_ANDROID = 15.1
RYZ_BUILD_TYPE ?= COMMUNITY
RYZ_MAINTAINER ?= UNKNOWN

# Internal version
LINEAGE_VERSION := RyzOS-$(RYZ_MOD_VERSION)-$(RYZ_ANDROID)-$(LINEAGE_BUILD)-$(RYZ_BUILD_TYPE)-$(shell date +%Y%m%d)

# Display version
LINEAGE_DISPLAY_VERSION := v$(RYZ_ANDROID)-$(shell date +%Y%m%d)
RYZ_VERSION:= $(LINEAGE_VERSION)

# Official Devies
ifeq ($(RYZ_BUILD_TYPE), OFFICIAL)
   LIST = $(shell cat official/ryz.devices)
    ifeq ($(filter $(LINEAGE_BUILD), $(LIST)), $(LINEAGE_BUILD))
      IS_OFFICIAL=true
      RYZ_BUILD_TYPE := OFFICIAL
    endif
    ifneq ($(IS_OFFICIAL), true)
       RYZ_BUILD_TYPE := COMMUNITY
       $(error Device is not official "$(LINEAGE_BUILD)")
    endif
endif

# RyzOS version properties
PRODUCT_SYSTEM_PROPERTIES += \
    ro.ryz.version=$(RYZ_MOD_VERSION) \
    ro.ryz.buildtype=$(RYZ_BUILD_TYPE) \
    ro.ryz.device=$(LINEAGE_BUILD) \
    ro.ryz.display.version=$(LINEAGE_DISPLAY_VERSION) \
    ro.ryz.android=$(RYZ_ANDROID) \
    ro.modversion=$(RYZ_MOD_VERSION) \
    ro.aosp.revision=$(AOSP_REVISION) \
    ro.ryz.maintainer=$(RYZ_MAINTAINER)