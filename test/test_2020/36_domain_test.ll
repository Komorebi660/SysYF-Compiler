@a = global [2 x i32] zeroinitializer
define i32 @func(i32* %arg0) {
label_entry:
  %op3 = getelementptr [2 x i32], [2 x i32]* @a, i32 0, i32 0
  store i32 1, i32* %op3
  %op5 = load i32, i32* %op3
  %op6 = sub i32 3, %op5
  %op8 = getelementptr i32, i32* %arg0, i32 %op6
  %op9 = load i32, i32* %op8
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op9
}
define i32 @main() {
label_entry:
  %op2 = alloca [3 x i32]
  %op3 = getelementptr [3 x i32], [3 x i32]* %op2, i32 0, i32 0
  store i32 -1, i32* %op3
  %op4 = getelementptr [3 x i32], [3 x i32]* %op2, i32 0, i32 1
  store i32 4, i32* %op4
  %op5 = getelementptr [3 x i32], [3 x i32]* %op2, i32 0, i32 2
  store i32 8, i32* %op5
  %op7 = call i32 @func(i32* %op3)
  %op10 = load i32, i32* %op4
  %op11 = add i32 %op7, %op10
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op11
}
