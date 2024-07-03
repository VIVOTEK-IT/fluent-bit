#
# CMake Toolchain file for crosscompiling on ARM.
#
# This can be used when running cmake in the following way:
#  cd build/
#  cmake .. -DCMAKE_TOOLCHAIN_FILE=../cmake/vortex-ams6l_standard.cmake -DCMAKE_INSTALL_PREFIX=./output
# 
# lbbacktrace use autoconf, need to set GNU_HOST or it will use wrong toolchain:
#  export PATH=/opt/toolchains/amcv2x/linaro-aarch64-2018.08-gcc8.2/bin:$PATH
#  cmake .. -DCMAKE_TOOLCHAIN_FILE=../cmake/vortex-ams6l_standard.cmake -DCMAKE_INSTALL_PREFIX=./output -DGNU_HOST=aarch64-linux -DSANITIZE_ADDRESS=On

# Change to use TOOLSDIR to sync with toolchain path in vsaas-fw-build (Vortex Camera FW build docker image)
if(DEFINED ENV{TOOLSDIR} AND NOT "$ENV{TOOLSDIR}" STREQUAL "")
    set(CROSS_PATH $ENV{TOOLSDIR})
else()
    # Set a default value based on fluent-bit-build docker image
    set(CROSS_PATH "/opt/toolchains/amcv2x/linaro-aarch64-2018.08-gcc8.2/bin")
endif()

# it will return the parent directory of the CROSS_PATH
get_filename_component(ROOT_PATH "${CROSS_PATH}" DIRECTORY)

# Target operating system name.
set(CMAKE_SYSTEM_NAME Linux)
# set(CMAKE_SYSTEM_PROCESSOR aarch64)

# Name of C compiler.
set(CMAKE_C_COMPILER "${CROSS_PATH}/aarch64-linux-gcc")
set(CMAKE_CXX_COMPILER "${CROSS_PATH}/aarch64-linux-g++")

# Where to look for the target environment. (More paths can be added here)
set(CMAKE_FIND_ROOT_PATH "${ROOT_PATH}")

# Adjust the default behavior of the FIND_XXX() commands:
# search programs in the host environment only.
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)

# Search headers and libraries in the target environment only.
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

# Use prebuilt OpenSSL, set version and platform, please check the CMakelists.txt in lib/openssl
set(USE_PREBUILT_OPENSSL 1)
set(OPENSSL_VERSION "1.1.1w")
set(OPENSSL_PLATFORM "amba")

# Show variables
message(STATUS "========= CMake Toolchain and OpenSSL settings =========")
message(STATUS "CROSS_PATH: ${CROSS_PATH}")
message(STATUS "CMAKE_C_COMPILER: ${CMAKE_C_COMPILER}")
message(STATUS "CMAKE_CXX_COMPILER: ${CMAKE_CXX_COMPILER}")
message(STATUS "USE_PREBUILT_OPENSSL: ${USE_PREBUILT_OPENSSL}")
message(STATUS "OPENSSL_VERSION: ${OPENSSL_VERSION}")
message(STATUS "OPENSSL_PLATFORM: ${OPENSSL_PLATFORM}")
message(STATUS "=========================================================")
