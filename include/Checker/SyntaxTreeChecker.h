#ifndef _C1_SYNTAX_TREE_CHECKER_H_
#define _C1_SYNTAX_TREE_CHECKER_H_

#include <cassert>
#include "ErrorReporter.h"
#include "SyntaxTree.h"
#include <map>
#include <vector>
#include <list>

enum class ErrorType
{
    Accepted = 0,
    Modulo,
    VarUnknown,
    VarDuplicated,
    FuncUnknown,
    FuncDuplicated,
    FuncParams
};

class SyntaxTreeChecker : public SyntaxTree::Visitor
{
public:
    SyntaxTreeChecker(ErrorReporter &e) : err(e) {}
    virtual void visit(SyntaxTree::Assembly &node) override;
    virtual void visit(SyntaxTree::FuncDef &node) override;
    virtual void visit(SyntaxTree::BinaryExpr &node) override;
    virtual void visit(SyntaxTree::UnaryExpr &node) override;
    virtual void visit(SyntaxTree::LVal &node) override;
    virtual void visit(SyntaxTree::Literal &node) override;
    virtual void visit(SyntaxTree::ReturnStmt &node) override;
    virtual void visit(SyntaxTree::VarDef &node) override;
    virtual void visit(SyntaxTree::AssignStmt &node) override;
    virtual void visit(SyntaxTree::FuncCallStmt &node) override;
    virtual void visit(SyntaxTree::BlockStmt &node) override;
    virtual void visit(SyntaxTree::EmptyStmt &node) override;
    virtual void visit(SyntaxTree::ExprStmt &node) override;
    virtual void visit(SyntaxTree::FuncParam &node) override;
    virtual void visit(SyntaxTree::FuncFParamList &node) override;
    virtual void visit(SyntaxTree::BinaryCondExpr &node) override;
    virtual void visit(SyntaxTree::UnaryCondExpr &node) override;
    virtual void visit(SyntaxTree::IfStmt &node) override;
    virtual void visit(SyntaxTree::WhileStmt &node) override;
    virtual void visit(SyntaxTree::BreakStmt &node) override;
    virtual void visit(SyntaxTree::ContinueStmt &node) override;
    virtual void visit(SyntaxTree::InitVal &node) override;

private:
    ErrorReporter &err;
    bool Expr_int;          //表达式的值是否为整型
    bool start_of_new_func; //是否是一个新函数定义的开始
    int Expr_value;         //表达式的值

    //符号表的每一个表项
    struct Entry
    {
        bool is_array;                         //是否为数组
        bool is_func;                          //是否为函数
        SyntaxTree::Type type;                 //变量类型or返回值类型
        int array_length;                      //如果是数组，则长度非0
        std::vector<int> arlen_value;          //数组的每一维长度
        std::vector<struct Entry> func_params; //函数参数列表
    };
    struct Entry current_type; //当前的type
    //vector的每一项是一个作用域顶层的符号表，之间是嵌套关系
    std::list<std::map<std::string, struct Entry>> table;

    struct Entry *Lookup(std::string name)
    {
        //首先在当前函数中从最近的block开始寻找
        for (auto i = table.begin(); i != table.end(); i++)
        {
            auto iter = i->find(name);
            if (iter != i->end())
                return &(iter->second);
        }
        return NULL;
    }

    //将变量插入符号表
    bool Insert_Var(SyntaxTree::VarDef &node)
    {
        struct Entry temp;
        temp.is_func = false;
        temp.type = node.btype;
        if (node.array_length.size() > 0)
        {
            temp.is_array = true;
            for (auto exp : node.array_length)
            {
                exp->accept(*this);
                temp.arlen_value.push_back(Expr_value);
            }
        }
        else
            temp.is_array = false;
        //插入到当前作用域的符号表
        auto result = table.front().insert(std::pair<std::string, struct Entry>(node.name, temp));
        return result.second;
    }

    //将函数插入符号表，要注意更新当前作用域
    bool Insert_Func(SyntaxTree::FuncDef &node)
    {
        //为函数作用域新建符号表
        std::map<std::string, struct Entry> new_table;

        struct Entry temp;
        temp.is_array = false;
        temp.is_func = true;
        temp.type = node.ret_type;
        if (node.param_list != NULL)
        {
            for (auto param : (node.param_list)->params)
            {
                //对每一个参数遍历
                struct Entry p;
                p.is_func = false;
                p.type = param->param_type;
                //如果参数类型是数组
                if (param->array_index.size() > 0)
                {
                    p.is_array = true;
                    for (auto exp : param->array_index)
                    {
                        if (exp == NULL) //表明是一个指针
                            p.arlen_value.push_back(-1);
                        else
                        {
                            exp->accept(*this);
                            p.arlen_value.push_back(Expr_value);
                        }
                    }
                }
                else
                    p.is_array = false;
                //插入到函数参数列表
                temp.func_params.push_back(p);
                //插入到函数作用域符号表
                auto result = new_table.insert(std::pair<std::string, struct Entry>(param->name, p));
                //函数形参重复定义
                if (!result.second)
                {
                    err.error(node.loc, "Redefined Variable");
                    exit(int(ErrorType::VarDuplicated));
                }
            }
        }
        //插入到当前作用域的符号表
        auto result = table.front().insert(std::pair<std::string, struct Entry>(node.name, temp));
        //插入成功
        if (result.second)
        {
            //更改当前作用域
            table.push_front(new_table);
            return true;
        }
        else
            return false;
    }

    //进入新的作用域，添加新的符号表
    void make_new_table()
    {
        std::map<std::string, struct Entry> new_table;
        table.push_front(new_table);
        return;
    }

    //退出作用域，删除当前作用域的符号表
    void delete_table()
    {
        table.pop_front();
        return;
    }
};

#endif // _C1_SYNTAX_TREE_CHECKER_H_