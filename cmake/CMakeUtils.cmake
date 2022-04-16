
function(create_test TESTNAME)
    cmake_parse_arguments(ARGS "" "" "SOURCES;DEPENDS" ${ARGN})
    add_executable(${TESTNAME} ${ARGS_SOURCES})
    target_include_directories(${TESTNAME} PUBLIC ${CMAKE_SOURCE_DIR}/include)
    target_link_libraries(
            ${TESTNAME}
            PUBLIC
            ${CONAN_LIBS}
            ${CMAKE_DL_LIBS}
            ${ARGS_DEPENDS}
    )
    add_test(NAME ${TESTNAME} COMMAND ${TESTNAME})
    set_target_properties(${TESTNAME} PROPERTIES FOLDER ${CMAKE_SOURCE_DIR}/tests)
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
endmacro()


function(download_conan_cmake)
    if (NOT EXISTS "${CMAKE_BINARY_DIR}/conan/conan.cmake")
        message(STATUS "Downloading conan.cmake from https://github.com/conan-io/cmake-conan")
        file(DOWNLOAD "https://raw.githubusercontent.com/conan-io/cmake-conan/master/conan.cmake"
                "${CMAKE_BINARY_DIR}/conan/conan.cmake")
    endif ()
endfunction()