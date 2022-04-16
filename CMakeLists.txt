cmake_minimum_required(VERSION 3.15)
project(template-cpp CXX)
set(CMAKE_CXX_STANDARD 20)

set(CONAN_SYSTEM_INCLUDES ON)
include(${CMAKE_SOURCE_DIR}/cmake/CMakeUtils.cmake)

initialize_conan()

add_executable(${CMAKE_PROJECT_NAME} ${CMAKE_SOURCE_DIR}/src/main.cpp)
target_link_libraries(${CMAKE_PROJECT_NAME}
        PUBLIC
        ${CONAN_LIBS}
        ${CMAKE_DL_LIBS}
        )