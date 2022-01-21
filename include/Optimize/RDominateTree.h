#ifndef SYSYF_RDOMINATETREE_H
#define SYSYF_RDOMINATETREE_H

#include <vector>
#include <memory>
#include <set>
#include <map>
#include "Pass.h"
#include "BasicBlock.h"
#include "Module.h"

class RDominateTree : public Pass{//reverse dominate tree
public:
    explicit RDominateTree(Module* module): Pass(module){}
    void execute()final;
    void get_revserse_post_order(Function* f);
    void get_post_order(BasicBlock* bb,std::set<BasicBlock*>& visited);
    void get_bb_irdom(Function* f);
    void get_bb_rdoms(Function* f);
    void get_bb_rdom_front(Function* f);
    const std::string get_name() const override {return name;}
    BasicBlock* intersect(BasicBlock* b1, BasicBlock* b2);
private:
    BasicBlock* exit_block = nullptr;
    std::list<BasicBlock*> reverse_post_order;
    std::map<BasicBlock*,int> bb2int;
    std::vector<BasicBlock*> rdoms;
    const std::string name = "RDominateTree";
};

#endif //SYSYF_RDOMINATETREE_H