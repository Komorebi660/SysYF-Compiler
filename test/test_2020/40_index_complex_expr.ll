declare void @put_int(i32)

define i32 @main() {
label_entry:
  %op5 = alloca [5 x i32]
  %op6 = getelementptr [5 x i32], [5 x i32]* %op5, i32 0, i32 0
  store i32 1, i32* %op6
  %op7 = getelementptr [5 x i32], [5 x i32]* %op5, i32 0, i32 1
  store i32 2, i32* %op7
  %op8 = getelementptr [5 x i32], [5 x i32]* %op5, i32 0, i32 2
  store i32 3, i32* %op8
  %op9 = getelementptr [5 x i32], [5 x i32]* %op5, i32 0, i32 3
  store i32 4, i32* %op9
  %op10 = getelementptr [5 x i32], [5 x i32]* %op5, i32 0, i32 4
  store i32 5, i32* %op10
  %op27 = load i32, i32* %op9
  call void @put_int(i32 %op27)
  %op43 = load i32, i32* %op10
  call void @put_int(i32 %op43)
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 0
}
