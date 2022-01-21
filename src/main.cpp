#include <iostream>
#include "IRBuilder.h"
#include "SysYFDriver.h"
#include "SyntaxTreePrinter.h"
#include "ErrorReporter.h"
#include "SyntaxTreeChecker.h"
#include "Pass.h"
#include "DominateTree.h"
#include "ComSubExprEli.h"
#include "Mem2Reg.h"
#include "RDominateTree.h"
#include "ConstPropagation.h"
#include "DeadCodeEli.h"
#include "ActiveVar.h"

void print_help(const std::string &exe_name)
{
    std::cout << "Usage: " << exe_name
              << " [ -h | --help ] [ -p | --trace_parsing ] [ -s | --trace_scanning ] [ -emit-ast ]"
              << " [ -emit-ir ] [ -O2 ] [ -O ] [ -dce ] [ -cp ] [ -cse ] [ -av ] [ -o <output-file> ]"
              << " <input-file>"
              << std::endl;
}

int main(int argc, char *argv[])
{
    IRBuilder builder;
    SysYFDriver driver;
    SyntaxTreePrinter printer;
    ErrorReporter reporter(std::cerr);
    SyntaxTreeChecker checker(reporter);

    bool print_ast = false;
    bool emit_ir = false;
    bool check = false;
    bool optimize_all = false;
    bool optimize = false;

    bool cse = false;
    bool cp = false;
    bool dce = false;
    bool av = false;

    std::string filename = "-";
    std::string output_llvm_file = "-";
    for (int i = 1; i < argc; ++i)
    {
        if (argv[i] == std::string("-h") || argv[i] == std::string("--help"))
        {
            print_help(argv[0]);
            return 0;
        }
        else if (argv[i] == std::string("-p") || argv[i] == std::string("--trace_parsing"))
        {
            driver.trace_parsing = true;
        }
        else if (argv[i] == std::string("-s") || argv[i] == std::string("--trace_scanning"))
        {
            driver.trace_scanning = true;
        }
        else if (argv[i] == std::string("-emit-ast"))
        {
            print_ast = true;
        }
        else if (argv[i] == std::string("-emit-ir"))
        {
            emit_ir = true;
        }
        else if (argv[i] == std::string("-check"))
        {
            check = true;
        }
        else if (argv[i] == std::string("-o"))
        {
            output_llvm_file = argv[++i];
        }
        else if (argv[i] == std::string("-O2"))
        {
            optimize_all = true;
            optimize = true;
        }
        else if (argv[i] == std::string("-O"))
        {
            optimize = true;
        }
        else if (argv[i] == std::string("-dce"))
        {
            dce = true;
        }
        else if (argv[i] == std::string("-cp"))
        {
            cp = true;
        }
        else if (argv[i] == std::string("-cse"))
        {
            cse = true;
        }
        else if (argv[i] == std::string("-av"))
        {
            av = true;
        }
        else
        {
            filename = argv[i];
        }
    }
    auto root = driver.parse(filename);
    if (print_ast)
        root->accept(printer);
    if (check)
        root->accept(checker);
    if (emit_ir)
    {
        root->accept(builder);
        auto m = builder.getModule();
        m->set_file_name(filename);
        m->set_print_name();
        if (optimize)
        {
            PassMgr passmgr(m.get());
            passmgr.addPass<DominateTree>();
            passmgr.addPass<Mem2Reg>();
            if (optimize_all)
            {
                passmgr.addPass<ConstPropagation>();
                passmgr.addPass<ComSubExprEli>();
                passmgr.addPass<DeadCodeEli>();
                passmgr.addPass<ActiveVar>();
            }
            else
            {
                if (cp)
                {
                    passmgr.addPass<ConstPropagation>();
                }
                if (cse)
                {
                    passmgr.addPass<ComSubExprEli>();
                }
                if (dce)
                {
                    passmgr.addPass<DeadCodeEli>();
                }
                if (av)
                {
                    passmgr.addPass<ActiveVar>();
                }
            }
            passmgr.execute();
            m->set_print_name();
        }
        auto IR = m->print();
        if (output_llvm_file == "-")
        {
            std::cout << IR;
        }
        else
        {
            std::ofstream output_stream;
            output_stream.open(output_llvm_file, std::ios::out);
            output_stream << IR;
            output_stream.close();
        }
    }
    return 0;
}
