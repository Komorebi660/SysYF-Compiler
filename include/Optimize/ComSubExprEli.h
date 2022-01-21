#ifndef SYSYF_COMSUBEXPRELI_H
#define SYSYF_COMSUBEXPRELI_H

#include "Pass.h"
#include <map>
#include <set>
#include "Instruction.h"

struct Expr
{
    int expr_num; //表达式标号
    Value *lvalue;
    Value *rvalue;
    std::vector<Value *> index; //gep
    Instruction::OpID op;
    CmpInst::CmpOp cmpop; //cmp op
};

class ComSubExprEli : public Pass
{
public:
    explicit ComSubExprEli(Module *module) : Pass(module) {}
    const std::string get_name() const override { return name; }
    void execute() override;
    //static bool is_valid_expr(Instruction *inst);
    void GetAllExpr(Function *func);    //获取所有表达式
    void GetAvailExpr(Function *func);  //可用表达式分析
    void DelComSubExpr(Function *func); //删除公共子表达式
    void DelUnusedInst(Function *func); //删除无用指令

private:
    const std::string name = "ComSubExprEli";
    int index; //记录当前处理的表达式个数
    //所有的表达式
    std::vector<struct Expr> ALL;
    //使用位向量表示
    std::map<BasicBlock *, std::vector<bool>> gen, IN, OUT;
    //保存需要删除的指令
    std::map<Instruction *, BasicBlock *> delete_list;
    //表达式比较函数
    bool CmpBinaryExpr(struct Expr e1, struct Expr e2);
    bool CmpGepExpr(struct Expr e1, struct Expr e2);
    bool CmpSiFpExpr(struct Expr e1, struct Expr e2);
    //从bb开始寻找前驱基本块中计算了表达式target的,返回替换的值
    Value *FindExpr(BasicBlock *bb, struct Expr target);
};

#endif // SYSYF_COMSUBEXPRELI_H