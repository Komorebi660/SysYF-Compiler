#ifndef SYSYF_ACTIVEVAR_H
#define SYSYF_ACTIVEVAR_H

#include "Pass.h"
#include "Module.h"

class ActiveVar : public Pass
{
public:
    ActiveVar(Module *module) : Pass(module) {}
    void execute() final;
    const std::string get_name() const override {return name;}
private:
    Function *func_;
    const std::string name = "ActiveVar";
};

#endif  // SYSYF_ACTIVEVAR_H
