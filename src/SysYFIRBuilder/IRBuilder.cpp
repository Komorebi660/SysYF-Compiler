#include "IRBuilder.h"

#define CONST_INT(num) ConstantInt::get(num, module.get())
#define CONST_FLOAT(num) ConstantFloat::get(num, module.get())

/* 常量符号表 */
std::list<std::map<std::string, Constant *>> const_table;
//查找
Constant *Lookup(std::string name)
{
    //首先在当前函数中从最近的scope开始寻找
    for (auto i = const_table.begin(); i != const_table.end(); i++)
    {
        auto iter = i->find(name);
        if (iter != i->end())
            return iter->second;
    }
    return NULL;
}
//将变常量插入符号表
bool Insert(std::string name, Constant *val)
{
    //插入到当前作用域的符号表
    auto result = const_table.front().insert(std::pair<std::string, Constant *>(name, val));
    return result.second;
}
//进入新的作用域，添加新的符号表
void make_new_table()
{
    std::map<std::string, Constant *> new_table;
    const_table.push_front(new_table);
    return;
}
//退出作用域，删除当前作用域的符号表
void delete_table()
{
    const_table.pop_front();
    return;
}

// store temporary value
std::vector<Type *> Params;           //函数形参类型表
std::vector<std::string> Param_names; //函数形参名表
Value *retAlloca = nullptr;           //返回值
BasicBlock *retBB = nullptr;          //返回语句块
bool is_new_func = false;             //判断是否为新函数，用来处理函数作用域问题
bool get_const;                       //告诉LVal节点获取符号对应的常量值
bool require_lval = false;            //告诉LVal节点不需要发射load指令
Function *current_function = nullptr; //当前函数
BasicBlock *current_bb = nullptr;     //当前块
Value *recent_value = nullptr;        //最近的表达式的value
Value *recent_ptr = nullptr;          //最近的左值表达式对应变量的指针
BasicBlock *nextBB_while = nullptr;   //while语句后的下一个基本块
BasicBlock *condBB_while = nullptr;   //while语句cond分支
BasicBlock *trueBB = nullptr;         //通用true分支
BasicBlock *falseBB = nullptr;        //通用false分支
int id = 1;                           //recent标号
//初始化向量
typedef struct InitItem
{
    bool isValue;
    Value *expr;
    std::vector<InitItem> list;
} Inititem;
InitItem recentInitItem;

// types
Type *VOID_T;
Type *INT1_T;
Type *INT32_T;
Type *FLOAT_T;
Type *INT32PTR_T;
Type *FLOATPTR_T;

// target=val
void Assign(Value *target, Value *val, IRStmtBuilder *builder)
{
    Type *target_type;

    if (dynamic_cast<GlobalVariable *>(target))
    {
        target_type = ((GlobalVariable *)target)->get_type(); //指针
        target_type = ((PointerType *)target_type)->get_element_type();
    }
    else
    {
        target_type = ((AllocaInst *)target)->get_alloca_type();
    }

    // int=float
    if (val->get_type() == FLOAT_T && (target_type == INT32_T))
    {
        auto tmp = builder->create_fptosi(val, INT32_T);
        builder->create_store(tmp, target);
    }
    // float=int
    else if (val->get_type() == INT32_T && target_type == FLOAT_T)
    {
        auto tmp = builder->create_sitofp(val, FLOAT_T);
        builder->create_store(tmp, target);
    }
    else
    {
        builder->create_store(val, target);
    }
}

// get type from SyntaxTree
Type *get_type(SyntaxTree::Type type, bool is_pointer)
{
    switch (type)
    {
    case SyntaxTree::Type::INT:
        if (is_pointer)
            return INT32PTR_T;
        else
            return INT32_T;
        break;
    case SyntaxTree::Type::VOID:
        return VOID_T;
        break;
    case SyntaxTree::Type::BOOL:
        return INT1_T;
        break;
    case SyntaxTree::Type::FLOAT:
        if (is_pointer)
            return FLOATPTR_T;
        else
            return FLOAT_T;
        break;
    default:
        return VOID_T;
        break;
    }
}

void IRBuilder::visit(SyntaxTree::Assembly &node)
{
    VOID_T = Type::get_void_type(module.get());
    INT1_T = Type::get_int1_type(module.get());
    INT32_T = Type::get_int32_type(module.get());
    FLOAT_T = Type::get_float_type(module.get());
    INT32PTR_T = Type::get_int32_ptr_type(module.get());
    FLOATPTR_T = Type::get_float_ptr_type(module.get());
    make_new_table();
    for (const auto &def : node.global_defs)
    {
        def->accept(*this);
    }
}

void IRBuilder::visit(SyntaxTree::InitVal &node)
{
    InitItem newItem;
    if (node.isExp)
    {
        node.expr->accept(*this);
        newItem.isValue = true;
        newItem.expr = recent_value;
    }
    else
    {
        std::vector<InitItem> tmp;
        for (auto element : node.elementList)
        {
            element->accept(*this);
            tmp.push_back(recentInitItem);
        }
        newItem.isValue = false;
        newItem.list = tmp;
    }
    recentInitItem = newItem;
}

