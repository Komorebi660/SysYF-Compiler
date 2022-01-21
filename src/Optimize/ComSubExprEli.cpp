#include "Pass.h"
#include "ComSubExprEli.h"
#include <string.h>
#include <set>
#include <algorithm>
using namespace std;

//#define DEBUG

void ComSubExprEli::execute()
{
    module->set_print_name();
    for (auto fun : module->get_functions())
    {
        if (fun->get_basic_blocks().empty())
            continue;
        ALL.clear();
        gen.clear();
        IN.clear();
        OUT.clear();
        delete_list.clear();
        index = 0;
        GetAllExpr(fun);
        GetAvailExpr(fun);
        DelComSubExpr(fun);
        DelUnusedInst(fun);
    }
}

bool ComSubExprEli::CmpBinaryExpr(struct Expr e1, struct Expr e2)
{
    if (e1.op != e2.op)
        return false;

    if (e1.op == Instruction::OpID::cmp || e1.op == Instruction::OpID::fcmp)
    {
        if (e1.cmpop != e2.cmpop)
            return false;
    }

    //加法和乘法左右操作数可交换
    bool reverse = false;
    if (e1.op == Instruction::OpID::add || e1.op == Instruction::OpID::mul)
        reverse = true;

    //左右操作数分别相等
    if (e1.lvalue == e2.lvalue && e1.rvalue == e2.rvalue)
        return true;
    if (reverse && e1.lvalue == e2.rvalue && e1.rvalue == e2.lvalue)
        return true;

    //可能出现常数
    auto lvalue_i1 = dynamic_cast<ConstantInt *>(e1.lvalue);
    auto rvalue_i1 = dynamic_cast<ConstantInt *>(e1.rvalue);
    auto lvalue_f1 = dynamic_cast<ConstantFloat *>(e1.lvalue);
    auto rvalue_f1 = dynamic_cast<ConstantFloat *>(e1.rvalue);

    auto lvalue_i2 = dynamic_cast<ConstantInt *>(e2.lvalue);
    auto rvalue_i2 = dynamic_cast<ConstantInt *>(e2.rvalue);
    auto lvalue_f2 = dynamic_cast<ConstantFloat *>(e2.lvalue);
    auto rvalue_f2 = dynamic_cast<ConstantFloat *>(e2.rvalue);

    //INT
    if (lvalue_i1 && lvalue_i2 && rvalue_i1 && rvalue_i2)
    {
        int consl1 = lvalue_i1->get_value();
        int consr1 = rvalue_i1->get_value();
        int consl2 = lvalue_i2->get_value();
        int consr2 = rvalue_i2->get_value();
        if (consl1 == consl2 && consr1 == consr2)
            return true;
        else if (reverse && consl1 == consr2 && consr1 == consl2)
            return true;
        else
            return false;
    }
    else if (lvalue_i1 && lvalue_i2)
    {
        int cons1 = lvalue_i1->get_value();
        int cons2 = lvalue_i2->get_value();
        if (cons1 == cons2 && e1.rvalue == e2.rvalue)
            return true;
        else
            return false;
    }
    else if (rvalue_i1 && rvalue_i2)
    {
        int cons1 = rvalue_i1->get_value();
        int cons2 = rvalue_i2->get_value();
        if (cons1 == cons2 && e1.lvalue == e2.lvalue)
            return true;
        else
            return false;
    }
    else if (reverse && lvalue_i1 && rvalue_i2)
    {
        int cons1 = lvalue_i1->get_value();
        int cons2 = rvalue_i2->get_value();
        if (cons1 == cons2 && e1.rvalue == e2.lvalue)
            return true;
        else
            return false;
    }

    //FLOAT
    if (lvalue_f1 && lvalue_f2 && rvalue_f1 && rvalue_f2)
    {
        float consl1 = lvalue_f1->get_value();
        float consr1 = rvalue_f1->get_value();
        float consl2 = lvalue_f2->get_value();
        float consr2 = rvalue_f2->get_value();
        if (consl1 == consl2 && consr1 == consr2)
            return true;
        else if (reverse && consl1 == consr2 && consr1 == consl2)
            return true;
        else
            return false;
    }
    else if (lvalue_f1 && lvalue_f2)
    {
        float cons1 = lvalue_f1->get_value();
        float cons2 = lvalue_f2->get_value();
        if (cons1 == cons2 && e1.rvalue == e2.rvalue)
            return true;
        else
            return false;
    }
    else if (rvalue_f1 && rvalue_f2)
    {
        float cons1 = rvalue_f1->get_value();
        float cons2 = rvalue_f2->get_value();
        if (cons1 == cons2 && e1.lvalue == e2.lvalue)
            return true;
        else
            return false;
    }
    else if (reverse && lvalue_f1 && rvalue_f2)
    {
        float cons1 = lvalue_f1->get_value();
        float cons2 = rvalue_f2->get_value();
        if (cons1 == cons2 && e1.rvalue == e2.lvalue)
            return true;
        else
            return false;
    }

    return false;
}

