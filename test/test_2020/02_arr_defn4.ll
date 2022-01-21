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
  store i32 5, i32* %op6
  store i32 6, i32* %op7
  store i32 7, i32* %op8
  store i32 8, i32* %op9
  %op18 = alloca [4 x [2 x i32]]
  %op19 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op1, i32 0, i32 0
  %op20 = getelementptr [2 x i32], [2 x i32]* %op19, i32 0, i32 0
  %op21 = load i32, i32* %op20
  %op23 = getelementptr [2 x i32], [2 x i32]* %op19, i32 0, i32 1
  %op24 = load i32, i32* %op23
  %op25 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op18, i32 0, i32 0, i32 0
  store i32 0, i32* %op25
  %op26 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op18, i32 0, i32 0, i32 1
  store i32 0, i32* %op26
  %op27 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op18, i32 0, i32 1, i32 0
  store i32 0, i32* %op27
  %op28 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op18, i32 0, i32 1, i32 1
  store i32 0, i32* %op28
  %op29 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op18, i32 0, i32 2, i32 0
  store i32 0, i32* %op29
  %op30 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op18, i32 0, i32 2, i32 1
  store i32 0, i32* %op30
  %op31 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op18, i32 0, i32 3, i32 0
  store i32 0, i32* %op31
  %op32 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op18, i32 0, i32 3, i32 1
  store i32 0, i32* %op32
  store i32 %op21, i32* %op25
  store i32 %op24, i32* %op26
  store i32 3, i32* %op27
  store i32 4, i32* %op28
  store i32 5, i32* %op29
  store i32 6, i32* %op30
  store i32 7, i32* %op31
  store i32 8, i32* %op32
  %op41 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op18, i32 0, i32 0
  %op42 = getelementptr [2 x i32], [2 x i32]* %op41, i32 0, i32 0
  %op43 = load i32, i32* %op42
  %op44 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %op18, i32 0, i32 3
  %op45 = getelementptr [2 x i32], [2 x i32]* %op44, i32 0, i32 1
  %op46 = load i32, i32* %op45
  %op47 = add i32 %op43, %op46
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op47
}