void IRBuilder::visit(SyntaxTree::FuncDef &node)
{
    is_new_func = true;
    Params.clear();
    Param_names.clear();
    auto ret_type = get_type(node.ret_type, false);
    //获取参数列表
    if (node.param_list != NULL)
        node.param_list->accept(*this);

    //获取函数类型
    auto FunTy = FunctionType::get(ret_type, Params);
    //添加函数
    auto Fun = Function::create(FunTy, node.name, module.get());
    current_function = Fun;
    scope.push(node.name, Fun); //在进入新的作用域之前添加到符号表中

    std::vector<Value *> args; // 获取函数的形参,通过Function中的iterator
    for (auto arg = Fun->arg_begin(); arg != Fun->arg_end(); arg++)
        args.push_back(*arg);

    //进入函数(进入新的作用域)
    scope.enter();
    make_new_table();
    auto bb = BasicBlock::create(module.get(), "entry", Fun);
    current_bb = bb;
    builder->set_insert_point((BasicBlock *)bb);
    for (int i = 0; i < (int)(Param_names.size()); i++)
    {
        auto alloc = builder->create_alloca(Params[i]); //分配形参空间
        builder->create_store(args[i], alloc);          // store 形参
        scope.push(Param_names[i], alloc);              //加入作用域
    }
    //创建统一return分支
    retBB = BasicBlock::create(module.get(), "ret", Fun);
    if (ret_type == VOID_T)
    {
        // void类型无需返回值
        current_bb = retBB;
        builder->set_insert_point(retBB);
        builder->create_void_ret();
    }
    else
    {
        retAlloca = builder->create_alloca(ret_type); // 在内存中分配返回值的位置
        current_bb = retBB;
        builder->set_insert_point(retBB);
        auto retLoad = builder->create_load(retAlloca);
        builder->create_ret(retLoad);
    }
    //重新回到函数开始
    current_bb = bb;
    builder->set_insert_point(bb);
    node.body->accept(*this);

    //处理没有return的空块
    if (!current_bb->get_terminator())
        builder->create_br(retBB);
}

void IRBuilder::visit(SyntaxTree::FuncFParamList &node)
{
    //初始化参数
    for (auto param : node.params)
    {
        param->accept(*this);
    }
}

void IRBuilder::visit(SyntaxTree::FuncParam &node)
{
    Type *paramType = get_type(node.param_type, false);
    if (!node.array_index.empty())
    {
        get_const = true;
        for (int i = node.array_index.size() - 1; i > 0; i--)
        {
            auto tmp = node.array_index[i];
            tmp->accept(*this);
            paramType = ArrayType::get(paramType, ((ConstantInt *)recent_value)->get_value());
        }
        get_const = false;
        paramType = PointerType::get(paramType);
    }
    Params.push_back(paramType);
    Param_names.push_back(node.name);
}

/* 多维数组处理 */ ///////////
std::size_t depth = 0;
std::vector<int> indexMax;
std::vector<int> indexList;

std::vector<Value *> tmpfor0;
Constant **tmpforconst;
Type *realType;

