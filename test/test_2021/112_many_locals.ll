declare void @put_int(i32)

declare void @put_char(i32)

define i32 @foo() {
label_entry:
  %op1 = alloca [16 x i32]
  %op2 = getelementptr [16 x i32], [16 x i32]* %op1, i32 0, i32 0
  store i32 0, i32* %op2
  %op3 = getelementptr [16 x i32], [16 x i32]* %op1, i32 0, i32 1
  store i32 0, i32* %op3
  %op4 = getelementptr [16 x i32], [16 x i32]* %op1, i32 0, i32 2
  store i32 0, i32* %op4
  %op5 = getelementptr [16 x i32], [16 x i32]* %op1, i32 0, i32 3
  store i32 0, i32* %op5
  %op6 = getelementptr [16 x i32], [16 x i32]* %op1, i32 0, i32 4
  store i32 0, i32* %op6
  %op7 = getelementptr [16 x i32], [16 x i32]* %op1, i32 0, i32 5
  store i32 0, i32* %op7
  %op8 = getelementptr [16 x i32], [16 x i32]* %op1, i32 0, i32 6
  store i32 0, i32* %op8
  %op9 = getelementptr [16 x i32], [16 x i32]* %op1, i32 0, i32 7
  store i32 0, i32* %op9
  %op10 = getelementptr [16 x i32], [16 x i32]* %op1, i32 0, i32 8
  store i32 0, i32* %op10
  %op11 = getelementptr [16 x i32], [16 x i32]* %op1, i32 0, i32 9
  store i32 0, i32* %op11
  %op12 = getelementptr [16 x i32], [16 x i32]* %op1, i32 0, i32 10
  store i32 0, i32* %op12
  %op13 = getelementptr [16 x i32], [16 x i32]* %op1, i32 0, i32 11
  store i32 0, i32* %op13
  %op14 = getelementptr [16 x i32], [16 x i32]* %op1, i32 0, i32 12
  store i32 0, i32* %op14
  %op15 = getelementptr [16 x i32], [16 x i32]* %op1, i32 0, i32 13
  store i32 0, i32* %op15
  %op16 = getelementptr [16 x i32], [16 x i32]* %op1, i32 0, i32 14
  store i32 0, i32* %op16
  %op17 = getelementptr [16 x i32], [16 x i32]* %op1, i32 0, i32 15
  store i32 0, i32* %op17
  store i32 0, i32* %op2
  store i32 1, i32* %op3
  store i32 2, i32* %op4
  store i32 3, i32* %op5
  store i32 0, i32* %op6
  store i32 1, i32* %op7
  store i32 2, i32* %op8
  store i32 3, i32* %op9
  store i32 0, i32* %op10
  store i32 1, i32* %op11
  store i32 2, i32* %op12
  store i32 3, i32* %op13
  store i32 0, i32* %op14
  store i32 1, i32* %op15
  store i32 2, i32* %op16
  store i32 3, i32* %op17
  %op87 = load i32, i32* %op5
  %op88 = add i32 71, %op87
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op88
}
define i32 @main() {
label_entry:
  %op50 = call i32 @foo()
  %op51 = add i32 30, %op50
  %op61 = call i32 @foo()
  %op62 = add i32 41, %op61
  %op90 = add i32 %op51, %op62
  %op92 = add i32 %op90, 35
  call void @put_int(i32 %op92)
  call void @put_char(i32 10)
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 0
}
