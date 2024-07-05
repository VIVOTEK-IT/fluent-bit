cmake_minimum_required(VERSION 3.12)
add_library(LuaJIT_Built INTERFACE)

if(NOT DEFINED LUAJIT_VERSION OR LUAJIT_VERSION STREQUAL "")
    set(LUAJIT_VERSION "2.1")
endif()

if(NOT DEFINED SOC_PLATFORM OR SOC_PLATFORM STREQUAL "")
    message(FATAL_ERROR "Please define variable SOC_PLATFORM, ex. amba, amba-cv2, sstar")
endif()

target_include_directories(LuaJIT_Built INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}/${LUAJIT_VERSION}/${SOC_PLATFORM}/include)
target_link_libraries(LuaJIT_Built INTERFACE
    ${CMAKE_CURRENT_SOURCE_DIR}/${LUAJIT_VERSION}/${SOC_PLATFORM}/lib/libluajit-5.1.a
)
