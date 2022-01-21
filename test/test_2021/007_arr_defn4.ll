define i32 @main() {
label_entry:
  %op1 = alloca [4 x [2 x i32]]
  %op2 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op1, i32 0, i32 0, i32 0
  store i32 0, i32* %op2
  %op3 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op1, i32 0, i32 0, i32 1
  store i32 0, i32* %op3
  %op4 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op1, i32 0, i32 1, i32 0
  store i32 0, i32* %op4
  %op5 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op1, i32 0, i32 1, i32 1
  store i32 0, i32* %op5
  %op6 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op1, i32 0, i32 2, i32 0
  store i32 0, i32* %op6
  %op7 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op1, i32 0, i32 2, i32 1
  store i32 0, i32* %op7
  %op8 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op1, i32 0, i32 3, i32 0
  store i32 0, i32* %op8
  %op9 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op1, i32 0, i32 3, i32 1
  store i32 0, i32* %op9
  store i32 1, i32* %op2
  store i32 2, i32* %op3
  store i32 3, i32* %op4
  store i32 4, i32* %op5
  store i32 7, i32* %op8
  %op16 = alloca [4 x [2 x i32]]
  %op17 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op16, i32 0, i32 0, i32 0
  store i32 0, i32* %op17
  %op18 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op16, i32 0, i32 0, i32 1
  store i32 0, i32* %op18
  %op19 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op16, i32 0, i32 1, i32 0
  store i32 0, i32* %op19
  %op20 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op16, i32 0, i32 1, i32 1
  store i32 0, i32* %op20
  %op21 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op16, i32 0, i32 2, i32 0
  store i32 0, i32* %op21
  %op22 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op16, i32 0, i32 2, i32 1
  store i32 0, i32* %op22
  %op23 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op16, i32 0, i32 3, i32 0
  store i32 0, i32* %op23
  %op24 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op16, i32 0, i32 3, i32 1
  store i32 0, i32* %op24
  %op25 = alloca [4 x [2 x i32]]
  %op26 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op25, i32 0, i32 0, i32 0
  store i32 0, i32* %op26
  %op27 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op25, i32 0, i32 0, i32 1
  store i32 0, i32* %op27
  %op28 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op25, i32 0, i32 1, i32 0
  store i32 0, i32* %op28
  %op29 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op25, i32 0, i32 1, i32 1
  store i32 0, i32* %op29
  %op30 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op25, i32 0, i32 2, i32 0
  store i32 0, i32* %op30
  %op31 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op25, i32 0, i32 2, i32 1
  store i32 0, i32* %op31
  %op32 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op25, i32 0, i32 3, i32 0
  store i32 0, i32* %op32
  %op33 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op25, i32 0, i32 3, i32 1
  store i32 0, i32* %op33
  store i32 1, i32* %op26
  store i32 2, i32* %op27
  store i32 3, i32* %op28
  store i32 4, i32* %op29
  store i32 5, i32* %op30
  store i32 6, i32* %op31
  store i32 7, i32* %op32
  store i32 8, i32* %op33
  %op42 = alloca [4 x [2 x i32]]
  %op43 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op1, i32 0, i32 3
  %op44 = getelementptr [2 x i32], [2 x i32]* %op43, i32 0, i32 0
  %op45 = load i32, i32* %op44
  %op46 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op42, i32 0, i32 0, i32 0
  store i32 0, i32* %op46
  %op47 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op42, i32 0, i32 0, i32 1
  store i32 0, i32* %op47
  %op48 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op42, i32 0, i32 1, i32 0
  store i32 0, i32* %op48
  %op49 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op42, i32 0, i32 1, i32 1
  store i32 0, i32* %op49
  %op50 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op42, i32 0, i32 2, i32 0
  store i32 0, i32* %op50
  %op51 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op42, i32 0, i32 2, i32 1
  store i32 0, i32* %op51
  %op52 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op42, i32 0, i32 3, i32 0
  store i32 0, i32* %op52
  %op53 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op42, i32 0, i32 3, i32 1
  store i32 0, i32* %op53
  store i32 1, i32* %op46
  store i32 2, i32* %op47
  store i32 3, i32* %op48
  store i32 5, i32* %op50
  store i32 %op45, i32* %op52
  store i32 8, i32* %op53
  %op60 = alloca [4 x [2 x [1 x i32]]]
  %op61 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op42, i32 0, i32 2
  %op62 = getelementptr [2 x i32], [2 x i32]* %op61, i32 0, i32 1
  %op63 = load i32, i32* %op62
  %op64 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op25, i32 0, i32 2
  %op65 = getelementptr [2 x i32], [2 x i32]* %op64, i32 0, i32 1
  %op66 = load i32, i32* %op65
  %op67 = getelementptr [4 x [2 x [1 x i32]]], [4 x [2 x [1 x i32]]]* %op60, i32 0, i32 0, i32 0, i32 0
  store i32 0, i32* %op67
  %op68 = getelementptr [4 x [2 x [1 x i32]]], [4 x [2 x [1 x i32]]]* %op60, i32 0, i32 0, i32 1, i32 0
  store i32 0, i32* %op68
  %op69 = getelementptr [4 x [2 x [1 x i32]]], [4 x [2 x [1 x i32]]]* %op60, i32 0, i32 1, i32 0, i32 0
  store i32 0, i32* %op69
  %op70 = getelementptr [4 x [2 x [1 x i32]]], [4 x [2 x [1 x i32]]]* %op60, i32 0, i32 1, i32 1, i32 0
  store i32 0, i32* %op70
  %op71 = getelementptr [4 x [2 x [1 x i32]]], [4 x [2 x [1 x i32]]]* %op60, i32 0, i32 2, i32 0, i32 0
  store i32 0, i32* %op71
  %op72 = getelementptr [4 x [2 x [1 x i32]]], [4 x [2 x [1 x i32]]]* %op60, i32 0, i32 2, i32 1, i32 0
  store i32 0, i32* %op72
  %op73 = getelementptr [4 x [2 x [1 x i32]]], [4 x [2 x [1 x i32]]]* %op60, i32 0, i32 3, i32 0, i32 0
  store i32 0, i32* %op73
  %op74 = getelementptr [4 x [2 x [1 x i32]]], [4 x [2 x [1 x i32]]]* %op60, i32 0, i32 3, i32 1, i32 0
  store i32 0, i32* %op74
  store i32 %op63, i32* %op67
  store i32 %op66, i32* %op68
  store i32 3, i32* %op69
  store i32 4, i32* %op70
  store i32 5, i32* %op71
  store i32 6, i32* %op72
  store i32 7, i32* %op73
  store i32 8, i32* %op74
  %op83 = getelementptr [4 x [2 x [1 x i32]]], [4 x [2 x [1 x i32]]]* %op60, i32 0, i32 3
  %op84 = getelementptr [2 x [1 x i32]], [2 x [1 x i32]]* %op83, i32 0, i32 1
  %op85 = getelementptr [1 x i32], [1 x i32]* %op84, i32 0, i32 0
  %op86 = load i32, i32* %op85
  %op87 = getelementptr [4 x [2 x [1 x i32]]], [4 x [2 x [1 x i32]]]* %op60, i32 0, i32 0
  %op88 = getelementptr [2 x [1 x i32]], [2 x [1 x i32]]* %op87, i32 0, i32 0
  %op89 = getelementptr [1 x i32], [1 x i32]* %op88, i32 0, i32 0
  %op90 = load i32, i32* %op89
  %op91 = add i32 %op86, %op90
  %op93 = getelementptr [2 x [1 x i32]], [2 x [1 x i32]]* %op87, i32 0, i32 1
  %op94 = getelementptr [1 x i32], [1 x i32]* %op93, i32 0, i32 0
  %op95 = load i32, i32* %op94
  %op96 = add i32 %op91, %op95
  %op97 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op42, i32 0, i32 3
  %op98 = getelementptr [2 x i32], [2 x i32]* %op97, i32 0, i32 0
  %op99 = load i32, i32* %op98
  %op100 = add i32 %op96, %op99
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op100
}
