#include "DeadCodeEli.h"
#include "RDominateTree.h"
#include "Instruction.h"
#include <string.h>
using namespace std;

//#define DEBUG

set<Instruction *> workList;            //处理指令
map<Instruction *, bool> alreadyworked; //记录处理的指令，防止重复处理
set<Function *> biggerWorkList;         //处理更大范围的（函数等）
map<Instruction *, bool> markInst;
map<BasicBlock *, bool> markBB;
map<Function *, bool> markFunc;
map<Function *, vector<Instruction *>> funStoreList;
map<Function *, vector<Instruction *>> funReturnList;
map<Function *, vector<Instruction *>> funCallList;
map<Function *, vector<Instruction *>> funInitMarkList;
map<Function *, bool> funLoad;
Function *mainFunc;

void DeadCodeEli::execute()
{

    RDominateTree r_dom_tree(module);
    r_dom_tree.execute();
    preparemark();
    mark();
    sweep();
    deleteunusedbb();
    for (auto fun : module->get_functions())
    {
        if (fun->get_basic_blocks().empty())
            continue;
        else
            DeleteUnusedJump(fun);
    }
}

void DeadCodeEli::preparemark()
{
    for (auto &func : this->module->get_functions())
    {
        func_ = func;
        if (func->get_name() == "main")
            mainFunc = func;

#ifdef DEBUG
        cout << "now in function " << func->get_name() << "-----------------" << endl;
#endif
        if (func->get_basic_blocks().empty())
            continue;
        else
        {
            for (auto bb : func->get_basic_blocks()) //遍历每个函数，找return和store和load
            {
                for (auto instr : bb->get_instructions())
                {
                    if (instr->is_store())
                        funStoreList[func].push_back(instr);
                    if (instr->is_ret())
                    {
                        funReturnList[func].push_back(instr);
                        funInitMarkList[func].push_back(instr);
                    }
                    if (instr->is_load())
                        funLoad[func] = true;
                    if (instr->is_call())
                    {
                        funCallList[func].push_back(instr);
                    }
                }
            }
        }
    }
    biggerWorkList.insert(mainFunc);
    while (!biggerWorkList.empty())
    {
        auto it = biggerWorkList.begin();
        auto f = *it;
        biggerWorkList.erase(f);
#ifdef DEBUG
        cout << "处理函数 " << f->get_name() << endl;
#endif
        if (!markFunc[f])
        {
            markFunc[f] = true;
            for (auto calling : funCallList[f]) //调用的函数store吗
            {
                auto called = (Function *)(calling->get_operand(0));

                biggerWorkList.insert(called);
                funInitMarkList[f].push_back(calling);
            }
            for (auto storing : funStoreList[f]) //处理自己的store
            {
                funInitMarkList[f].push_back(storing);
            }
        }
    }
}

