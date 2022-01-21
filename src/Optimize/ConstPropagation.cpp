#include "ConstPropagation.h"
#include <string.h>
#include <algorithm>
using namespace std;

//#define DEBUG

ConstantInt *ConstFolder::computeINT(Instruction::OpID op, ConstantInt *value1, ConstantInt *value2)
{
    int const_value1 = value1->get_value();
    int const_value2 = value2->get_value();
    switch (op)
    {
    case Instruction::add:
        return ConstantInt::get(const_value1 + const_value2, module_);
        break;
    case Instruction::sub:
        return ConstantInt::get(const_value1 - const_value2, module_);
        break;
    case Instruction::mul:
        return ConstantInt::get(const_value1 * const_value2, module_);
        break;
    case Instruction::sdiv:
        return ConstantInt::get((int)(const_value1 / const_value2), module_);
        break;
    case Instruction::srem:
        return ConstantInt::get(const_value1 % const_value2, module_);
        break;
    default:
        return nullptr;
        break;
    }
}

ConstantFloat *ConstFolder::computeFloat(Instruction::OpID op, ConstantFloat *value1, ConstantFloat *value2)
{

    float const_value1 = value1->get_value();
    float const_value2 = value2->get_value();
    switch (op)
    {
    case Instruction::fadd:
        return ConstantFloat::get(const_value1 + const_value2, module_);
        break;
    case Instruction::fsub:
        return ConstantFloat::get(const_value1 - const_value2, module_);
        break;
    case Instruction::fmul:
        return ConstantFloat::get(const_value1 * const_value2, module_);
        break;
    case Instruction::fdiv:
        return ConstantFloat::get(const_value1 / const_value2, module_);
        break;
    default:
        return nullptr;
        break;
    }
}

ConstantInt *ConstFolder::computeCMP(CmpInst::CmpOp op, ConstantInt *value1, ConstantInt *value2)
{
    int lhs = value1->get_value();
    int rhs = value2->get_value();
    switch (op)
    {
    case CmpInst::EQ:
        return ConstantInt::get((lhs == rhs), module_);
        break;
    case CmpInst::NE:
        return ConstantInt::get((lhs != rhs), module_);
        break;
    case CmpInst::GT:
        return ConstantInt::get((lhs > rhs), module_);
        break;
    case CmpInst::GE:
        return ConstantInt::get((lhs >= rhs), module_);
        break;
    case CmpInst::LE:
        return ConstantInt::get((lhs <= rhs), module_);
        break;
    case CmpInst::LT:
        return ConstantInt::get((lhs < rhs), module_);
        break;
    default:
        return nullptr;
        break;
    }
}

ConstantInt *ConstFolder::computeFCMP(FCmpInst::CmpOp op, ConstantFloat *value1, ConstantFloat *value2)
{
    float lhs = value1->get_value();
    float rhs = value2->get_value();
    switch (op)
    {
    case FCmpInst::EQ:
        return ConstantInt::get((lhs == rhs), module_);
        break;
    case FCmpInst::NE:
        return ConstantInt::get((lhs != rhs), module_);
        break;
    case FCmpInst::GT:
        return ConstantInt::get((lhs > rhs), module_);
        break;
    case FCmpInst::GE:
        return ConstantInt::get((lhs >= rhs), module_);
        break;
    case FCmpInst::LE:
        return ConstantInt::get((lhs <= rhs), module_);
        break;
    case FCmpInst::LT:
        return ConstantInt::get((lhs < rhs), module_);
        break;
    default:
        return nullptr;
        break;
    }
}

// 用来判断value是否为ConstantInt，如果不是则会返回nullptr
ConstantInt *cast_to_const_int(Value *value)
{
    auto const_int_ptr = dynamic_cast<ConstantInt *>(value);
    if (const_int_ptr)
        return const_int_ptr;
    else
        return nullptr;
}

// 用来判断value是否为ConstantFloat，如果不是则会返回nullptr
ConstantFloat *cast_to_const_float(Value *value)
{
    auto const_float_ptr = dynamic_cast<ConstantFloat *>(value);
    if (const_float_ptr)
        return const_float_ptr;
    else
        return nullptr;
}

void ConstPropagation::execute()
{
    module->set_print_name();
    fold = new ConstFolder(module);
    for (auto fun : module->get_functions())
    {
        if (fun->get_basic_blocks().empty())
            continue;
        delete_list.clear();
        global_INT.clear();
        global_Float.clear();
        ConstFold(fun);
        DelUnusedInstr();
        HandleBr(fun);
        DeleteUnusedBB(fun);
    }
}

