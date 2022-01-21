@field = global [2 x i32] zeroinitializer
define i32 @func(i32* %arg0) {
label_entry:
  %op3 = getelementptr [2 x i32], [2 x i32]* @field, i32 0, i32 0
  %op4 = load i32, i32* %op3
  %op5 = sub i32 3, %op4
  %op7 = getelementptr i32, i32* %arg0, i32 %op5
  %op8 = load i32, i32* %op7
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op8
}
define i32 @main() {
label_entry:
  %op2 = alloca [3 x i32]
  %op4 = getelementptr [2 x i32], [2 x i32]* @field, i32 0, i32 0
  store i32 1, i32* %op4
  %op5 = getelementptr [2 x i32], [2 x i32]* @field, i32 0, i32 1
  store i32 2, i32* %op5
  %op6 = getelementptr [3 x i32], [3 x i32]* %op2, i32 0, i32 0
  store i32 -1, i32* %op6
  %op8 = load i32, i32* %op6
  %op9 = sub i32 %op8, 2
  %op10 = getelementptr [3 x i32], [3 x i32]* %op2, i32 0, i32 1
  store i32 %op9, i32* %op10
  %op12 = load i32, i32* %op10
  %op13 = getelementptr [3 x i32], [3 x i32]* %op2, i32 0, i32 2
  store i32 16, i32* %op13
  %op15 = call i32 @func(i32* %op6)
  %op16 = add i32 %op15, 2
  %op18 = add i32 %op16, %op12
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op18
}