void DeadCodeEli::mark()
{
#ifdef DEBUG
    cout << "init mark" << endl;
#endif
    for (auto initMark : funInitMarkList[mainFunc])
    {
        workList.insert(initMark);
        markInst[initMark] = true;
        markBB[initMark->get_parent()] = true;
#ifdef DEBUG
        cout << initMark->print() << endl;
#endif
    }
    while (!workList.empty())
    {
        auto it = workList.begin();
        auto i = *it;
        alreadyworked[i] = true;
        workList.erase(i);
#ifdef DEBUG
        cout << "processing " << i->get_name() << " " << i->print() << endl;
#endif

        for (size_t opi = 0; opi < i->get_operands().size(); opi++)
        {
            auto op = i->get_operands()[opi];
#ifdef DEBUG
            cout << "processing op" << op->get_name() << " | " << op->print() << " | " << op->get_type()->print() << " | " << op->get_type()->print() << endl;
#endif
            if ((op->get_type()->is_array_type() ||
                 op->get_type()->is_integer_type() ||
                 op->get_type()->is_float_type() ||
                 op->get_type()->is_pointer_type()) &&
                (dynamic_cast<Instruction *>(op))) //处理一般参数
            {

                markInst[(Instruction *)op] = true;
                markBB[((Instruction *)op)->get_parent()] = true;
                if (!alreadyworked[(Instruction *)op])
                    workList.insert((Instruction *)op);
#ifdef DEBUG
                cout << ((Instruction *)op)->get_parent()->get_name() << " marked3" << endl;
                cout << op->get_name() << " marked" << endl;
#endif
            }
            else if (dynamic_cast<Function *>(op)) //如果是调用函数
            {
                auto calledFunc = (Function *)op;
                markFunc[calledFunc] = true;
                for (auto newItem : funInitMarkList[calledFunc])
                {
                    markInst[newItem] = true;
                    markBB[newItem->get_parent()] = true;
                    if (!alreadyworked[newItem])
                        workList.insert(newItem);
#ifdef DEBUG
                    cout << newItem->get_parent()->get_name() << " marked3" << endl;
#endif
                }
#ifdef DEBUG
                cout << op->get_name() << " marked" << endl;
#endif
                funInitMarkList[calledFunc].clear(); //清空以免多次重复分析这个函数
            }
        }
        if (i->is_phi())
        {
            for (size_t opi = 0; opi < i->get_operands().size() / 2; opi++)
            {
                auto val = i->get_operands()[2 * opi];
                auto label = i->get_operands()[2 * opi + 1];
                if (dynamic_cast<Constant *>(val) || dynamic_cast<Instruction *>(val) || dynamic_cast<Argument *>(val))
                {
                    markBB[(BasicBlock *)label] = true;
#ifdef DEBUG
                    cout << label->get_name() << " marked2" << endl;
#endif
                    for (auto bb : ((BasicBlock *)label)->get_rdom_frontier())
                    {
                        for (auto j : bb->get_instructions())
                        {
                            if (j->is_br())
                            {
                                markInst[j] = true;
#ifdef DEBUG
                                cout << j->print() << " added to marklist" << endl;
#endif
                                markBB[j->get_parent()] = true;
                                if (!alreadyworked[j])
                                    workList.insert(j);
#ifdef DEBUG
                                cout << j->get_parent()->get_name() << " marked4" << endl;
#endif
                                break;
                            }
                        }
                    }
                }
            }
        }
        for (auto bb : i->get_parent()->get_rdom_frontier())
        {
            for (auto j : bb->get_instructions())
            {
                if (j->is_br())
                {

                    markInst[j] = true;
#ifdef DEBUG
                    cout << j->print() << " added to marklist" << endl;
#endif
                    markBB[j->get_parent()] = true;
                    if (!alreadyworked[j])
                        workList.insert(j);
#ifdef DEBUG
                    cout << j->get_parent()->get_name() << " marked4" << endl;
#endif
                }
            }
        }
    }

#ifdef DEBUG
    cout << "\nmarked bb:" << endl;
    for (auto bb : markBB)
    {
        cout << bb.first->get_name() << endl;
    }
#endif
}

