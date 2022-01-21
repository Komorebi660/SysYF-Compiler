#ifndef SYSYF_CONSTPROPAGATION_H
#define SYSYF_CONSTPROPAGATION_H
#include "Pass.h"
#include "Constant.h"
#include "Instruction.h"
#include "Module.h"
#include "Value.h"
#include "IRStmtBuilder.h"

// 用来判断value是否为ConstantFloat/ConstantInt
ConstantInt *cast_to_const_int(Value *value);
ConstantFloat *cast_to_const_float(Value *value);

class ConstFolder
{
public:
    ConstFolder(Module *module) : module_(module) {}

    ConstantInt *computeINT(Instruction::OpID op, ConstantInt *value1, ConstantInt *value2);
    ConstantFloat *computeFloat(Instruction::OpID op, ConstantFloat *value1, ConstantFloat *value2);
    ConstantInt *computeCMP(CmpInst::CmpOp op, ConstantInt *value1, ConstantInt *value2);
    ConstantInt *computeFCMP(FCmpInst::CmpOp op, ConstantFloat *value1, ConstantFloat *value2);

private:
    Module *module_;
};

class ConstPropagation : public Pass
{
private:
    const std::string name = "ConstPropagation";
    ConstFolder *fold;
    std::map<Instruction *, BasicBlock *> delete_list;   //待删除指令
    std::map<Value *, ConstantInt *> global_INT;         //整形常量表
    std::map<Value *, ConstantFloat *> global_Float;     //浮点形常量表
    void HandlePhi(BasicBlock *bb, BasicBlock *succ_bb); //处理phi指令

public:
    ConstPropagation(Module *module) : Pass(module) {}
    void execute() final;
    const std::string get_name() const override { return name; }
    void ConstFold(Function *func); //这点常量并复写传播
    void DelUnusedInstr();          //删除无用指令
    void HandleBr(Function *func);  //处理分支
    void DeleteUnusedBB(Function *func);
};

#endif // SYSYF_CONSTPROPAGATION_H