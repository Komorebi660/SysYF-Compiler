@a = constant [5 x i32] [i32 2, i32 11, i32 3, i32 13, i32 14]
define i32 @func(i32* %arg0) {
label_entry:
  %op4 = getelementptr i32, i32* %arg0, i32 3
  %op5 = load i32, i32* %op4
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op5
}
define i32 @main() {
label_entry:
  %op2 = alloca [4 x i32]
  %op4 = getelementptr [5 x i32], [5 x i32]* @a, i32 0, i32 0
  %op5 = load i32, i32* %op4
  %op8 = load i32, i32* %op4
  %op9 = getelementptr [5 x i32], [5 x i32]* @a, i32 0, i32 %op8
  %op10 = load i32, i32* %op9
  %op11 = add i32 %op5, %op10
  %op12 = getelementptr [4 x i32], [4 x i32]* %op2, i32 0, i32 0
  store i32 0, i32* %op12
  %op13 = getelementptr [4 x i32], [4 x i32]* %op2, i32 0, i32 1
  store i32 0, i32* %op13
  %op14 = getelementptr [4 x i32], [4 x i32]* %op2, i32 0, i32 2
  store i32 0, i32* %op14
  %op15 = getelementptr [4 x i32], [4 x i32]* %op2, i32 0, i32 3
  store i32 0, i32* %op15
  store i32 0, i32* %op12
  store i32 0, i32* %op13
  store i32 0, i32* %op14
  store i32 %op11, i32* %op15
  %op21 = call i32 @func(i32* %op12)
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op21
}