bool ComSubExprEli::CmpGepExpr(struct Expr e1, struct Expr e2)
{
    if (e1.op != e2.op)
        return false;

    if (e1.index.size() != e2.index.size())
        return false;

    for (int i = 0; i < e1.index.size(); i++)
    {
        auto cons1 = dynamic_cast<ConstantInt *>(e1.index[i]);
        auto cons2 = dynamic_cast<ConstantInt *>(e2.index[i]);
        //为常量
        if (cons1 && cons2)
        {
            if (cons1->get_value() != cons2->get_value())
                return false;
        }
        //不是常量
        else if (!cons1 && !cons2)
        {
            if ((e1.index[i] != e2.index[i]))
                return false;
        }
        else
            return false;
    }

    return true;
}

bool ComSubExprEli::CmpSiFpExpr(struct Expr e1, struct Expr e2)
{
    if (e1.op != e2.op)
        return false;

    auto cons1 = dynamic_cast<ConstantInt *>(e1.lvalue);
    auto cons2 = dynamic_cast<ConstantInt *>(e2.lvalue);
    //为常量
    if (cons1 && cons2)
    {
        if (cons1->get_value() != cons2->get_value())
            return false;
        else
            return true;
    }
    //不是常量
    else if (!cons1 && !cons2)
    {
        if ((e1.lvalue != e2.lvalue))
            return false;
        else
            return true;
    }
    else
        return false;
}

void ComSubExprEli::GetAllExpr(Function *func)
{
    //求出所有表达式，存在ALL里
    for (auto bb : func->get_basic_blocks())
    {
        //遍历每一条指令
        for (auto instr : bb->get_instructions())
        {
            if (instr->is_add() || instr->is_sub() ||
                instr->is_mul() || instr->is_div() ||
                instr->is_rem() || instr->is_fadd() ||
                instr->is_fsub() || instr->is_fmul() ||
                instr->is_fdiv() || instr->is_cmp() ||
                instr->is_fcmp())
            {
                struct Expr tmp;
                tmp.lvalue = instr->get_operand(0);
                tmp.rvalue = instr->get_operand(1);
                tmp.op = instr->get_instr_type();
                if (instr->is_cmp() || instr->is_fcmp())
                    tmp.cmpop = dynamic_cast<CmpInst *>(instr)->get_cmp_op();

                bool flag = true;
                for (auto v : ALL)
                {
                    if (CmpBinaryExpr(tmp, v))
                    {
                        flag = false;
                        break;
                    }
                }
                if (flag)
                {
                    tmp.expr_num = index++;
                    ALL.push_back(tmp);
                }
            }
            else if (instr->is_gep())
            {
                std::vector<Value *> idx;
                for (int i = 0; i < instr->get_num_operand(); i++)
                {
                    idx.push_back(instr->get_operand(i));
                }
                struct Expr tmp;
                tmp.lvalue = NULL;
                tmp.rvalue = NULL;
                tmp.index = idx;
                tmp.op = instr->get_instr_type();

                bool flag = true;
                for (auto v : ALL)
                {
                    if (CmpGepExpr(tmp, v))
                    {
                        flag = false;
                        break;
                    }
                }
                if (flag)
                {
                    tmp.expr_num = index++;
                    ALL.push_back(tmp);
                }
            }
            else if (instr->is_sitofp() || instr->is_fptosi())
            {
                struct Expr tmp;
                tmp.lvalue = instr->get_operand(0);
                tmp.rvalue = NULL;
                tmp.op = instr->get_instr_type();

                bool flag = true;
                for (auto v : ALL)
                {
                    if (CmpSiFpExpr(tmp, v))
                    {
                        flag = false;
                        break;
                    }
                }
                if (flag)
                {
                    tmp.expr_num = index++;
                    ALL.push_back(tmp);
                }
            }
        }
    }
#ifdef DEBUG
    printf("total num of expr: %d\n", index);
#endif
    return;
}

