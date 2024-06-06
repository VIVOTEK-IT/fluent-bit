cmake_minimum_required(VERSION 3.12)
add_library(OpenSSL_Built INTERFACE)

if(NOT DEFINED OPENSSL_VERSION OR OPENSSL_VERSION STREQUAL "")
    set(OPENSSL_VERSION "1.1.1w")
endif()

if(NOT DEFINED OPENSSL_PLATFORM OR OPENSSL_PLATFORM STREQUAL "")
    message(FATAL_ERROR "Please define variable OPENSSL_PLATFORM, ex. amba, amba-cv2, sstar")
endif()

target_include_directories(OpenSSL_Built INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}/${OPENSSL_VERSION}/${OPENSSL_PLATFORM}/include)
target_link_libraries(OpenSSL_Built INTERFACE
    ${CMAKE_CURRENT_SOURCE_DIR}/${OPENSSL_VERSION}/${OPENSSL_PLATFORM}/lib/libssl.a  # or libssl.lib on Windows
    ${CMAKE_CURRENT_SOURCE_DIR}/${OPENSSL_VERSION}/${OPENSSL_PLATFORM}/lib/libcrypto.a  # or libcrypto.lib on Windows
)