void SetZero(AllocaInst *alloca, std::size_t nowdepth, IRStmtBuilder *builder, Module *module)
{
    if (nowdepth == indexMax.size())
    {
        auto aGep = builder->create_gep(alloca, tmpfor0);
        Assign(aGep, ConstantInt::get(0, module), builder);
    }
    else
    {
        for (int i = 0; i < indexMax[nowdepth]; i++)
        {
            tmpfor0.push_back(ConstantInt::get(i, module));
            SetZero(alloca, nowdepth + 1, builder, module);
            tmpfor0.pop_back();
        }
    }
}
Constant *parseConst(int nowdepth, int offset, Type *type)
{
    if (nowdepth == indexMax.size())
        return tmpforconst[offset];
    std::vector<Constant *> tmp;
    int blocksize = 1;
    for (int i = indexMax.size() - 1; i > nowdepth; i--)
    {
        blocksize *= indexMax[i];
    }
    for (int i = 0; i < indexMax[nowdepth]; i++)
    {
        tmp.push_back(parseConst(nowdepth + 1, offset + i * blocksize, type->get_array_element_type()));
    }
    return ConstantArray::get((ArrayType *)type, tmp);
}
void assignInitVal(AllocaInst *alloca, Type *lValType, bool isConstant, InitItem initVal, IRStmtBuilder *builder, Module *module, bool firsttime)
{
    if (firsttime)
    {
        depth = 0;
        indexMax.clear();
        indexList.clear();
        realType = lValType;
        while (realType->is_array_type())
        {
            indexMax.push_back(((ArrayType *)realType)->get_num_of_elements());
            indexList.push_back(0);
            realType = realType->get_array_element_type();
        }
        if (alloca != NULL && lValType->is_array_type()) //局部变量置0
        {
            tmpfor0.clear();
            tmpfor0.push_back(ConstantInt::get(0, module));
            SetZero(alloca, 0, builder, module);
        }
        if (isConstant) //要处理常数
        {
            int totalnum = 1;
            for (int i = 0; i < indexMax.size(); i++)
            {
                totalnum *= indexMax[i];
            }
            tmpforconst = (Constant **)realloc(tmpforconst, sizeof(Constant *) * totalnum); //分配参数暂存空间
            for (int i = 0; i < totalnum; i++)
            {
                tmpforconst[i] = ConstantZero::get(realType, module);
            }
        }
    }
    //如果是常数，要返回constant*给外面的函数用
    if (!initVal.isValue) //是数组，递归操作
    {
        depth++;
        for (unsigned int i = 0; i < initVal.list.size(); i++)
        {
            int beforepos = indexList[depth - 1];
            assignInitVal(alloca, lValType->get_array_element_type(), isConstant, initVal.list[i], builder, module, false);

            bool upmatch = false;
            if (beforepos == indexList[depth - 1])
                upmatch = true;
            else
                for (auto j = depth; j < indexList.size(); j++)
                {
                    if (indexList[j] != 0)
                    {
                        upmatch = true;
                        break;
                    }
                }
            if (initVal.list[i].isValue)
                upmatch = false;
            if (upmatch)
            {
                for (auto j = depth; j < indexList.size(); j++)
                {
                    indexList[j] = 0;
                }
                for (auto j = depth - 1;; j--)
                {
                    indexList[j]++;
                    if (j > 0 && indexList[j] == indexMax[j])
                        indexList[j] = 0;
                    else
                        break;
                }
            }
        }
        depth--;
    }
    else //不是数组，直接赋值
    {
        if (depth < indexMax.size()) //给的初始值深度不够，自动加深
        {
            depth++;
            assignInitVal(alloca, lValType->get_array_element_type(), isConstant, initVal, builder, module, false);
            depth--;
            return;
        }

        if (alloca != NULL) //非空说明是局部变量，要
        {
            if (alloca->get_type()->get_pointer_element_type()->is_array_type()) //是数组，要先取指针
            {
                std::vector<Value *> indexListforGep;
                indexListforGep.push_back(ConstantInt::get(0, module));
                for (std::size_t i = 0; i < indexList.size(); i++)
                {
                    indexListforGep.push_back(ConstantInt::get(indexList[i], module));
                }
                auto aGep = builder->create_gep(alloca, indexListforGep);
                Assign(aGep, initVal.expr, builder);
            }
            else
                Assign(alloca, initVal.expr, builder);
        }
        Constant *tmp;
        if (isConstant)
        {

            // float=int
            if (dynamic_cast<ConstantInt *>(initVal.expr) && lValType == FLOAT_T)
            {
                int val = ((ConstantInt *)initVal.expr)->get_value();
                tmp = ConstantFloat::get((float)val, module);
            }
            // int=float
            else if (dynamic_cast<ConstantFloat *>(initVal.expr) && lValType == INT32_T)
            {
                float val = ((ConstantFloat *)initVal.expr)->get_value();
                tmp = ConstantInt::get((int)val, module);
            }
            else
            {
                tmp = (Constant *)initVal.expr;
            }
            int pos = 0;
            for (int i = 0; i < indexMax.size(); i++)
            {
                pos *= indexMax[i];
                pos += indexList[i];
            }
            tmpforconst[pos] = tmp;
        }
        //处理成功，下标++
        if (depth > 0)
        {
            for (auto j = depth; j < indexList.size(); j++)
            {
                indexList[j] = 0;
            }
            for (auto j = depth - 1;; j--)
            {
                indexList[j]++;
                if (j > 0 && indexList[j] == indexMax[j])
                    indexList[j] = 0;
                else
                    break;
            }
        }
        //处理成功，下标++ end
    }
}
/* 多维数组处理 */ ///////////

void IRBuilder::visit(SyntaxTree::VarDef &node)
{
    auto name = node.name;
    auto element_type = get_type(node.btype, false);
    Type *lValType;
    lValType = element_type;
    get_const = true;
    for (int i = node.array_length.size() - 1; i >= 0; i--)
    {
        auto tmp = node.array_length[i];
        tmp->accept(*this);
        lValType = ArrayType::get(lValType, ((ConstantInt *)recent_value)->get_value());
    }
    get_const = false;

    //全局声明
    if (scope.in_global())
    {
        GlobalVariable *global_alloca;
        //显式初始化
        if (node.is_inited)
        {
            //进入InitVal
            get_const = true;
            node.initializers->accept(*this);
            get_const = false;
            indexList.clear();
            indexMax.clear();
            depth = 0;
            assignInitVal(NULL, lValType, true, recentInitItem, builder, module.get(), true);
            global_alloca = GlobalVariable::create(name, module.get(), lValType, node.is_constant, parseConst(0, 0, lValType));
        }
        //未初始化，全局变量也需要赋值为0
        else
            global_alloca = GlobalVariable::create(name, module.get(), lValType, node.is_constant, ConstantZero::get(lValType, module.get()));
        //插入符号表
        scope.push(name, global_alloca);
        //常量插入常量表
        if (node.is_constant)
            Insert(name, global_alloca->get_init());
    }
    //局部声明
    else
    {
        //分配空间并插入符号表
        auto alloca = builder->create_alloca(lValType);
        scope.push(name, alloca);
        //初始化
        if (node.is_inited)
        {
            //进入InitVal
            if (node.is_constant)
                get_const = true;
            node.initializers->accept(*this);
            get_const = false;

            std::vector<int> indexList;
            indexList.clear();
            indexMax.clear();
            depth = 0;
            assignInitVal(alloca, lValType, node.is_constant, recentInitItem, builder, module.get(), true);
            if (node.is_constant)
            {
                Insert(name, parseConst(0, 0, lValType));
            }
        }
    }
}