void ConstPropagation::ConstFold(Function *func)
{
    for (auto bb : func->get_basic_blocks())
    {
        global_INT.clear();
        global_Float.clear();
        for (auto instr : bb->get_instructions())
        {
            if (instr->is_add() ||
                instr->is_sub() ||
                instr->is_mul() ||
                instr->is_div() ||
                instr->is_rem())
            {
                auto i1 = cast_to_const_int(instr->get_operand(0));
                auto i2 = cast_to_const_int(instr->get_operand(1));
                if (i1 && i2)
                {
                    auto fold_const = fold->computeINT(instr->get_instr_type(), i1, i2);
                    instr->replace_all_use_with(fold_const);
                    delete_list.insert({instr, bb});
                }
            }
            else if (instr->is_fadd() ||
                     instr->is_fsub() ||
                     instr->is_fmul() ||
                     instr->is_fdiv())
            {
                auto f1 = cast_to_const_float(instr->get_operand(0));
                auto f2 = cast_to_const_float(instr->get_operand(1));
                if (f1 && f2)
                {
                    auto fold_const = fold->computeFloat(instr->get_instr_type(), f1, f2);
                    instr->replace_all_use_with(fold_const);
                    delete_list.insert({instr, bb});
                }
            }
            else if (instr->is_fptosi())
            {
                auto tmp = cast_to_const_float(instr->get_operand(0));
                if (tmp)
                {
                    auto fold_const = ConstantInt::get((int)(tmp->get_value()), module);
                    instr->replace_all_use_with(fold_const);
                    delete_list.insert({instr, bb});
                }
            }
            else if (instr->is_sitofp())
            {
                auto tmp = cast_to_const_int(instr->get_operand(0));
                if (tmp)
                {
                    auto fold_const = ConstantFloat::get((float)(tmp->get_value()), module);
                    instr->replace_all_use_with(fold_const);
                    delete_list.insert({instr, bb});
                }
            }
            else if (instr->is_cmp())
            {
                auto i1 = cast_to_const_int(instr->get_operand(0));
                auto i2 = cast_to_const_int(instr->get_operand(1));
                if (i1 && i2)
                {
                    auto fold_const = fold->computeCMP(dynamic_cast<CmpInst *>(instr)->get_cmp_op(), i1, i2);
                    instr->replace_all_use_with(fold_const);
                    delete_list.insert({instr, bb});
                }
            }
            else if (instr->is_fcmp())
            {
                auto f1 = cast_to_const_float(instr->get_operand(0));
                auto f2 = cast_to_const_float(instr->get_operand(1));
                if (f1 && f2)
                {
                    auto fold_const = fold->computeFCMP(dynamic_cast<FCmpInst *>(instr)->get_cmp_op(), f1, f2);
                    instr->replace_all_use_with(fold_const);
                    delete_list.insert({instr, bb});
                }
            }
            else if (instr->is_zext())
            {
                auto tmp = cast_to_const_int(instr->get_operand(0));
                if (tmp)
                {
                    auto fold_const = ConstantInt::get((int)(tmp->get_value()), module);
                    instr->replace_all_use_with(fold_const);
                    delete_list.insert({instr, bb});
                }
            }
            else if (instr->is_call())
            {
                global_INT.clear();
                global_Float.clear();
            }
            else if (instr->is_load())
            {
                //处理全局变量为常量时的折叠
                auto global = dynamic_cast<GlobalVariable *>(instr->get_operand(0));
                if (global)
                {
                    auto iterINT = global_INT.find(global);
                    auto iterFloat = global_Float.find(global);

                    if (iterINT != global_INT.end())
                    {
                        instr->replace_all_use_with(iterINT->second);
                        delete_list.insert({instr, bb});
                    }
                    else if (iterFloat != global_Float.end())
                    {
                        instr->replace_all_use_with(iterFloat->second);
                        delete_list.insert({instr, bb});
                    }
                }
            }
            else if (instr->is_store())
            {
                auto lval = instr->get_operand(1);
                auto rval_i = cast_to_const_int(instr->get_operand(0));
                auto rval_f = cast_to_const_float(instr->get_operand(0));

                //store了INT常量
                if (rval_i)
                {
                    auto iter = global_INT.find(lval);
                    if (iter != global_INT.end())
                    {
                        //如果赋值一样，可以删除
                        if (iter->second->get_value() == rval_i->get_value())
                            delete_list.insert({instr, bb});
                        else
                            iter->second = rval_i;
                    }
                    else
                        global_INT.insert({lval, rval_i});
                }
                //store了Float常量
                else if (rval_f)
                {
                    auto iter = global_Float.find(lval);
                    if (iter != global_Float.end())
                    {
                        //如果赋值一样，可以删除
                        if (iter->second->get_value() == rval_f->get_value())
                            delete_list.insert({instr, bb});
                        else
                            iter->second = rval_f;
                    }
                    else
                        global_Float.insert({lval, rval_f});
                }
                //store了变量
                else
                {
                    auto iterINT = global_INT.find(lval);
                    auto iterFloat = global_Float.find(lval);
                    if (iterINT != global_INT.end())
                        global_INT.erase(iterINT);

                    if (iterFloat != global_Float.end())
                        global_Float.erase(iterFloat);
                }
            }
        }
    }
}

void ConstPropagation::DelUnusedInstr()
{
    for (auto iter = delete_list.begin(); iter != delete_list.end(); iter++)
    {
        iter->second->delete_instr(iter->first);
    }
    return;
}

