project(test_pro)

set(CMAKE_CXX_STANDARD 17)

find_package(GTest REQUIRED)
include_directories(../include)
add_executable(${PROJECT_NAME} main.cpp)

target_link_libraries(${PROJECT_NAME} GTest::gtest GTest::gtest_main)