void DeadCodeEli::sweep()
{
#ifdef DEBUG
    cout << "now sweeping- - - - - - - - -" << endl;
#endif
    // now delete unused funcion
    auto allFunc = this->module->get_functions();
    for (auto func : allFunc)
    {
        if (markFunc[func] == false)
            this->module->get_functions().remove(func);
    }
    // now sweep
    for (auto &func : this->module->get_functions())
    {
        func_ = func;
        if (func->get_basic_blocks().empty())
        {
            continue;
        }
        else
        {
            auto bbBackup = func->get_basic_blocks();
            for (auto bb : bbBackup)
            {
#ifdef DEBUG
                cout << "now in basicBlock " << bb->get_name() << endl;
#endif
                if (markBB[bb] == false && 1 + 1 == 0)
                {
                    func->get_basic_blocks().remove(bb);
#ifdef DEBUG
                    cout << "completely deleted!" << endl;
#endif
                    continue;
                }
                auto insBackup = bb->get_instructions();
                for (auto ins : insBackup)
                {
#ifdef DEBUG
                    cout << "processing " << ins->get_name() << " " << ins->print() << "...";
#endif
                    if (!markInst[ins])
                    {
#ifdef DEBUG
                        cout << "not marked" << endl;
#endif
                        if (ins->is_br())
                        {
                            if (dynamic_cast<BranchInst *>(ins)->is_cond_br())
                            {
                                BasicBlock *toBB;
                                map<BasicBlock *, set<Value *>> lastoftoBB;
                                // find tobb
                                auto thePostDominators = bb->get_rdoms();
                                // old findtobb
                                map<BasicBlock *, bool> visited;
                                list<BasicBlock *> buffer;
                                for (auto next : ins->get_parent()->get_succ_basic_blocks())
                                {
                                    buffer.push_back(next);
                                }
                                bool lock = false;
                                while (!buffer.empty())
                                {
                                    auto thisOne = buffer.front();
                                    buffer.remove(thisOne);
                                    if (!visited[thisOne]) //说明没处理过
                                    {
                                        visited[thisOne] = true;
                                        if (thePostDominators.find(thisOne) != thePostDominators.end())
                                        {
                                            if (!lock)
                                            {
                                                toBB = thisOne; //找到了，锁定！不break是为了找全toBB的本路径last
                                                lock = true;
                                            }
                                        }
                                        for (auto next : thisOne->get_succ_basic_blocks())
                                        {
                                            lastoftoBB[next].insert(thisOne);
#ifdef DEBUG
                                            cout << "lastoftoBB " << next->get_name() << " " << thisOne->get_name() << endl;
#endif
                                            buffer.push_back(next);
                                        }
                                    }
                                }
                                // find tobb done
                                auto succBackup = bb->get_succ_basic_blocks();
                                for (auto succ : succBackup)
                                {
                                    succ->remove_pre_basic_block(bb);
                                    bb->remove_succ_basic_block(succ);
                                }
                                bb->add_succ_basic_block(toBB);
                                BranchInst::create_br(toBB, bb);
                                for (auto maybephi : toBB->get_instructions())
                                {
                                    if (maybephi->is_phi())
                                    {
                                        vector<Value *> newOprands;
                                        set<Value *> lastbb; //去重用的，上一个基本快
                                        for (size_t i = 0; i < maybephi->get_operands().size(); i++)
                                        {
                                            auto thisop = maybephi->get_operands()[i];
                                            if (i % 2) //是标签，可能要被替换
                                            {
#ifdef DEBUG
                                                cout << "是标签，可能要被替换 " << thisop->get_name() << endl;
#endif
                                                Value *replacedop;
                                                if (lastoftoBB[toBB].find(thisop) != lastoftoBB[toBB].end())
                                                {
                                                    replacedop = bb;
#ifdef DEBUG
                                                    cout << "真的被替换了 " << replacedop->get_name() << endl;
#endif
                                                }
                                                else
                                                    replacedop = maybephi->get_operands()[i];

                                                if (lastbb.find(replacedop) == lastbb.end())
                                                {
                                                    lastbb.insert(replacedop);
                                                }
                                                else
                                                {
                                                    i++;
                                                    continue;
                                                }
                                                newOprands.push_back(replacedop);
#ifdef DEBUG
                                                cout << "插入标签" << replacedop->get_name() << endl;
#endif
                                            }
                                            else
                                            {
                                                newOprands.push_back(maybephi->get_operands()[i]);
                                            }
                                        }
                                        maybephi->remove_operands(0, maybephi->get_operands().size() - 1);
#ifdef DEBUG
                                        cout << "wow" << maybephi->get_num_operand() << endl;
#endif
                                        for (auto op : newOprands)
                                        {
                                            maybephi->add_operand(op);
                                        }
                                    }
                                }
                                bb->delete_instr(ins);
                            }
                        }
                        else
                            bb->delete_instr(ins);
                    }
#ifdef DEBUG
                    cout << "marked" << endl;
#endif
                }
            }
        }
    }
}

void DeadCodeEli::deleteunusedbb()
{
    // now delete unused bb
    for (auto &func : this->module->get_functions())
    {
        if (func->get_basic_blocks().empty())
            continue;
        map<BasicBlock *, bool> reachable;
        list<BasicBlock *> buffer;
        buffer.push_back(func->get_entry_block());
        while (!buffer.empty())
        {
            auto thisOne = buffer.front();
            buffer.remove(thisOne);
            if (!reachable[thisOne]) //说明没处理过
            {
                reachable[thisOne] = true;
                for (auto next : thisOne->get_succ_basic_blocks())
                {
                    buffer.push_back(next);
                }
            }
        }
        auto allBB = func->get_basic_blocks();
        for (auto thisOne : allBB)
        {
            if (!reachable[thisOne])
            {
                for (auto succ : thisOne->get_succ_basic_blocks())
                    succ->remove_pre_basic_block(thisOne);

                func->get_basic_blocks().remove(thisOne);
            }
        }
    }
}