void ComSubExprEli::GetAvailExpr(Function *func)
{
#ifdef DEBUG
    printf("\ngen:\n");
#endif
    int num = ALL.size();
    //对每一个基本块，求出gen[](SSA中kill始终为空集)
    for (auto bb : func->get_basic_blocks())
    {
        std::vector<bool> v1(num);

        //遍历每一条指令
        for (auto instr : bb->get_instructions())
        {
            if (instr->is_add() || instr->is_sub() ||
                instr->is_mul() || instr->is_div() ||
                instr->is_rem() || instr->is_fadd() ||
                instr->is_fsub() || instr->is_fmul() ||
                instr->is_fdiv() || instr->is_cmp() ||
                instr->is_fcmp())
            {
                struct Expr tmp;
                tmp.lvalue = instr->get_operand(0);
                tmp.rvalue = instr->get_operand(1);
                tmp.op = instr->get_instr_type();
                if (instr->is_cmp() || instr->is_fcmp())
                    tmp.cmpop = dynamic_cast<CmpInst *>(instr)->get_cmp_op();

                for (auto v : ALL)
                {
                    if (CmpBinaryExpr(tmp, v))
                    {
                        v1[v.expr_num] = true;
                        break;
                    }
                }
            }
            else if (instr->is_gep())
            {
                std::vector<Value *> idx;
                for (int i = 0; i < instr->get_num_operand(); i++)
                {
                    idx.push_back(instr->get_operand(i));
                }
                struct Expr tmp;
                tmp.lvalue = NULL;
                tmp.rvalue = NULL;
                tmp.index = idx;
                tmp.op = instr->get_instr_type();

                for (auto v : ALL)
                {
                    if (CmpGepExpr(tmp, v))
                    {
                        v1[v.expr_num] = true;
                        break;
                    }
                }
            }
            else if (instr->is_sitofp() || instr->is_fptosi())
            {
                struct Expr tmp;
                tmp.lvalue = instr->get_operand(0);
                tmp.rvalue = NULL;
                tmp.op = instr->get_instr_type();

                for (auto v : ALL)
                {
                    if (CmpSiFpExpr(tmp, v))
                    {
                        v1[v.expr_num] = true;
                        break;
                    }
                }
            }
        }
        gen.insert({bb, v1});

#ifdef DEBUG
        //输出gen
        printf("%s: \t", bb->get_name().c_str());
        for (int i = 0; i < num; i++)
        {
            if (gen[bb][i])
                printf("%d", 1);
            else
                printf("%d", 0);
        }
        printf("\n");
#endif

        std::vector<bool> v2(num);
        //非label_entry的IN[]初始化为全1
        if (strcmp(bb->get_name().c_str(), "label_entry"))
            for (int i = 0; i < num; i++)
                v2[i] = true;
        IN.insert({bb, v2});

        std::vector<bool> v3(num);
        //非label_entry的OUT[]初始化为全1
        if (strcmp(bb->get_name().c_str(), "label_entry"))
            for (int i = 0; i < num; i++)
                v3[i] = true;
        OUT.insert({bb, v3});
    }

    //迭代
    bool flag = true;
    int iter = 1;
    while (flag)
    {
        flag = false;
        for (auto bb : func->get_basic_blocks())
        {
            //bb的所有前驱的OUT取交集
            for (auto prevbb : bb->get_pre_basic_blocks())
            {
                for (int i = 0; i < num; i++)
                    IN[bb][i] = IN[bb][i] & OUT[prevbb][i];
            }
            //gen与IN求并集(kill始终为空)
            for (int i = 0; i < num; i++)
            {
                auto temp = gen[bb][i] | IN[bb][i];
                //如果发生变化，flag=true
                if (temp != OUT[bb][i])
                {
                    flag = true;
                    OUT[bb][i] = temp;
                }
            }
        }
    }

#ifdef DEBUG
    printf("\nIN:\n");
    for (auto bb : func->get_basic_blocks())
    {
        printf("%s: \t", bb->get_name().c_str());
        for (int i = 0; i < num; i++)
        {
            if (IN[bb][i])
                printf("%d", 1);
            else
                printf("%d", 0);
        }
        printf("\n");
    }
    printf("\nOUT:\n");
    for (auto bb : func->get_basic_blocks())
    {
        printf("%s: \t", bb->get_name().c_str());
        for (int i = 0; i < num; i++)
        {
            if (OUT[bb][i])
                printf("%d", 1);
            else
                printf("%d", 0);
        }
        printf("\n");
    }
#endif
}

