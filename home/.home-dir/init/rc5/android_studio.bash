android_studio_sdk_root=${ANDROID_STUDIO_SDK_ROOT:-"$HOME/Library/Android/sdk"};
if [ -z "$ANDROID_SDK_ROOT" ] && [ -e "$android_studio_sdk_root" ]; then
    export ANDROID_SDK_ROOT="$android_studio_sdk_root";
fi

android_sdk_emulator_dir=${ANDROID_SDK_EMULATOR_DIR:-"$ANDROID_SDK_ROOT/emulator"};
if [ -e "$android_sdk_emulator_dir" ] && [[ ! "$PATH" =~ "$android_sdk_emulator_dir" ]]; then
    export PATH="$android_sdk_emulator_dir:$PATH";
fi

android_sdk_platform_tools_dir=${ANDROID_SDK_PLATFORM_TOOLS_DIR:-"$ANDROID_SDK_ROOT/platform-tools"};
if [ -e "$android_sdk_platform_tools_dir" ] && [[ ! "$PATH" =~ "$android_sdk_platform_tools_dir" ]]; then
    export PATH="$android_sdk_platform_tools_dir:$PATH";
fi

android_sdk_tools_bin_dir=${ANDROID_SDK_TOOLS_BIN_DIR:-"$ANDROID_SDK_ROOT/tools/bin"};
if [ -e "$android_sdk_tools_bin_dir" ] && [[ ! "$PATH" =~ "$android_sdk_tools_bin_dir" ]]; then
    export PATH="$android_sdk_tools_bin_dir:$PATH";
fi