void IRBuilder::visit(SyntaxTree::LVal &node)
{
    bool should_return_lval = require_lval;
    require_lval = false;

    auto temp = scope.find(node.name, false);
    auto temp_const = Lookup(node.name);
    auto lValType = temp->get_type()->get_pointer_element_type();
    //获取常量
    if (get_const)
    {
        recent_ptr = temp;
        if (node.array_index.size() > 0)
        {
            for (auto tmp : node.array_index)
            {
                tmp->accept(*this);
                if (dynamic_cast<ConstantArray *>(temp_const) && dynamic_cast<ConstantInt *>(recent_value))
                    temp_const = ((ConstantArray *)temp_const)->get_element_value(((ConstantInt *)recent_value)->get_value());
            }
        }
        recent_value = temp_const;
    }
    //全局作用域访问左值一定是处理常量,所以接下来一定是局部作用域处理
    else
    {
        for (auto tmp : node.array_index)
        {
            tmp->accept(*this);
            if (lValType->is_pointer_type())
            {
                lValType = lValType->get_pointer_element_type();
                temp = builder->create_load(temp);
                temp = builder->create_gep(temp, {recent_value});
            }
            else if (lValType->is_array_type())
            {
                lValType = lValType->get_array_element_type();
                temp = builder->create_gep(temp, {CONST_INT(0), recent_value});
            }
        }
        recent_ptr = temp;
        if (lValType->is_array_type())
            recent_value = builder->create_gep(temp, {CONST_INT(0), CONST_INT(0)});
        else if (!should_return_lval)
            recent_value = builder->create_load(recent_ptr);
        return;
    }
}

void IRBuilder::visit(SyntaxTree::AssignStmt &node)
{
    node.value->accept(*this);
    auto val = recent_value;

    require_lval = true;
    node.target->accept(*this);
    auto target = recent_ptr;

    Assign(target, val, builder);
}

void IRBuilder::visit(SyntaxTree::Literal &node)
{
    if (node.literal_type == SyntaxTree::Type::INT)
    {
        recent_value = ConstantInt::get(node.int_const, module.get());
    }
    else if (node.literal_type == SyntaxTree::Type::FLOAT)
    {
        recent_value = ConstantFloat::get(node.float_const, module.get());
    }
}

void IRBuilder::visit(SyntaxTree::ReturnStmt &node)
{
    if (node.ret == NULL)
    {
        // void 返回
        recent_value = builder->create_br(retBB);
    }
    else
    {
        //先把返回值store在retAlloca中，再跳转到统一的返回入口
        node.ret->accept(*this);
        /*类型转换*/
        if (recent_value->get_type() == FLOAT_T && current_function->get_return_type() == INT32_T)
        {
            auto temp = builder->create_fptosi(recent_value, INT32_T);
            builder->create_store(temp, retAlloca);
        }
        else if (recent_value->get_type() == INT32_T && current_function->get_return_type() == FLOAT_T)
        {
            auto temp = builder->create_sitofp(recent_value, FLOAT_T);
            builder->create_store(temp, retAlloca);
        }
        else
            builder->create_store(recent_value, retAlloca);
        recent_value = builder->create_br(retBB);
    }
}

void IRBuilder::visit(SyntaxTree::BlockStmt &node)
{
    //如果是一个新的函数，则不用再进入一个新的作用域
    if (is_new_func == true)
        is_new_func = false;
    //其它情况，需要进入一个新的作用域
    else
    {
        scope.enter();
        make_new_table();
    }

    //遍历每一个语句块
    for (auto stmt : node.body)
    {
        stmt->accept(*this);
    }
    scope.exit();
    delete_table();
}

void IRBuilder::visit(SyntaxTree::EmptyStmt &node) {}

void IRBuilder::visit(SyntaxTree::ExprStmt &node)
{
    node.exp->accept(*this);
}

