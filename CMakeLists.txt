cmake_minimum_required(VERSION 3.5)

project(first_project)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS ON)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

option(BUILD_TESTS "Turn on build for tests of CPPTutorial" OFF)


add_library(${PROJECT_NAME}_lib STATIC
include/hello.hpp
src/hello.cpp
)

include_directories(include)

add_executable(cppdocker_run src/main.cpp)

add_subdirectory(test)

enable_testing()
target_link_libraries(cppdocker_run ${PROJECT_NAME}_lib)




install(TARGETS cppdocker_run RUNTIME)
