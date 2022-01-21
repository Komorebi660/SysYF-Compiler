#include "RDominateTree.h"

void RDominateTree::execute() {
    for(auto f:module->get_functions()){
        if(f->get_basic_blocks().empty()){
            continue;
        }
        for(auto bb:f->get_basic_blocks()){
            bb->clear_rdom();
            bb->clear_rdom_frontier();
        }
        get_bb_irdom(f);
        get_bb_rdom_front(f);
        get_bb_rdoms(f);
    }
}

void RDominateTree::get_post_order(BasicBlock *bb, std::set<BasicBlock *> &visited) {
    visited.insert(bb);
    auto parents = bb->get_pre_basic_blocks();
    for(auto parent : parents){
        auto is_visited = visited.find(parent);
        if(is_visited==visited.end()){
            get_post_order(parent,visited);
        }
    }
    bb2int[bb] = reverse_post_order.size();
    reverse_post_order.push_back(bb);
}

void RDominateTree::get_revserse_post_order(Function *f) {
    rdoms.clear();
    reverse_post_order.clear();
    bb2int.clear();
    for(auto bb:f->get_basic_blocks()){
        auto terminate_instr = bb->get_terminator();
        if(terminate_instr->is_ret()){
            exit_block = bb;
            break;
        }
    }
    if(!exit_block){
        std::cerr << "exit block is null, function must have only one exit block with a ret instr\n";
        std::cerr << "err function:\n" << f->print() << std::endl;
        exit(1);
    }
    std::set<BasicBlock*> visited = {};
    get_post_order(exit_block,visited);
    reverse_post_order.reverse();
}

void RDominateTree::get_bb_irdom(Function *f) {
    get_revserse_post_order(f);

    auto root = exit_block;
    auto root_id = bb2int[root];

    for(int i = 0;i < root_id;i++){
        rdoms.push_back(nullptr);
    }

    rdoms.push_back(root);

    bool changed = true;
    while(changed){
        changed = false;
        for(auto bb:reverse_post_order){
            if(bb == root){
                continue;
            }
            auto rpreds = bb->get_succ_basic_blocks();
            BasicBlock* new_irdom = nullptr;
            for(auto rpred_bb:rpreds){
                if(rdoms[bb2int[rpred_bb]] != nullptr){
                    new_irdom = rpred_bb;
                    break;
                }
            }
            for(auto rpred_bb:rpreds){
                if(rdoms[bb2int[rpred_bb]] != nullptr){
                    new_irdom = intersect(rpred_bb,new_irdom);
                }
            }
            if(rdoms[bb2int[bb]] != new_irdom){
                rdoms[bb2int[bb]] = new_irdom;
                changed = true;
            }
        }
    }
}

void RDominateTree::get_bb_rdoms(Function *f) {
    for(auto bb:f->get_basic_blocks()){
        if(bb==exit_block){
            continue;
        }
        auto current = bb;
        while(current != exit_block){
            bb->add_rdom(current);
            current = rdoms[bb2int[current]];
        }
    }
}

void RDominateTree::get_bb_rdom_front(Function *f) {
    auto all_bbs = f->get_basic_blocks();
    for(auto bb_iter=all_bbs.rbegin();bb_iter!=all_bbs.rend();bb_iter++){//reverse bb order;
        auto bb = *bb_iter;
        auto b_rpred = bb->get_succ_basic_blocks();
        if(b_rpred.size() >= 2){
            for(auto rpred:b_rpred){
                auto runner = rpred;
                while(runner!=rdoms[bb2int[bb]]){
                    runner->add_rdom_frontier(bb);
                    runner = rdoms[bb2int[runner]];
                }
            }
        }
    }
}

BasicBlock* RDominateTree::intersect(BasicBlock *b1, BasicBlock *b2) {
    auto finger1 = b1;
    auto finger2 = b2;
    while(finger1!=finger2){
        while(bb2int[finger1]<bb2int[finger2]){
            finger1 = rdoms[bb2int[finger1]];
        }
        while(bb2int[finger2]<bb2int[finger1]){
            finger2 = rdoms[bb2int[finger2]];
        }
    }
    return finger1;
}
