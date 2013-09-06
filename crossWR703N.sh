# Source this to your shell...
# Sets up aliases for gcc & binutils, to support cross-compilation of v8 with gyp.

# Code Sourcery 2012.03-63 release
PREFIX=/home/${USER}/builds/AARC1-Toolchain/toolchain-mips_r2_gcc-4.6-linaro_uClibc-0.9.33.2/bin/mips-openwrt-linux-

export CC=${PREFIX}gcc
export CXX=${PREFIX}g++
export AR=${PREFIX}ar
export RANLIB=${PREFIX}ranlib
export LINK=$CXX


LIBPATH=/home/${USER}/builds/AARC1-Toolchain/toolchain-mips_r2_gcc-4.6-linaro_uClibc-0.9.33.2/lib/
#export LDFLAGS=-L${LIBPATH}
export LDFLAGS='-Wl,-rpath-link '${LIBPATH}

export GYPFLAGS="-Dv8_use_mips_abi_hardfloat=false -Dv8_can_use_fpu_instructions=false"

make mips.release snapshot=off -j4
