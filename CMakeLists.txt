project(SysYFCompiler)

cmake_minimum_required(VERSION 3.5)

set(CMAKE_CXX_STANDARD 17)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O0 -Wall -g -pedantic")

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# add macros to generate Bison & Flex Cpp code from grammar
# find_package(BISON REQUIRED)
# find_package(FLEX REQUIRED)

# BISON_TARGET(SysYParser ${CMAKE_CURRENT_SOURCE_DIR}/grammar/SysYParser.yy ${CMAKE_CURRENT_BINARY_DIR}/SysYParser.cpp
#              COMPILE_FLAGS "-Wall -Wcounterexamples --defines=${CMAKE_CURRENT_BINARY_DIR}/SysYParser.h")
# FLEX_TARGET(SysYScanner ${CMAKE_CURRENT_SOURCE_DIR}/grammar/SysYScanner.ll  ${CMAKE_CURRENT_BINARY_DIR}/SysYScanner.cpp
#             COMPILE_FLAGS "--debug --c++")
# ADD_FLEX_BISON_DEPENDENCY(SysYScanner SysYParser)

# include generated files in project environment
include_directories(${CMAKE_CURRENT_BINARY_DIR})

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include/ASTBuilder)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include/ASTPrinter)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include/Checker)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include/ErrorReporter)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include/Frontend)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include/SysYFIR)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include/SysYFIRBuilder)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include/Optimize)

add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/src/ASTBuilder)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/src/ASTPrinter)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/src/Checker)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/src/ErrorReporter)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/src/Frontend)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/src/SysYFIR)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/src/SysYFIRBuilder)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/src/Optimize)

add_executable(
        compiler
        ${CMAKE_CURRENT_SOURCE_DIR}/src/main.cpp
)

target_link_libraries(
        compiler
        SysYFPass
        SysYFIRBuilder
        IRLib
        Driver
        Checker
        ASTPrinter
        ErrReporter
)