void IRBuilder::visit(SyntaxTree::UnaryCondExpr &node)
{
    auto op = node.op;
    if (op == SyntaxTree::UnaryCondOp::NOT)
    {
        auto temp_t = trueBB;
        auto temp_f = falseBB;
        trueBB = temp_f; //交换true和false
        falseBB = temp_t;
        node.rhs->accept(*this);
        auto rhs = recent_value;

        //“非”运算的对象最终生成了br,不做处理，因为交换true和false已经完成了处理
        if (rhs->get_type() == VOID_T)
            return;
        // INT1-->INT32
        else if (rhs->get_type() == INT1_T)
            rhs = builder->create_zext(rhs, INT32_T);

        if (rhs->get_type() == FLOAT_T)
            recent_value = builder->create_fcmp_eq(rhs, CONST_FLOAT(0));
        else
            recent_value = builder->create_icmp_eq(rhs, CONST_INT(0));

        trueBB = temp_t;
        falseBB = temp_f;
    }
}

void IRBuilder::visit(SyntaxTree::BinaryCondExpr &node)
{
    auto op = node.op;
    if (op == SyntaxTree::BinaryCondOp::LAND)
    {
        std::string id_str = std::to_string(id++);
        auto bb_next = BasicBlock::create(module.get(), id_str, current_function);

        auto temp_BB = trueBB;   //保存
        trueBB = bb_next;        //更新trueBB
        node.lhs->accept(*this); //访问左操作数
        trueBB = temp_BB;        //恢复

        //检查返回值类型
        if (recent_value->get_type() == INT32_T)
            recent_value = builder->create_icmp_ne(recent_value, CONST_INT(0));
        else if (recent_value->get_type() == FLOAT_T)
            recent_value = builder->create_fcmp_ne(recent_value, CONST_FLOAT(0));
        //不是br
        if (recent_value->get_type() != VOID_T)
            recent_value = builder->create_cond_br(recent_value, bb_next, falseBB);

        current_bb = bb_next;
        builder->set_insert_point(bb_next);
        node.rhs->accept(*this); //访问右操作数
        //检查返回值类型
        if (recent_value->get_type() == INT32_T)
            recent_value = builder->create_icmp_ne(recent_value, CONST_INT(0));
        else if (recent_value->get_type() == FLOAT_T)
            recent_value = builder->create_fcmp_ne(recent_value, CONST_FLOAT(0));
        //不是br
        if (recent_value->get_type() != VOID_T)
            recent_value = builder->create_cond_br(recent_value, trueBB, falseBB);
    }
    else if (op == SyntaxTree::BinaryCondOp::LOR)
    {
        std::string id_str = std::to_string(id++);
        auto bb_next = BasicBlock::create(module.get(), id_str, current_function);

        auto temp_f = falseBB;
        falseBB = bb_next; //更新falseBB
        node.lhs->accept(*this);
        falseBB = temp_f;
        //检查返回值类型
        if (recent_value->get_type() == INT32_T)
            recent_value = builder->create_icmp_ne(recent_value, CONST_INT(0));
        else if (recent_value->get_type() == FLOAT_T)
            recent_value = builder->create_fcmp_ne(recent_value, CONST_FLOAT(0));
        //不是br
        if (recent_value->get_type() != VOID_T)
            recent_value = builder->create_cond_br(recent_value, trueBB, bb_next);

        current_bb = bb_next;
        builder->set_insert_point(bb_next);
        node.rhs->accept(*this);
        //检查返回值类型
        if (recent_value->get_type() == INT32_T)
            recent_value = builder->create_icmp_ne(recent_value, CONST_INT(0));
        else if (recent_value->get_type() == FLOAT_T)
            recent_value = builder->create_fcmp_ne(recent_value, CONST_FLOAT(0));
        //不是br
        if (recent_value->get_type() != VOID_T)
            recent_value = builder->create_cond_br(recent_value, trueBB, falseBB);
    }
    else
    {
        node.lhs->accept(*this); //依次访问左右操作数
        auto lhs = recent_value;
        node.rhs->accept(*this);
        auto rhs = recent_value;
        // int-->float
        if (lhs->get_type() == INT32_T && rhs->get_type() == FLOAT_T)
            lhs = builder->create_sitofp(lhs, FLOAT_T);
        if (rhs->get_type() == INT32_T && lhs->get_type() == FLOAT_T)
            rhs = builder->create_sitofp(rhs, FLOAT_T);
        // int1-->int32
        if (lhs->get_type() == INT1_T && rhs->get_type() == INT32_T)
            lhs = builder->create_zext(lhs, INT32_T);
        if (rhs->get_type() == INT1_T && lhs->get_type() == INT32_T)
            rhs = builder->create_zext(rhs, INT32_T);
        // int1-->int32-->float
        if (lhs->get_type() == INT1_T && rhs->get_type() == FLOAT_T)
        {
            lhs = builder->create_zext(lhs, INT32_T);
            lhs = builder->create_sitofp(lhs, FLOAT_T);
        }
        if (rhs->get_type() == INT1_T && lhs->get_type() == FLOAT_T)
        {
            rhs = builder->create_zext(rhs, INT32_T);
            rhs = builder->create_sitofp(rhs, FLOAT_T);
        }

        if (lhs->get_type() == FLOAT_T)
        {
            switch (op)
            {
            case SyntaxTree::BinaryCondOp::EQ:
                recent_value = builder->create_fcmp_eq(lhs, rhs);
                break;
            case SyntaxTree::BinaryCondOp::NEQ:
                recent_value = builder->create_fcmp_ne(lhs, rhs);
                break;
            case SyntaxTree::BinaryCondOp::LT:
                recent_value = builder->create_fcmp_lt(lhs, rhs);
                break;
            case SyntaxTree::BinaryCondOp::LTE:
                recent_value = builder->create_fcmp_le(lhs, rhs);
                break;
            case SyntaxTree::BinaryCondOp::GT:
                recent_value = builder->create_fcmp_gt(lhs, rhs);
                break;
            case SyntaxTree::BinaryCondOp::GTE:
                recent_value = builder->create_fcmp_ge(lhs, rhs);
                break;
            default:
                break;
            }
        }
        else
        {
            switch (op)
            {
            case SyntaxTree::BinaryCondOp::EQ:
                recent_value = builder->create_icmp_eq(lhs, rhs);
                break;
            case SyntaxTree::BinaryCondOp::NEQ:
                recent_value = builder->create_icmp_ne(lhs, rhs);
                break;
            case SyntaxTree::BinaryCondOp::LT:
                recent_value = builder->create_icmp_lt(lhs, rhs);
                break;
            case SyntaxTree::BinaryCondOp::LTE:
                recent_value = builder->create_icmp_le(lhs, rhs);
                break;
            case SyntaxTree::BinaryCondOp::GT:
                recent_value = builder->create_icmp_gt(lhs, rhs);
                break;
            case SyntaxTree::BinaryCondOp::GTE:
                recent_value = builder->create_icmp_ge(lhs, rhs);
                break;
            default:
                break;
            }
        }
    }
}

