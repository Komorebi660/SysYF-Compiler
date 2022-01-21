#ifndef _SYSYF_CONSTANT_H_
#define _SYSYF_CONSTANT_H_
#include "User.h"
#include "Value.h"
#include "Type.h"

class Constant : public User
{
private:
    // int value;
public:
    Constant(Type *ty, const std::string &name = "", unsigned num_ops = 0)
        : User(ty, name, num_ops) {}
    ~Constant() = default;
};

class ConstantInt : public Constant
{
private:
    int value_;
    ConstantInt(Type* ty,int val) 
        : Constant(ty,"",0),value_(val) {}
public:
    
    static int get_value(ConstantInt *const_val) { return const_val->value_; }
    int get_value() { return value_; }
    static ConstantInt *get(int val, Module *m);
    static ConstantInt *get(bool val, Module *m);
    virtual std::string print() override;
};

class ConstantFloat : public Constant
{
private:
    float value_;
    ConstantFloat(Type* ty,float val) 
        : Constant(ty,"",0),value_(val) {}
public:
    
    static float get_value(ConstantFloat *const_val) { return const_val->value_; }
    float get_value() { return value_; }
    static ConstantFloat *get(float val, Module *m);
    virtual std::string print() override;
};

class ConstantArray : public Constant
{
private:
    std::vector<Constant*> const_array;

    ConstantArray(ArrayType *ty, const std::vector<Constant*> &val);
public:
    
    ~ConstantArray()=default;

    Constant* get_element_value(int index);

    unsigned get_size_of_array() { return const_array.size(); } 

    static ConstantArray *get(ArrayType *ty, const std::vector<Constant*> &val);

    virtual std::string print() override;
};

class ConstantZero : public Constant 
{
private:
    ConstantZero(Type *ty)
        : Constant(ty,"",0) {}
public:
    static ConstantZero *get(Type *ty, Module *m);
    virtual std::string print() override;
};

#endif //_SYSYF_CONSTANT_H_
