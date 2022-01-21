@a = constant [5 x i32] [i32 2, i32 11, i32 3, i32 13, i32 14]
define i32 @main() {
label_entry:
  %op1 = alloca [3 x i32]
  %op2 = getelementptr [5 x i32], [5 x i32]* @a, i32 0, i32 4
  %op3 = load i32, i32* %op2
  %op4 = getelementptr [3 x i32], [3 x i32]* %op1, i32 0, i32 0
  store i32 0, i32* %op4
  %op5 = getelementptr [3 x i32], [3 x i32]* %op1, i32 0, i32 1
  store i32 0, i32* %op5
  %op6 = getelementptr [3 x i32], [3 x i32]* %op1, i32 0, i32 2
  store i32 0, i32* %op6
  store i32 0, i32* %op4
  store i32 0, i32* %op5
  store i32 %op3, i32* %op6
  %op11 = load i32, i32* %op6
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op11
}