void IRBuilder::visit(SyntaxTree::BinaryExpr &node)
{
    node.lhs->accept(*this);
    auto lhs = recent_value;
    node.rhs->accept(*this);
    auto rhs = recent_value;
    auto op = node.op;

    //两边都是常数，产生constant
    if (dynamic_cast<ConstantInt *>(lhs) && dynamic_cast<ConstantInt *>(rhs))
    {
        int ltmp = dynamic_cast<ConstantInt *>(lhs)->get_value();
        int rtmp = dynamic_cast<ConstantInt *>(rhs)->get_value();
        switch (op)
        {
        case SyntaxTree::BinOp::PLUS:
            recent_value = ConstantInt::get(ltmp + rtmp, module.get());
            break;
        case SyntaxTree::BinOp::MINUS:
            recent_value = ConstantInt::get(ltmp - rtmp, module.get());
            break;
        case SyntaxTree::BinOp::MULTIPLY:
            recent_value = ConstantInt::get(ltmp * rtmp, module.get());
            break;
        case SyntaxTree::BinOp::DIVIDE:
            recent_value = ConstantInt::get(ltmp / rtmp, module.get());
            break;
        case SyntaxTree::BinOp::MODULO:
            recent_value = ConstantInt::get(ltmp % rtmp, module.get());
            break;
        default:
            break;
        }
    }
    else if (dynamic_cast<ConstantFloat *>(lhs) && dynamic_cast<ConstantFloat *>(rhs))
    {
        float ltmp = dynamic_cast<ConstantFloat *>(lhs)->get_value();
        float rtmp = dynamic_cast<ConstantFloat *>(rhs)->get_value();
        switch (op)
        {
        case SyntaxTree::BinOp::PLUS:
            recent_value = ConstantFloat::get(ltmp + rtmp, module.get());
            break;
        case SyntaxTree::BinOp::MINUS:
            recent_value = ConstantFloat::get(ltmp - rtmp, module.get());
            break;
        case SyntaxTree::BinOp::MULTIPLY:
            recent_value = ConstantFloat::get(ltmp * rtmp, module.get());
            break;
        case SyntaxTree::BinOp::DIVIDE:
            recent_value = ConstantFloat::get(ltmp / rtmp, module.get());
            break;
        default:
            break;
        }
    }
    else if (dynamic_cast<ConstantInt *>(lhs) && dynamic_cast<ConstantFloat *>(rhs))
    {
        int ltmp = dynamic_cast<ConstantInt *>(lhs)->get_value();
        float rtmp = dynamic_cast<ConstantFloat *>(rhs)->get_value();
        switch (op)
        {
        case SyntaxTree::BinOp::PLUS:
            recent_value = ConstantFloat::get(ltmp + rtmp, module.get());
            break;
        case SyntaxTree::BinOp::MINUS:
            recent_value = ConstantFloat::get(ltmp - rtmp, module.get());
            break;
        case SyntaxTree::BinOp::MULTIPLY:
            recent_value = ConstantFloat::get(ltmp * rtmp, module.get());
            break;
        case SyntaxTree::BinOp::DIVIDE:
            recent_value = ConstantFloat::get(ltmp / rtmp, module.get());
            break;
        default:
            break;
        }
    }
    else if (dynamic_cast<ConstantFloat *>(lhs) && dynamic_cast<ConstantInt *>(rhs))
    {
        float ltmp = dynamic_cast<ConstantFloat *>(lhs)->get_value();
        int rtmp = dynamic_cast<ConstantInt *>(rhs)->get_value();
        switch (op)
        {
        case SyntaxTree::BinOp::PLUS:
            recent_value = ConstantFloat::get(ltmp + rtmp, module.get());
            break;
        case SyntaxTree::BinOp::MINUS:
            recent_value = ConstantFloat::get(ltmp - rtmp, module.get());
            break;
        case SyntaxTree::BinOp::MULTIPLY:
            recent_value = ConstantFloat::get(ltmp * rtmp, module.get());
            break;
        case SyntaxTree::BinOp::DIVIDE:
            recent_value = ConstantFloat::get(ltmp / rtmp, module.get());
            break;
        default:
            break;
        }
    }
    else
    {
        // int-->float
        if (lhs->get_type() == INT32_T && rhs->get_type() == FLOAT_T)
            lhs = builder->create_sitofp(lhs, FLOAT_T);
        if (rhs->get_type() == INT32_T && lhs->get_type() == FLOAT_T)
            rhs = builder->create_sitofp(rhs, FLOAT_T);
        // int1-->int32
        if (lhs->get_type() == INT1_T && rhs->get_type() == INT32_T)
            lhs = builder->create_zext(lhs, INT32_T);
        if (rhs->get_type() == INT1_T && lhs->get_type() == INT32_T)
            rhs = builder->create_zext(rhs, INT32_T);
        // int1-->int32-->float
        if (lhs->get_type() == INT1_T && rhs->get_type() == FLOAT_T)
        {
            lhs = builder->create_zext(lhs, INT32_T);
            lhs = builder->create_sitofp(lhs, FLOAT_T);
        }
        if (rhs->get_type() == INT1_T && lhs->get_type() == FLOAT_T)
        {
            rhs = builder->create_zext(rhs, INT32_T);
            rhs = builder->create_sitofp(rhs, FLOAT_T);
        }

        //结果为int
        if (rhs->get_type() == INT32_T)
        {
            switch (op)
            {
            case SyntaxTree::BinOp::PLUS:
                recent_value = builder->create_iadd(lhs, rhs);
                break;
            case SyntaxTree::BinOp::MINUS:
                recent_value = builder->create_isub(lhs, rhs);
                break;
            case SyntaxTree::BinOp::MULTIPLY:
                recent_value = builder->create_imul(lhs, rhs);
                break;
            case SyntaxTree::BinOp::DIVIDE:
                recent_value = builder->create_isdiv(lhs, rhs);
                break;
            case SyntaxTree::BinOp::MODULO:
                recent_value = builder->create_isrem(lhs, rhs);
                break;
            default:
                break;
            }
        }
        //结果为float
        else
        {
            switch (op)
            {
            case SyntaxTree::BinOp::PLUS:
                recent_value = builder->create_fadd(lhs, rhs);
                break;
            case SyntaxTree::BinOp::MINUS:
                recent_value = builder->create_fsub(lhs, rhs);
                break;
            case SyntaxTree::BinOp::MULTIPLY:
                recent_value = builder->create_fmul(lhs, rhs);
                break;
            case SyntaxTree::BinOp::DIVIDE:
                recent_value = builder->create_fdiv(lhs, rhs);
                break;
            default:
                break;
            }
        }
    }
}