std::vector<BasicBlock *> _visited;
void ComSubExprEli::DelComSubExpr(Function *func)
{
    //遍历所有基本块
    for (auto bb : func->get_basic_blocks())
    {
        std::map<int, Value *> expr_list; //处理基本块内的公共子表达式删除
        //遍历每一条指令
        for (auto instr : bb->get_instructions())
        {
            if (instr->is_add() || instr->is_sub() ||
                instr->is_mul() || instr->is_div() ||
                instr->is_rem() || instr->is_fadd() ||
                instr->is_fsub() || instr->is_fmul() ||
                instr->is_fdiv() || instr->is_cmp() ||
                instr->is_fcmp())
            {
                struct Expr tmp;
                tmp.lvalue = instr->get_operand(0);
                tmp.rvalue = instr->get_operand(1);
                tmp.op = instr->get_instr_type();
                if (instr->is_cmp() || instr->is_fcmp())
                    tmp.cmpop = dynamic_cast<CmpInst *>(instr)->get_cmp_op();

                int i = index; //i=index表明未找到
                for (auto v : ALL)
                {
                    if (CmpBinaryExpr(tmp, v))
                    {
                        i = v.expr_num;
                        tmp.expr_num = i;
                        break;
                    }
                }
#ifdef DEBUG
                printf("%d: \n", i);
#endif
                //如果在该点此表达式可用
                if (i != index && IN[bb][i])
                {
                    _visited.clear();
                    Value *target = FindExpr(bb, tmp);
                    instr->replace_all_use_with(target);
                    delete_list.insert({instr, bb});
                }
                else
                {
                    auto iter = expr_list.find(i);
                    //在该基本块前面出现过此表达式
                    if (iter != expr_list.end())
                    {
#ifdef DEBUG
                        cout << instr->print() << "  ";
                        cout << dynamic_cast<Instruction *>(iter->second)->print() << endl;
#endif
                        instr->replace_all_use_with(iter->second);
                        delete_list.insert({instr, bb});
                    }
                    else
                    {
                        expr_list.insert({i, instr});
                        if (i == index) //新增一个表达式
                            index++;
                    }
                }
            }
            else if (instr->is_gep())
            {
                std::vector<Value *> idx;
                for (int i = 0; i < instr->get_num_operand(); i++)
                {
                    idx.push_back(instr->get_operand(i));
                }
                struct Expr tmp;
                tmp.lvalue = NULL;
                tmp.rvalue = NULL;
                tmp.index = idx;
                tmp.op = instr->get_instr_type();
                int i = index; //i=index表明未找到
                for (auto v : ALL)
                {
                    if (CmpGepExpr(tmp, v))
                    {
                        i = v.expr_num;
                        tmp.expr_num = i;
                        break;
                    }
                }
#ifdef DEBUG
                printf("%d: \n", i);
#endif
                //如果在该点此表达式可用
                if (i != index && IN[bb][i])
                {
                    _visited.clear();
                    Value *target = FindExpr(bb, tmp);
                    instr->replace_all_use_with(target);
                    delete_list.insert({instr, bb});
                }
                else
                {
                    auto iter = expr_list.find(i);
                    //在该基本块前面出现过此表达式
                    if (iter != expr_list.end())
                    {
#ifdef DEBUG
                        cout << instr->print() << "  ";
                        cout << dynamic_cast<Instruction *>(iter->second)->print() << endl;
#endif
                        instr->replace_all_use_with(iter->second);
                        delete_list.insert({instr, bb});
                    }
                    else
                    {
                        expr_list.insert({i, instr});
                        if (i == index) //新增一个表达式
                            index++;
                    }
                }
            }
            else if (instr->is_sitofp() || instr->is_fptosi())
            {
                struct Expr tmp;
                tmp.lvalue = instr->get_operand(0);
                tmp.rvalue = NULL;
                tmp.op = instr->get_instr_type();
                int i = index; //i=index表明未找到
                for (auto v : ALL)
                {
                    if (CmpSiFpExpr(tmp, v))
                    {
                        i = v.expr_num;
                        tmp.expr_num = i;
                        break;
                    }
                }
#ifdef DEBUG
                printf("%d: \n", i);
#endif
                //如果在该点此表达式可用
                if (i != index && IN[bb][i])
                {
                    _visited.clear();
                    Value *target = FindExpr(bb, tmp);
                    instr->replace_all_use_with(target);
                    delete_list.insert({instr, bb});
                }
                else
                {
                    auto iter = expr_list.find(i);
                    //在该基本块前面出现过此表达式
                    if (iter != expr_list.end())
                    {
#ifdef DEBUG
                        cout << instr->print() << "  ";
                        cout << dynamic_cast<Instruction *>(iter->second)->print() << endl;
#endif
                        instr->replace_all_use_with(iter->second);
                        delete_list.insert({instr, bb});
                    }
                    else
                    {
                        expr_list.insert({i, instr});
                        if (i == index) //新增一个表达式
                            index++;
                    }
                }
            }
        }
    }
}

