LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
LOCAL_ADDITIONAL_DEPENDENCIES += \
    $(HOST_OUT_EXECUTABLES)/buildPolicyCriterionTypes.py \
    $(CRITERION_TYPES_FILE) $(AUDIO_POLICY_CONFIGURATION_FILE) \
    $(ANDROID_AUDIO_BASE_HEADER_FILE)

include $(BUILD_SYSTEM)/base_rules.mk

$(LOCAL_BUILT_MODULE): MY_CRITERION_TYPES_FILE := $(CRITERION_TYPES_FILE)
$(LOCAL_BUILT_MODULE): MY_ANDROID_AUDIO_BASE_HEADER_FILE := $(ANDROID_AUDIO_BASE_HEADER_FILE)
$(LOCAL_BUILT_MODULE): MY_AUDIO_POLICY_CONFIGURATION_FILE := $(AUDIO_POLICY_CONFIGURATION_FILE)
$(LOCAL_BUILT_MODULE): MY_CRITERION_TOOL := $(HOST_OUT_EXECUTABLES)/buildPolicyCriterionTypes.py
$(LOCAL_BUILT_MODULE): $(LOCAL_ADDITIONAL_DEPENDENCIES)

	"$(MY_CRITERION_TOOL)" \
		--androidaudiobaseheader "$(MY_ANDROID_AUDIO_BASE_HEADER_FILE)" \
		--audiopolicyconfigurationfile "$(MY_AUDIO_POLICY_CONFIGURATION_FILE)" \
		--criteriontypes "$(MY_CRITERION_TYPES_FILE)" \
		--outputfile "$(@)"

# Clear variables for further use
CRITERION_TYPES_FILE :=
ANDROID_AUDIO_BASE_HEADER_FILE :=
AUDIO_POLICY_CONFIGURATION_FILE :=
