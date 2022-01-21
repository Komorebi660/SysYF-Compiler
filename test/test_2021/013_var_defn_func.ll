@a = constant [10 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10]
@b = global [5 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5]
define i32 @func(i32* %arg0, i32* %arg1) {
label_entry:
  %op6 = getelementptr i32, i32* %arg0, i32 0
  %op7 = load i32, i32* %op6
  %op9 = getelementptr i32, i32* %arg0, i32 1
  %op10 = load i32, i32* %op9
  %op11 = add i32 %op7, %op10
  %op13 = getelementptr i32, i32* %arg0, i32 2
  %op14 = load i32, i32* %op13
  %op15 = add i32 %op11, %op14
  %op17 = getelementptr i32, i32* %arg1, i32 3
  %op18 = load i32, i32* %op17
  %op19 = add i32 %op15, %op18
  %op21 = getelementptr i32, i32* %arg1, i32 4
  %op22 = load i32, i32* %op21
  %op23 = add i32 %op19, %op22
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op23
}
define i32 @main() {
label_entry:
  %op2 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 0
  %op3 = getelementptr [5 x i32], [5 x i32]* @b, i32 0, i32 0
  %op4 = call i32 @func(i32* %op2, i32* %op3)
  %op5 = sitofp i32 %op4 to float
  %op7 = fptosi float %op5 to i32
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op7
}
