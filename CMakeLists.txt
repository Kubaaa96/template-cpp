cmake_minimum_required(VERSION 3.16)

include(FetchContent)
FetchContent_Declare(_project_options URL https://github.com/aminya/project_options/archive/refs/tags/v0.21.1.zip)
FetchContent_MakeAvailable(_project_options)
include(${_project_options_SOURCE_DIR}/Index.cmake)

project(template-cpp VERSION 0.0.1 DESCRIPTION "" LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_EXTENSIONS OFF)


set(CONAN_SYSTEM_INCLUDES ON)
include(${CMAKE_SOURCE_DIR}/cmake/CMakeUtils.cmake)

#initialize_conan()

# Initialize project_options variable related to this project
# This overwrites `project_options` and sets `project_warnings`
# uncomment to enable the options. Some of them accept one or more inputs:
project_options(
        #        ENABLE_CACHE
        #        ${ENABLE_CPPCHECK}
        ENABLE_CLANG_TIDY
        #        ENABLE_VS_ANALYSIS
        ENABLE_CONAN
        # ENABLE_INTERPROCEDURAL_OPTIMIZATION
        # ENABLE_NATIVE_OPTIMIZATION
        #        ${ENABLE_DOXYGEN}
        # ENABLE_COVERAGE
        #        ${ENABLE_SANITIZER_ADDRESS}
        # ENABLE_SANITIZER_UNDEFINED_BEHAVIOR
        # ENABLE_SANITIZER_THREAD
        # ENABLE_SANITIZER_MEMORY
        # ENABLE_PCH
        # PCH_HEADERS
         WARNINGS_AS_ERRORS
        # ENABLE_INCLUDE_WHAT_YOU_USE
        # ENABLE_USER_LINKER
        # ENABLE_BUILD_WITH_TIME_TRACE
        # ENABLE_UNITY
        # CONAN_PROFILE ${profile_path}  # passes a profile to conan: see https://docs.conan.io/en/latest/reference/profiles.html
)

set(DEPENDENCIES_CONFIGURED
        fmt
        GTest
        spdlog)

foreach(DEPENDENCY ${DEPENDENCIES_CONFIGURED})
    find_package(${DEPENDENCY} CONFIG REQUIRED)
endforeach()

add_executable(${CMAKE_PROJECT_NAME} ${CMAKE_SOURCE_DIR}/src/main.cpp)
target_link_libraries(${CMAKE_PROJECT_NAME}
        PRIVATE
        project_options
        project_warnings
        )
target_link_system_libraries(
        ${CMAKE_PROJECT_NAME}
        PRIVATE
        fmt::fmt
        GTest::gtest
        spdlog::spdlog
#        ${CONAN_LIBS}
#        ${CMAKE_DL_LIBS}
)

#if (NOT CMAKE_BUILD_TYPE STREQUAL "Release")
#    message("NOT RELEASE mode - enable testing")
#    enable_testing()
#    include(GoogleTest)
#    add_subdirectory(tests)
#else ()
#    message("RELEASE mode - testing disabled")
#endif ()