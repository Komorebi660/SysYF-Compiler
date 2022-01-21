add_library(
    Driver STATIC
    SysYFDriver.cpp   
)

add_library(
    Scanner STATIC
    SysYFScanner.cpp
)

add_library(
    Parser STATIC
    SysYFParser.cpp
)

target_link_libraries(
    Driver
    Scanner
    Parser
    ASTLib
)
