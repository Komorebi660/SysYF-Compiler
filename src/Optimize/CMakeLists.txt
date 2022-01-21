add_library(
        SysYFPass STATIC
        Pass.cpp
        ComSubExprEli.cpp
        DominateTree.cpp
        RDominateTree.cpp
        Mem2Reg.cpp
        ConstPropagation.cpp
        DeadCodeEli.cpp
        ActiveVar.cpp
)