Value *ComSubExprEli::FindExpr(BasicBlock *bb, struct Expr target)
{
    std::map<Value *, BasicBlock *> expr_list;
    int expr_index = target.expr_num;
    _visited.push_back(bb); //标记为已经遍历过

    //遍历每一个前驱基本块
    for (auto prevbb : bb->get_pre_basic_blocks())
    {
        //避免循环
        if (find(_visited.begin(), _visited.end(), prevbb) != _visited.end())
            continue;

        //若该基本块首次计算target
        if (gen[prevbb][expr_index] && !IN[prevbb][expr_index])
        {
            //寻找计算target的指令
            for (auto instr : prevbb->get_instructions())
            {
                if (target.op == instr->get_instr_type())
                {
                    if (instr->is_add() || instr->is_sub() ||
                        instr->is_mul() || instr->is_div() ||
                        instr->is_rem() || instr->is_fadd() ||
                        instr->is_fsub() || instr->is_fmul() ||
                        instr->is_fdiv() || instr->is_cmp() ||
                        instr->is_fcmp())
                    {
                        struct Expr tmp;
                        tmp.lvalue = instr->get_operand(0);
                        tmp.rvalue = instr->get_operand(1);
                        tmp.op = instr->get_instr_type();
                        if (instr->is_cmp() || instr->is_fcmp())
                            tmp.cmpop = dynamic_cast<CmpInst *>(instr)->get_cmp_op();

                        if (CmpBinaryExpr(target, tmp))
                        {
                            expr_list.insert({instr, prevbb});
                            break;
                        }
                    }
                    else if (instr->is_gep())
                    {
                        std::vector<Value *> idx;
                        for (int i = 0; i < instr->get_num_operand(); i++)
                        {
                            idx.push_back(instr->get_operand(i));
                        }
                        struct Expr tmp;
                        tmp.lvalue = NULL;
                        tmp.rvalue = NULL;
                        tmp.index = idx;
                        tmp.op = instr->get_instr_type();

                        if (CmpGepExpr(tmp, target))
                        {
                            expr_list.insert({instr, prevbb});
                            break;
                        }
                    }
                    else if (instr->is_sitofp() || instr->is_fptosi())
                    {
                        struct Expr tmp;
                        tmp.lvalue = instr->get_operand(0);
                        tmp.rvalue = NULL;
                        tmp.op = instr->get_instr_type();

                        if (CmpSiFpExpr(tmp, target))
                        {
                            expr_list.insert({instr, prevbb});
                            break;
                        }
                    }
                }
            }
            _visited.push_back(prevbb); //标记为已经遍历过
        }
        //否则，继续向上寻找
        else
        {
            Value *tmp = FindExpr(prevbb, target);
            if (tmp)
                expr_list.insert({tmp, prevbb});
        }
    }

    if (expr_list.size() == 0)
        return nullptr;
    else if (expr_list.size() == 1)
        return expr_list.begin()->first;
    //需要发射phi指令
    else
    {
        Type *ty = expr_list.begin()->first->get_type();
        auto newphi = PhiInst::create_phi(ty, bb);
        for (auto iter = expr_list.begin(); iter != expr_list.end(); iter++)
        {
            newphi->add_phi_pair_operand(iter->first, iter->second);
        }
        bb->add_instr_begin(newphi);
        return newphi;
    }
}

void ComSubExprEli::DelUnusedInst(Function *func)
{
#ifdef DEBUG
    cout << "\n----delete ops----" << endl;
#endif

    for (auto iter = delete_list.begin(); iter != delete_list.end(); iter++)
    {
#ifdef DEBUG
        cout << iter->second->get_name() << ":" << endl;
        cout << "\t" << iter->first->get_name() << endl;
#endif
        iter->second->delete_instr(iter->first);
    }
    return;
}