void DeadCodeEli::DeleteUnusedJump(Function *func)
{
#ifdef DEBUG
    cout << func->get_name() << "\n----Delete Unused Jump----" << endl;
#endif
    std::list<BasicBlock *> delete_block_list;
    for (auto bb : func->get_basic_blocks())
    {
#ifdef DEBUG
        cout << "\t" << bb->get_name() << " has " << bb->get_num_of_instr() << " instructions:" << endl;
        for (auto instr : bb->get_instructions())
            cout << "\t\t" << instr->get_instr_type();
        cout << endl;
#endif
        //除entry、ret外，若一个基本块内只有一条br指令，可优化
        if (strcmp(bb->get_name().c_str(), "label_entry") &&
            strcmp(bb->get_name().c_str(), "label_ret") &&
            bb->get_num_of_instr() == 1)
        {
            //后继基本块只有一个，意味着是无条件跳转指令
            if (bb->get_succ_basic_blocks().size() == 1)
            {
                //有多个前驱，不优化
                if (bb->get_pre_basic_blocks().size() > 1)
                    continue;
                auto pre_bb = bb->get_pre_basic_blocks().front();
                auto pre_br = pre_bb->get_terminator();

                auto succ_bb = bb->get_succ_basic_blocks().front();
                //后继有多个前驱并且前驱有多个后继，不优化
                if (succ_bb->get_pre_basic_blocks().size() > 1 &&
                    dynamic_cast<BranchInst *>(pre_br)->is_cond_br())
                    continue;

                //修改前驱基本块的分支目标地址
                if (dynamic_cast<BranchInst *>(pre_br)->is_cond_br())
                {
                    if (pre_br->get_operand(1) == bb)
                        pre_br->set_operand(1, succ_bb);
                    else
                        pre_br->set_operand(2, succ_bb);
                }
                else
                    pre_br->set_operand(0, succ_bb);

                succ_bb->remove_pre_basic_block(bb);
                succ_bb->add_pre_basic_block(pre_bb);
                pre_bb->remove_succ_basic_block(bb);
                pre_bb->add_succ_basic_block(succ_bb);

                //处理后继块的phi指令
                std::vector<Instruction *> _delete_list;
                for (auto instr : succ_bb->get_instructions())
                {
                    if (instr->is_phi())
                    {
                        for (size_t i = 1; i < instr->get_num_operand(); i = i + 2)
                        {
                            if (instr->get_operand(i) == bb)
                            {
                                //删除包含bb的部分
                                Value *tmp = instr->get_operand(i - 1);
                                instr->remove_operands(i - 1, i);
                                //更新phi的参数
                                instr->add_operand(tmp);
                                instr->add_operand(pre_bb);
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
                //删除多余phi指令
                for (auto instr : _delete_list)
                    succ_bb->delete_instr(instr);

                delete_block_list.push_back(bb);
            }
            //后继基本块有多个，意味着是条件跳转指令
            else
            {
                if (bb->get_pre_basic_blocks().size() > 1)
                    continue;

                auto pre_bb = bb->get_pre_basic_blocks().front();
                auto pre_br = pre_bb->get_terminator();
                if (dynamic_cast<BranchInst *>(pre_br)->is_cond_br())
                    continue;

                pre_bb->delete_instr(pre_br);
                pre_bb->add_instruction(bb->get_terminator());

                pre_bb->remove_succ_basic_block(bb);
                for (auto succ_bb : bb->get_succ_basic_blocks())
                {
                    succ_bb->remove_pre_basic_block(bb);
                    pre_bb->add_succ_basic_block(succ_bb);
                    succ_bb->add_pre_basic_block(pre_bb);
                }

                //处理后继块的phi指令
                for (auto succ_bb : bb->get_succ_basic_blocks())
                {
                    for (auto instr : succ_bb->get_instructions())
                    {
                        if (instr->is_phi())
                        {
                            for (size_t i = 1; i < instr->get_num_operand(); i = i + 2)
                            {
                                if (instr->get_operand(i) == bb)
                                {
                                    //删除包含bb的部分
                                    Value *tmp = instr->get_operand(i - 1);
                                    instr->remove_operands(i - 1, i);
                                    //更新phi的参数
                                    instr->add_operand(tmp);
                                    instr->add_operand(pre_bb);
                                    break;
                                }
                            }
                        }
                    }
                }
                delete_block_list.push_back(bb);
            }
        }
    }
    //删除所有无用的基本块
    for (auto bb : delete_block_list)
    {
        bb->erase_from_parent();
    }
    return;
}