void IRBuilder::visit(SyntaxTree::UnaryExpr &node)
{
    node.rhs->accept(*this);
    auto rhs = recent_value;
    auto op = node.op;

    if (dynamic_cast<ConstantInt *>(rhs) && op == SyntaxTree::UnaryOp::MINUS)
    {
        int tmp = dynamic_cast<ConstantInt *>(rhs)->get_value();
        recent_value = ConstantInt::get(-1 * tmp, module.get());
    }
    else if (dynamic_cast<ConstantFloat *>(rhs) && op == SyntaxTree::UnaryOp::MINUS)
    {
        float tmp = dynamic_cast<ConstantFloat *>(rhs)->get_value();
        recent_value = ConstantFloat::get(-1.0 * tmp, module.get());
    }
    else
    {
        // INT1-->INT32
        if (rhs->get_type() == INT1_T)
            rhs = builder->create_zext(rhs, INT32_T);

        if (op == SyntaxTree::UnaryOp::MINUS)
        {
            if (rhs->get_type() == FLOAT_T)
                recent_value = builder->create_fmul(rhs, CONST_FLOAT(-1));
            else
                recent_value = builder->create_imul(rhs, CONST_INT(-1));
        }
    }
}

void IRBuilder::visit(SyntaxTree::FuncCallStmt &node)
{
    Function *Fun = (Function *)scope.find(node.name, true);
    //获取函数的形参,用于类型检查
    std::vector<Value *> args;
    for (auto arg = Fun->arg_begin(); arg != Fun->arg_end(); arg++)
        args.push_back(*arg);
    //实参列表生成
    int i = 0;
    std::vector<Value *> func_args; //函数调用实参列表
    for (auto param : node.params)
    {
        param->accept(*this);
        // int-->float
        if (recent_value->get_type() == INT32_T && args[i]->get_type() == FLOAT_T)
        {
            auto tmp = builder->create_sitofp(recent_value, FLOAT_T);
            func_args.push_back(tmp);
        }
        // float-->int
        else if (recent_value->get_type() == FLOAT_T && args[i]->get_type() == INT32_T)
        {
            auto tmp = builder->create_fptosi(recent_value, INT32_T);
            func_args.push_back(tmp);
        }
        else
        {
            func_args.push_back(recent_value);
        }
        i++;
    }
    recent_value = builder->create_call(Fun, func_args);
}

