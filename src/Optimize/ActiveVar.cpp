#include "ActiveVar.h"
#include <algorithm>
using namespace std;

//#define DEBUG
#define printout false

void ActiveVar::execute()
{
    for (auto &func : this->module->get_functions())
    {
        if (func->get_basic_blocks().empty())
            continue;
        else
        {
            func_ = func;
#ifdef DEBUG
            cout << "now in function " << func->get_name() << endl;
#endif
            map<BasicBlock *, map<Value *, BasicBlock *>> wherefrom;
            while (true)
            {
                bool goon = false;
                for (BasicBlock *basicBlock : func->get_basic_blocks())
                {
#ifdef DEBUG
                    cout << "now in basicBlock " << basicBlock->get_name() << endl;
#endif
                    set<Value *> lastin;
                    set<Value *> lastout;
                    // in
                    // backup
                    lastin.clear();
                    for (auto tmp : basicBlock->get_live_in())
                    {
                        lastin.insert(tmp);
                    }
                    // backup done
                    basicBlock->get_live_in().clear();
                    set<Value *> defineList;
                    for (auto ins : basicBlock->get_instructions()) // add define
                    {
#ifdef DEBUG
                        cout << "now in ins " << ins->get_name() << ins << endl;

                        cout << ins->get_name() << ":" << ins->get_type()->is_void_type() << ":" << ins->get_type()->print() << ":" << ins->get_type()->is_integer_type() << endl;
                        for (auto eachop : ins->get_operands())
                            cout << "\t" << eachop->get_name() << " " << eachop->get_type()->print() << endl;
#endif
                        for (size_t i = 0; i < ins->get_operands().size(); i++) // used but not defined
                        {
                            auto op = ins->get_operands()[i];
#ifdef DEBUG
                            cout << "now in op " << op->get_name() << op << endl;
#endif
                            if ((op->get_type()->is_array_type() ||
                                 op->get_type()->is_integer_type() ||
                                 op->get_type()->is_float_type() ||
                                 op->get_type()->is_pointer_type()) &&
                                !(dynamic_cast<Constant *>(op)))
                            {
                                if (defineList.find(op) == defineList.end())
                                {
                                    if (ins->is_phi())
                                    {
                                        wherefrom[basicBlock][op] = (BasicBlock *)ins->get_operands()[i + 1];
                                    }
                                    else
                                    {
                                        wherefrom[basicBlock][op] = basicBlock;
                                    }
                                    basicBlock->get_live_in().insert(op);
#ifdef DEBUG
                                    cout << op->get_name() << " inserted to in" << endl;
#endif
                                }
                            }
                        }
                        if (!ins->is_void()) // defining
                        {
                            defineList.insert(ins);
                        }
                    }

                    for (auto out : basicBlock->get_live_out()) // add in(in += out - def)
                    {
                        if (defineList.find(out) == defineList.end())
                        {
                            basicBlock->get_live_in().insert(out);
                        }
                    }

                    // check in
                    if (lastin != basicBlock->get_live_in())
                    {
                        goon = true;
#ifdef DEBUG
                        cout << "in changed" << endl;
                        cout << "last:" << endl;
                        for (auto op : lastin)
                            cout << op->get_name() << " ";
                        cout << endl;
                        cout << "now:" << endl;
                        auto nowin = basicBlock->get_live_in();
                        for (auto op : nowin)
                            cout << op->get_name() << " ";
                        cout << endl;
#endif
                    }

                    // out
                    // backup
                    lastout.clear();
                    for (auto tmp : basicBlock->get_live_out())
                    {
                        lastout.insert(tmp);
                    }
                    // backup done
                    basicBlock->get_live_out().clear();
                    for (auto suc : basicBlock->get_succ_basic_blocks()) // out = every successor's in
                    {
                        for (auto sucin : suc->get_live_in())
                        {
                            if (wherefrom[suc][sucin] == suc || wherefrom[suc][sucin] == basicBlock)
                                basicBlock->get_live_out().insert(sucin);
                        }
                    }

                    // check out
                    if (lastout != basicBlock->get_live_out())
                    {
                        goon = true;
#ifdef DEBUG
                        cout << "out changed" << endl;
#endif
                    }
                }
                if (!goon)
                    break;
            }
        }

        if (printout)
        {
            cout << "now in function " << func->get_name() << endl;
            for (BasicBlock *basicBlock : func->get_basic_blocks())
            {
                cout << basicBlock->get_name() << endl;
                cout << "\tin\n\t\t";
                for (auto tmp : basicBlock->get_live_in())
                {
                    cout << tmp->get_name() << " ";
                }
                cout << endl;
                cout << "\tout\n\t\t";
                for (auto tmp : basicBlock->get_live_out())
                {
                    cout << tmp->get_name() << " ";
                }
                cout << endl;
            }
        }
    }
}
