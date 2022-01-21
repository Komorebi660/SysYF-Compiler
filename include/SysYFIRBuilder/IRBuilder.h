#ifndef _SYSYF_IR_BUILDER_H_
#define _SYSYF_IR_BUILDER_H_
#include "BasicBlock.h"
#include "Constant.h"
#include "Function.h"
#include "IRStmtBuilder.h"
#include "Module.h"
#include "Type.h"
#include <map>
#include "SyntaxTree.h"


class Scope {
public:
    // enter a new scope
    void enter() {
        name2var.push_back({});
        name2func.push_back({});
    }

    // exit a scope
    void exit() {
        name2var.pop_back();
        name2func.pop_back();
    }

    bool in_global() {
        return name2var.size() == 1;
    }

    // push a name to scope
    // return true if successful
    // return false if this name already exits
    // but func name could be same with variable name
    bool push(std::string name, Value *val) {
        bool result;
        if (dynamic_cast<Function *>(val)){
            result = (name2func[name2func.size() - 1].insert({name, val})).second;
        }
        else{
            result = (name2var[name2var.size() - 1].insert({name, val})).second;
        }
        return result;
    }

    Value* find(std::string name, bool isfunc) {
        if (isfunc){
            for (auto s = name2func.rbegin(); s!= name2func.rend();s++) {
                auto iter = s->find(name);
                if (iter != s->end()) {
                    return iter->second;
                }
            }
        }
        else{
            for (auto s = name2var.rbegin(); s!= name2var.rend();s++) {
                auto iter = s->find(name);
                if (iter != s->end()) {
                    return iter->second;
                }
            }
        }
        return nullptr;
    }


private:
    std::vector<std::map<std::string, Value *>> name2var;
    std::vector<std::map<std::string, Value *>> name2func;
};

class IRBuilder: public SyntaxTree::Visitor
{
private:
    virtual void visit(SyntaxTree::InitVal &) override final;
    virtual void visit(SyntaxTree::Assembly &) override final;
    virtual void visit(SyntaxTree::FuncDef &) override final;
    virtual void visit(SyntaxTree::VarDef &) override final;
    virtual void visit(SyntaxTree::AssignStmt &) override final;
    virtual void visit(SyntaxTree::ReturnStmt &) override final;
    virtual void visit(SyntaxTree::BlockStmt &) override final;
    virtual void visit(SyntaxTree::EmptyStmt &) override final;
    virtual void visit(SyntaxTree::ExprStmt &) override final;
    virtual void visit(SyntaxTree::UnaryCondExpr &) override final;
    virtual void visit(SyntaxTree::BinaryCondExpr &) override final;
    virtual void visit(SyntaxTree::BinaryExpr &) override final;
    virtual void visit(SyntaxTree::UnaryExpr &) override final;
    virtual void visit(SyntaxTree::LVal &) override final;
    virtual void visit(SyntaxTree::Literal &) override final;
    virtual void visit(SyntaxTree::FuncCallStmt &) override final;
    virtual void visit(SyntaxTree::FuncParam &) override final;
    virtual void visit(SyntaxTree::FuncFParamList &) override final;
    virtual void visit(SyntaxTree::IfStmt &) override final;
    virtual void visit(SyntaxTree::WhileStmt &) override final;
    virtual void visit(SyntaxTree::BreakStmt &) override final;
    virtual void visit(SyntaxTree::ContinueStmt &) override final;

    IRStmtBuilder *builder;
    Scope scope;
    std::unique_ptr<Module> module;
public:
    IRBuilder(){
        module = std::unique_ptr<Module>(new Module("SysYF code"));
        builder = new IRStmtBuilder(nullptr, module.get());
        auto TyVoid = Type::get_void_type(module.get());
        auto TyInt32 = Type::get_int32_type(module.get());
        auto TyInt32Ptr = Type::get_int32_ptr_type(module.get());
        auto TyFloat = Type::get_float_type(module.get());
        auto TyFloatPtr = Type::get_float_ptr_type(module.get());

        auto input_type = FunctionType::get(TyInt32, {});
        auto get_int =
            Function::create(
                    input_type,
                    "get_int",
                    module.get());

        input_type = FunctionType::get(TyFloat, {});
        auto get_float =
            Function::create(
                    input_type,
                    "get_float",
                    module.get());

        input_type = FunctionType::get(TyInt32, {});
        auto get_char =
            Function::create(
                    input_type,
                    "get_char",
                    module.get());

        std::vector<Type *> input_params;
        std::vector<Type *>().swap(input_params);
        input_params.push_back(TyInt32Ptr);
        input_type = FunctionType::get(TyInt32, input_params);
        auto get_int_array =
            Function::create(
                    input_type,
                    "get_int_array",
                    module.get());

        std::vector<Type *>().swap(input_params);
        input_params.push_back(TyFloatPtr);
        input_type = FunctionType::get(TyInt32, input_params);
        auto get_float_array =
            Function::create(
                    input_type,
                    "get_float_array",
                    module.get());

        std::vector<Type *> output_params;
        std::vector<Type *>().swap(output_params);
        output_params.push_back(TyInt32);
        auto output_type = FunctionType::get(TyVoid, output_params);
        auto put_int =
            Function::create(
                    output_type,
                    "put_int",
                    module.get());

        std::vector<Type *>().swap(output_params);
        output_params.push_back(TyFloat);
        output_type = FunctionType::get(TyVoid, output_params);
        auto put_float =
            Function::create(
                    output_type,
                    "put_float",
                    module.get());

        std::vector<Type *>().swap(output_params);
        output_params.push_back(TyInt32);
        output_type = FunctionType::get(TyVoid, output_params);
        auto put_char =
            Function::create(
                    output_type,
                    "put_char",
                    module.get());

        std::vector<Type *>().swap(output_params);
        output_params.push_back(TyInt32);
        output_params.push_back(TyInt32Ptr);
        output_type = FunctionType::get(TyVoid, output_params);
        auto put_int_array =
            Function::create(
                    output_type,
                    "put_int_array",
                    module.get());

        std::vector<Type *>().swap(output_params);
        output_params.push_back(TyInt32);
        output_params.push_back(TyFloatPtr);
        output_type = FunctionType::get(TyVoid, output_params);
        auto put_float_array =
            Function::create(
                    output_type,
                    "put_float_array",
                    module.get());

        scope.enter();
        scope.push("getint", get_int);
        scope.push("getfloat", get_float);
        scope.push("getch", get_char);
        scope.push("getarray", get_int_array);
        scope.push("get_float_array", get_float_array);
        scope.push("putint", put_int);
        scope.push("putfloat", put_float);
        scope.push("putch", put_char);
        scope.push("putarray", put_int_array);
        scope.push("putfloatarray", put_float_array);
    }
    std::unique_ptr<Module> getModule() {
        return std::move(module);
    }
};


#endif // _SYSYF_IR_BUILDER_H_
