declare void @put_int(i32)

define i32 @main() {
label_entry:
  %op3 = alloca [3 x i32]
  %op4 = getelementptr [3 x i32], [3 x i32]* %op3, i32 0, i32 0
  store i32 1, i32* %op4
  %op5 = getelementptr [3 x i32], [3 x i32]* %op3, i32 0, i32 1
  store i32 2, i32* %op5
  %op6 = getelementptr [3 x i32], [3 x i32]* %op3, i32 0, i32 2
  store i32 3, i32* %op6
  %op16 = load i32, i32* %op6
  call void @put_int(i32 %op16)
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 0
}
