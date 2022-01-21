#include "SysYFDriver.h"
// #include "SysYFParser.h"

SysYFDriver::SysYFDriver()
    : trace_scanning(false), trace_parsing(false)
{
}

SysYFDriver::~SysYFDriver()
{
}

SyntaxTree::Node* SysYFDriver::parse(const std::string &f)
{
    file = f;

    // lexer begin
    scan_begin();
    yy::SysYFParser parser(*this);
    parser.set_debug_level(trace_parsing);
    // parser begin
    parser.parse();
    // lexer end
    scan_end();

    return this->root;
}

void SysYFDriver::error(const yy::location& l, const std::string& m)
{
    std::cerr << l << ": " << m << std::endl;
}

void SysYFDriver::error(const std::string& m)
{
    std::cerr << m << std::endl;
}


void SysYFDriver::scan_begin()
{
    lexer.set_debug(trace_scanning);

    // Try to open the file:
    instream.open(file);

    if(instream.good()) {
        lexer.switch_streams(&instream, 0);
    }
    else if(file == "-") {
        lexer.switch_streams(&std::cin, 0);
    }
    else {
        error("Cannot open file '" + file + "'.");
        exit(EXIT_FAILURE);
    }
}

void SysYFDriver::scan_end()
{
    instream.close();
}
