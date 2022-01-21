#include "Pass.h"
#include "DominateTree.h"

void DominateTree::execute() {
    for(auto f:module->get_functions()){
        if(f->get_basic_blocks().empty()){
            continue;
        }
        get_bb_idom(f);
        get_bb_dom_front(f);
    }
}

void DominateTree::get_post_order(BasicBlock *bb,std::set<BasicBlock*>& visited) {
    visited.insert(bb);
    auto children = bb->get_succ_basic_blocks();
    for(auto child : children){
        auto is_visited = visited.find(child);
        if(is_visited == visited.end()){
            get_post_order(child, visited);
        }
    }
    bb2int[bb] = reverse_post_order.size();
    reverse_post_order.push_back(bb);
}

void DominateTree::get_revserse_post_order(Function *f) {
    doms.clear();
    reverse_post_order.clear();
    bb2int.clear();
    auto entry = f->get_entry_block();
    std::set<BasicBlock*> visited = {};
    get_post_order(entry,visited);
    reverse_post_order.reverse();
}

//ref:https://www.cs.rice.edu/~keith/EMBED/dom.pdf
void DominateTree::get_bb_idom(Function *f) {
    get_revserse_post_order(f);

    auto root = f->get_entry_block();
    auto root_id = bb2int[root];
    for(int i = 0;i < root_id;i++){
        doms.push_back(nullptr);
    }

    doms.push_back(root);

    bool changed = true;
    while(changed){
        changed = false;
        for(auto bb:reverse_post_order){
            if(bb == root){
                continue;
            }
            auto preds = bb->get_pre_basic_blocks();
            BasicBlock* new_idom = nullptr;
            for(auto pred_bb:preds){
                if(doms[bb2int[pred_bb]] != nullptr){
                    new_idom = pred_bb;
                    break;
                }
            }
            for(auto pred_bb:preds){
                if(doms[bb2int[pred_bb]] != nullptr){
                    new_idom = intersect(pred_bb,new_idom);
                }
            }
            if(doms[bb2int[bb]] != new_idom){
                doms[bb2int[bb]] = new_idom;
                changed = true;
            }
        }
    }

    for(auto bb:reverse_post_order){
        bb->set_idom(doms[bb2int[bb]]);
    }
}

void DominateTree::get_bb_dom_front(Function *f) {
    for(auto b:f->get_basic_blocks()){
        auto b_pred = b->get_pre_basic_blocks();
        if(b_pred.size() >= 2){
            for(auto pred:b_pred){
                auto runner = pred;
                while(runner!=doms[bb2int[b]]){
                    runner->add_dom_frontier(b);
                    runner = doms[bb2int[runner]];
                }
            }
        }
    }
}

BasicBlock* DominateTree::intersect(BasicBlock *b1, BasicBlock *b2) {
    auto finger1 = b1;
    auto finger2 = b2;
    while(finger1!=finger2){
        while(bb2int[finger1]<bb2int[finger2]){
            finger1 = doms[bb2int[finger1]];
        }
        while(bb2int[finger2]<bb2int[finger1]){
            finger2 = doms[bb2int[finger2]];
        }
    }
    return finger1;
}
