
function(create_test TESTNAME)
    cmake_parse_arguments(ARGS "" "" "SOURCES;DEPENDS" ${ARGN})
    add_executable(${TESTNAME} ${ARGS_SOURCES})
    set_link_options(${TESTNAME} DEPENDS ${ARGS_DEPENDS})
    gtest_discover_tests(${TESTNAME}
            WORKING_DIRECTORY ${PROJECT_DIR}
            PROPERTIES VS_DEBUGGER_WORKING_DIRECTORY "${PROJECT_DIR}"
            )
    set_target_properties(${TESTNAME} PROPERTIES FOLDER ${CMAKE_SOURCE_DIR}/tests)

endfunction()

function(set_link_options TARGET_NAME)
    cmake_parse_arguments(ARGS "" "" "DEPENDS" ${ARGN})
    target_include_directories(${TARGET_NAME} PUBLIC ${CMAKE_SOURCE_DIR}/include)
    target_link_libraries(${TARGET_NAME} PRIVATE ${CONAN_LIBS} PUBLIC ${ARGS_DEPENDS})
    include(${CMAKE_SOURCE_DIR}/cmake/CompilerWarnings.cmake)
    set_project_warnings(${TARGET_NAME})
endfunction()

macro(initialize_conan)
    download_conan_cmake()

    include(${CMAKE_BINARY_DIR}/conan/conan.cmake)
    set(CONAN_SYSTEM_INCLUDES ON)
    conan_cmake_run(
            CONANFILE ${CMAKE_SOURCE_DIR}/conanfile.txt
            BASIC_SETUP
            BUILD missing
    )

#    if (WIN32)
#        if (MSVC)
#            message(STATUS OUR_MSVC)
#            conan_cmake_run(
#                    CONANFILE ${CMAKE_SOURCE_DIR}/conanfile.txt
#                    BASIC_SETUP
#                    PROFILE ${CMAKE_SOURCE_DIR}/conan/msvc_windows
#                    BUILD missing
#            )
#        endif()
#    elseif (UNIX AND NOT APPLE)
#        if (CMAKE_CXX_COMPILER_ID MATCHES ".*Clang")
#            conan_cmake_run(
#                    CONANFILE ${CMAKE_SOURCE_DIR}/conanfile.txt
#                    BASIC_SETUP
#                    PROFILE ${CMAKE_SOURCE_DIR}/conan/clang_linux
#                    BUILD missing
#            )
#        elseif (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
#            conan_cmake_run(
#                    CONANFILE ${CMAKE_SOURCE_DIR}/conanfile.txt
#                    BASIC_SETUP
#                    PROFILE ${CMAKE_SOURCE_DIR}/conan/gcc_linux
#                    BUILD missing
#            )
#        endif ()
#    elseif (APPLE)
#        if (CMAKE_CXX_COMPILER_ID MATCHES ".*Clang")
#            conan_cmake_run(
#                    CONANFILE ${CMAKE_SOURCE_DIR}/conanfile.txt
#                    BASIC_SETUP
#                    PROFILE ${CMAKE_SOURCE_DIR}/conan/clang_macos
#                    BUILD missing
#            )
#        elseif (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
#            conan_cmake_run(
#                    CONANFILE ${CMAKE_SOURCE_DIR}/conanfile.txt
#                    BASIC_SETUP
#                    PROFILE ${CMAKE_SOURCE_DIR}/conan/gcc_macos
#                    BUILD missing
#            )
#        endif ()
#    endif ()
endmacro()


function(download_conan_cmake)
    if (NOT EXISTS "${CMAKE_BINARY_DIR}/conan/conan.cmake")
        message(STATUS "Downloading conan.cmake from https://github.com/conan-io/cmake-conan")
        file(DOWNLOAD "https://raw.githubusercontent.com/conan-io/cmake-conan/master/conan.cmake"
                "${CMAKE_BINARY_DIR}/conan/conan.cmake")
    endif ()
endfunction()