void IRBuilder::visit(SyntaxTree::IfStmt &node)
{
    //进入if结点的时候要先存储之前的trueBB和falseBB,退出结点的时候恢复
    auto temp_t = trueBB;
    auto temp_f = falseBB;

    std::string id_str;
    id_str = std::to_string(id++);
    trueBB = BasicBlock::create(module.get(), id_str, current_function); // true分支
    id_str = std::to_string(id++);
    falseBB = BasicBlock::create(module.get(), id_str, current_function); // false分支
    // if语句后的下一个基本块
    BasicBlock *nextBB_if;
    if (node.else_statement != nullptr)
    {
        id_str = std::to_string(id++);
        nextBB_if = BasicBlock::create(module.get(), id_str, current_function);
    }
    else
        nextBB_if = falseBB;

    node.cond_exp->accept(*this); //访问条件表达式
    //检查返回值是否为bool型
    if (recent_value->get_type() == INT32_T)
        recent_value = builder->create_icmp_ne(recent_value, CONST_INT(0));
    else if (recent_value->get_type() == FLOAT_T)
        recent_value = builder->create_fcmp_ne(recent_value, CONST_FLOAT(0));
    //如果已经发射了br指令，则recent_value->get_type() == VOID_T,不做处理
    if (recent_value->get_type() != VOID_T)
        builder->create_cond_br(recent_value, trueBB, falseBB);

    bool next = false;

    current_bb = trueBB;
    builder->set_insert_point(trueBB); // if true
    node.if_statement->accept(*this);
    if (!current_bb->get_terminator())
    {
        next = true; //nextBB_if可达
        builder->create_br(nextBB_if);
    }

    //存在else分支
    if (node.else_statement != nullptr)
    {
        current_bb = falseBB;
        builder->set_insert_point(falseBB);
        node.else_statement->accept(*this);
        if (!current_bb->get_terminator())
        {
            next = true; //nextBB_if可达
            builder->create_br(nextBB_if);
        }
    }

    //nextBB_if不可达
    if (!next && node.else_statement)
        nextBB_if->erase_from_parent();
    else
    {
        current_bb = nextBB_if;
        builder->set_insert_point(nextBB_if);
    }

    trueBB = temp_t;
    falseBB = temp_f;
}

void IRBuilder::visit(SyntaxTree::WhileStmt &node)
{
    //进入while结点的时候要先缓存之前的基本块
    auto temp_condBB = condBB_while;
    auto temp_trueBB = trueBB;
    auto temp_falseBB = falseBB;
    auto temp_nextBB_while = nextBB_while;

    std::string id_str;
    id_str = std::to_string(id++);
    condBB_while = BasicBlock::create(module.get(), id_str, current_function); // 条件BB
    id_str = std::to_string(id++);
    trueBB = BasicBlock::create(module.get(), id_str, current_function); // true分支
    id_str = std::to_string(id++);
    falseBB = BasicBlock::create(module.get(), id_str, current_function); // false分支
    nextBB_while = falseBB;

    builder->create_br(condBB_while);
    current_bb = condBB_while;
    builder->set_insert_point(condBB_while);
    node.cond_exp->accept(*this); //访问条件表达式
    //检查返回值是否为bool型
    if (recent_value->get_type() == INT32_T)
        recent_value = builder->create_icmp_ne(recent_value, CONST_INT(0));
    else if (recent_value->get_type() == FLOAT_T)
        recent_value = builder->create_fcmp_ne(recent_value, CONST_FLOAT(0));
    //如果已经发射了br指令，则recent_value->get_type() == VOID_T,不做处理
    if (recent_value->get_type() != VOID_T)
        builder->create_cond_br(recent_value, trueBB, falseBB);

    current_bb = trueBB;
    builder->set_insert_point(trueBB);
    node.statement->accept(*this);
    if (!current_bb->get_terminator())
        builder->create_br(condBB_while);

    current_bb = nextBB_while;
    builder->set_insert_point(nextBB_while);

    //退出while结点的时候要恢复之前的基本块
    condBB_while = temp_condBB;
    trueBB = temp_trueBB;
    falseBB = temp_falseBB;
    nextBB_while = temp_nextBB_while;
}

void IRBuilder::visit(SyntaxTree::BreakStmt &node)
{
    recent_value = builder->create_br(nextBB_while);
}

void IRBuilder::visit(SyntaxTree::ContinueStmt &node)
{
    recent_value = builder->create_br(condBB_while);
}
