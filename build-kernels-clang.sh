#!/bin/sh

. "${0%/*}/build_shared_vars.sh"

CLANG_A11=$ANDROID_ROOT/prebuilts/clang/host/linux-x86/clang-r353983c/bin/
CLANG_A12=$ANDROID_ROOT/prebuilts/clang/host/linux-x86/clang-r416183b/bin/
CLANG_A13=$ANDROID_ROOT/prebuilts/clang/host/linux-x86/clang-r450784d/bin/
CLANG_A14=$ANDROID_ROOT/prebuilts/clang/host/linux-x86/clang-r487747c/bin/

if  [ -d "$CLANG_A14" ]; then
    echo "Using Clang (build r487747c) from Android 14."
    export CLANG=$CLANG_A14
elif  [ -d "$CLANG_A13" ]; then
    echo "Using Clang (build r450784d) from Android 13."
    export CLANG=$CLANG_A13
elif  [ -d "$CLANG_A12" ]; then
    echo "Using Clang (build r416183b) from Android 12."
    export CLANG=$CLANG_A12
elif [ -d "$CLANG_A11" ]; then
    echo "Using Clang (build r353983) from Android 11."
    export CLANG=$CLANG_A11
fi

# Build command
BUILD_ARGS="LLVM=1 LLVM_IAS=1 CC=clang"

PATH=$CLANG:$PATH
# source shared parts
. "${0%/*}/build_shared.sh"
