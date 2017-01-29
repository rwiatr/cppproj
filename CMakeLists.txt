cmake_minimum_required(VERSION 3.2)

include(cmake/script/log.cmake)
include(cmake/external/GoogleTest.cmake)

project(cppproj)

add_executable(tests ${C_V__MODULE_SOURCES} ${C_V__MODULE_TEST_SOURCES})
add_dependencies(tests libgtest)
target_link_libraries(tests libgtest)