void ConstPropagation::HandlePhi(BasicBlock *bb, BasicBlock *succ_bb)
{
    std::vector<Instruction *> _delete_list;
    for (auto instr : succ_bb->get_instructions())
    {
        if (instr->is_phi())
        {
            for (int i = 1; i < instr->get_num_operand(); i = i + 2)
            {
                if (instr->get_operand(i) == bb)
                {
                    //删除包含bb的部分
                    instr->remove_operands(i - 1, i);
                    break;
                }
            }
            //若只有两个参数，phi指令可删除
            if (instr->get_num_operand() == 2)
            {
                Value *tmp = instr->get_operand(0);
                instr->replace_all_use_with(tmp);
                _delete_list.push_back(instr);
            }
        }
    }
    for (auto instr : _delete_list)
    {
        succ_bb->delete_instr(instr);
    }
    return;
}

void ConstPropagation::HandleBr(Function *func)
{
    for (auto bb : func->get_basic_blocks())
    {
        //获取该基本块的最后一条指令
        auto br = bb->get_terminator();
        if (!br)
            continue;
        if (br->is_br() && dynamic_cast<BranchInst *>(br)->is_cond_br())
        {
            auto cond = cast_to_const_int(br->get_operand(0));
            auto truebb = br->get_operand(1);
            auto falsebb = br->get_operand(2);
            if (!cond)
                continue; //条件表达式不是常量则处理下一个基本块
#ifdef DEBUG
            printf("%s:", bb->get_name().c_str());
            printf("%d\n", cond->get_value());
#endif

            //保留false分支，删除true分支
            if (cond->get_value() == 0)
            {
                bb->delete_instr(br);
                for (auto succ_bb : bb->get_succ_basic_blocks())
                {
                    //所有后继块脱离与bb的联系
                    succ_bb->remove_pre_basic_block(bb);

                    if (succ_bb != falsebb)
                    {
                        //处理后继块中phi指令包含bb的情况
                        HandlePhi(bb, succ_bb);
                    }
                }
                //清空bb的后继
                bb->get_succ_basic_blocks().clear();
                //创建新的分支指令，创建过程会将falsebb与bb链接并且会将指令添加到指令列表中
                BranchInst::create_br(dynamic_cast<BasicBlock *>(falsebb), bb);
            }
            //保留true分支，删除false分支
            else
            {
                bb->delete_instr(br);
                for (auto succ_bb : bb->get_succ_basic_blocks())
                {
                    //所有后继块脱离与bb的联系
                    succ_bb->remove_pre_basic_block(bb);

                    if (succ_bb != truebb)
                    {
                        //处理后继块中phi指令包含bb的情况
                        HandlePhi(bb, succ_bb);
                    }
                }
                //清空bb的后继
                bb->get_succ_basic_blocks().clear();
                //创建新的分支指令，创建过程会将falsebb与bb链接并且会将指令添加到指令列表中
                BranchInst::create_br(dynamic_cast<BasicBlock *>(truebb), bb);
            }
        }
    }
    return;
}

std::vector<BasicBlock *> _marked;
void Mark(BasicBlock *bb)
{
    if (!bb)
        return;

    _marked.push_back(bb);

    for (auto succ_bb : bb->get_succ_basic_blocks())
    {
        if (find(_marked.begin(), _marked.end(), succ_bb) != _marked.end())
            continue;
        else
            Mark(succ_bb);
    }
    return;
}

void ConstPropagation::DeleteUnusedBB(Function *func)
{
    std::list<BasicBlock *> delete_block_list;
    for (auto bb : func->get_basic_blocks())
    {
        //从entry开始DFS
        if (!strcmp(bb->get_name().c_str(), "label_entry"))
        {
            //标记所有可达块
            Mark(bb);
        }
        else
        {
            //如果被标记，则不用删除
            if (find(_marked.begin(), _marked.end(), bb) != _marked.end())
                continue;

            //出现悬空循环
            if (bb->get_pre_basic_blocks().size() == 1)
            {
                auto pre_bb = bb->get_pre_basic_blocks().front();
                {
                    bb->remove_pre_basic_block(pre_bb);
                    pre_bb->remove_succ_basic_block(bb);
                    delete_block_list.push_back(bb);
                    for (auto succ_bb : bb->get_succ_basic_blocks())
                    {
                        //所有后继块脱离与bb的联系
                        succ_bb->remove_pre_basic_block(bb);
                        //处理后继块中phi指令包含bb的情况
                        HandlePhi(bb, succ_bb);
                    }
                    continue;
                }
            }
            //悬空块
            else if (bb->get_pre_basic_blocks().size() == 0)
            {
                delete_block_list.push_back(bb);
                for (auto succ_bb : bb->get_succ_basic_blocks())
                {
                    //所有后继块脱离与bb的联系
                    succ_bb->remove_pre_basic_block(bb);
                    //处理后继块中phi指令包含bb的情况
                    HandlePhi(bb, succ_bb);
                }
                continue;
            }
        }
    }
    //删除块
    for (auto bb : delete_block_list)
    {
        bb->erase_from_parent();
    }
    return;
}