
# SysYF编译器

`SysYF`语言是在`2020`、`2021`年全国大学生计算机系统能力大赛编译系统设计赛要求实现的`SysY`语言基础上增加了`float`类型和元素类型为`float`的数组类型。本仓库是**2021年中国科学技术大学编译原理H**课程的实验项目。

## 目录结构

```
.
├── CMakeLists.txt
├── README.md
├── doc/                          #实验文档
│   ├── AST.md                    #语法树说明
│   ├── DeadCodeEli.pdf      
│   ├── Dominance.pdf        
│   ├── SysYFIR.md                #IR接口说明
│   └── SysYF语言定义.pdf
├── grammar/                      #词法和语法文件
│   ├── SysYFParser.yy
│   └── SysYFScanner.ll
├── include/                      #头文件
├── lib/
├── report/                       #实验报告
├── src                           #源代码
│   ├── ASTBuilder/
│   ├── ASTPrinter/
│   ├── Checker/                  #类型检查
│   ├── ErrorReporter/
│   ├── Frontend/
│   ├── Optimize/                 #优化算法
│   ├── SysYFIR/                  #IR构建
│   ├── SysYFIRBuilder/
│   └── main.cpp
└── test                          #测试集
    ├── test.py                   #测试脚本
    ├── test_2020/                #2020编译比赛测试集
    └── test_2021/                #2021编译比赛测试集
        
```

## 实验环境

- Ubuntu 20.04.6 LTS
- gcc 9.4.0 (Ubuntu 9.4.0-1ubuntu1~20.04.2) 
- GNU Make 4.2.1
- cmake 3.16.3
- flex 2.6.4
- bison 3.7.6
- clang 10.0.0-4ubuntu1 
- LLVM version 10.0.0

### 环境构建

实验框架搭建需要`flex`、`bison`(`3.7.6`及以上)、`clang`、`llvm`等工具，下面以`Ubuntu`为例安装上述工具:

```
sudo apt install flex

wget http://ftp.gnu.org/gnu/bison/bison-3.7.6.tar.gz
tar xvzf bison-3.7.6.tar.gz
cd bison-3.7.6
sudo ./configure
sudo make
sudo make install

sudo apt install clang
sudo apt install llvm
```

检查安装是否成功:

```
which flex
which bison
which clang
which lli
```

若能依次输出安装位置，则表明安装成功。

## 编译运行

在搭建好环境后，便可以开始编译`SysYF`编译器了，编译需要`cmake`及`make`工具链。在顶层目录下输入：

```
mkdir build
cd build
cmake ..
make
```

即可完成编译，在`build`目录下会出现可执行文件`compiler`.

你可以通过如下方式运行编译器:

```
./compiler [.sy文件路径] [参数] -o [生成文件路径]
```

参数主要如下：

- **-h** 或 **--help**: 打印提示信息
- **-p** 或 **--trace_parsing**: 打印文法扫描过程
- **-s** 或 **--trace_scanning**: 打印词法扫描过程
- **-emit-ast**: 从语法树复原代码
- **-emit-ir**: 生成IR
- **-check**: 类型检查
- **-O**: 将IR转化为SSA格式
- **-O -cse**: 开启公共子表达式删除优化
- **-O -cp**: 开启常量传播优化
- **-O -dce**: 开启死代码删除优化
- **-O2**: 开启全部优化

例如:

```
./compiler test.sy -emit-ir -O -cse -o test.ll
```

表示对`test.sy`分析，生成`IR`并执行`公共子表达式删除`优化，结果保存在`test.ll`文件中。

## 测试

仓库提供了编译大赛的测试样例以及python测试脚本，位于test目录下，在终端中输入:

```
python test.py
```

即可自动运行`test_2020`及`test_2021`下的测试点，本仓库的编译器能通过全部的测试点。

你还可以修改`python`脚本，添加测试目录以及更改编译选项。
