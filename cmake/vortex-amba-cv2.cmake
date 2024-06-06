#
# CMake Toolchain file for crosscompiling on ARM.
#
# This can be used when running cmake in the following way:
#  cd build/
#  cmake .. -DCMAKE_TOOLCHAIN_FILE=../cmake/vortex-amba-cv2.cmake
#

if(DEFINED ENV{TOOLCHAIN_PATH} AND NOT "$ENV{TOOLCHAIN_PATH}" STREQUAL "")
    # Set the CMake variable to the value of the environment variable
    set(CROSS_PATH $ENV{TOOLCHAIN_PATH})
else()
    # Set a default value based on fluent-bit-build docker image
    set(CROSS_PATH "/opt/toolchains/amcv2x/linaro-aarch64-2020.09-gcc10.2-linux5.4/bin")
endif()

# Target operating system name.
set(CMAKE_SYSTEM_NAME Linux)
# set(CMAKE_SYSTEM_PROCESSOR aarch64)

# Name of C compiler.
set(CMAKE_C_COMPILER "${CROSS_PATH}/aarch64-linux-gcc")
set(CMAKE_CXX_COMPILER "${CROSS_PATH}/aarch64-linux-g++")

# Where to look for the target environment. (More paths can be added here)
set(CMAKE_FIND_ROOT_PATH "${CROSS_PATH}")

# Adjust the default behavior of the FIND_XXX() commands:
# search programs in the host environment only.
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)

# Search headers and libraries in the target environment only.
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

# Use prebuilt OpenSSL, set version and platform, please check the CMakelists.txt in lib/openssl
set(USE_PREBUILT_OPENSSL 1)
set(OPENSSL_VERSION "1.1.1w")
set(OPENSSL_PLATFORM "amba-cv2")

# Show variables
message(STATUS "========= CMake Toolchain and OpenSSL settings =========")
message(STATUS "CROSS_PATH: ${CROSS_PATH}")
message(STATUS "CMAKE_C_COMPILER: ${CMAKE_C_COMPILER}")
message(STATUS "CMAKE_CXX_COMPILER: ${CMAKE_CXX_COMPILER}")
message(STATUS "USE_PREBUILT_OPENSSL: ${USE_PREBUILT_OPENSSL}")
message(STATUS "OPENSSL_VERSION: ${OPENSSL_VERSION}")
message(STATUS "OPENSSL_PLATFORM: ${OPENSSL_PLATFORM}")
message(STATUS "=========================================================")