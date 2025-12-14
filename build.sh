#!/bin/bash
# based on the instructions from edk2-platform
set -e
. build_common.sh
# not actually GCC5; it's GCC7 on Ubuntu 18.04.
./build_bootshim.sh
#rm workspace/UEFI.bin
GCC5_AARCH64_PREFIX=aarch64-linux-gnu- build -j$(nproc) -s -n 0 -a AARCH64 -t GCC5 -p T8010Pkg/Devices/iPhone7.dsc||exit 1
cat BootShim/BootShim.bin workspace/Build/T8010Pkg/DEBUG_GCC5/FV/T8010PKG_UEFI.fd > workspace/UEFI.bin||exit 1
