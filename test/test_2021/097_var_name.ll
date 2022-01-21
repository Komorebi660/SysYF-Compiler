declare void @put_int(i32)

declare void @put_char(i32)

define i32 @main() {
label_entry:
  %op3 = alloca [20 x i32]
  %op4 = getelementptr [20 x i32], [20 x i32]* %op3, i32 0, i32 0
  store i32 0, i32* %op4
  %op5 = getelementptr [20 x i32], [20 x i32]* %op3, i32 0, i32 1
  store i32 0, i32* %op5
  %op6 = getelementptr [20 x i32], [20 x i32]* %op3, i32 0, i32 2
  store i32 0, i32* %op6
  %op7 = getelementptr [20 x i32], [20 x i32]* %op3, i32 0, i32 3
  store i32 0, i32* %op7
  %op8 = getelementptr [20 x i32], [20 x i32]* %op3, i32 0, i32 4
  store i32 0, i32* %op8
  %op9 = getelementptr [20 x i32], [20 x i32]* %op3, i32 0, i32 5
  store i32 0, i32* %op9
  %op10 = getelementptr [20 x i32], [20 x i32]* %op3, i32 0, i32 6
  store i32 0, i32* %op10
  %op11 = getelementptr [20 x i32], [20 x i32]* %op3, i32 0, i32 7
  store i32 0, i32* %op11
  %op12 = getelementptr [20 x i32], [20 x i32]* %op3, i32 0, i32 8
  store i32 0, i32* %op12
  %op13 = getelementptr [20 x i32], [20 x i32]* %op3, i32 0, i32 9
  store i32 0, i32* %op13
  %op14 = getelementptr [20 x i32], [20 x i32]* %op3, i32 0, i32 10
  store i32 0, i32* %op14
  %op15 = getelementptr [20 x i32], [20 x i32]* %op3, i32 0, i32 11
  store i32 0, i32* %op15
  %op16 = getelementptr [20 x i32], [20 x i32]* %op3, i32 0, i32 12
  store i32 0, i32* %op16
  %op17 = getelementptr [20 x i32], [20 x i32]* %op3, i32 0, i32 13
  store i32 0, i32* %op17
  %op18 = getelementptr [20 x i32], [20 x i32]* %op3, i32 0, i32 14
  store i32 0, i32* %op18
  %op19 = getelementptr [20 x i32], [20 x i32]* %op3, i32 0, i32 15
  store i32 0, i32* %op19
  %op20 = getelementptr [20 x i32], [20 x i32]* %op3, i32 0, i32 16
  store i32 0, i32* %op20
  %op21 = getelementptr [20 x i32], [20 x i32]* %op3, i32 0, i32 17
  store i32 0, i32* %op21
  %op22 = getelementptr [20 x i32], [20 x i32]* %op3, i32 0, i32 18
  store i32 0, i32* %op22
  %op23 = getelementptr [20 x i32], [20 x i32]* %op3, i32 0, i32 19
  store i32 0, i32* %op23
  store i32 1, i32* %op4
  store i32 2, i32* %op5
  br label %label_1
label_ret:                                                ; preds = %label_1
  ret i32 %op58
label_1:                                                ; preds = %label_entry, %label_2
  %op57 = phi i32 [ 2, %label_entry ], [ %op55, %label_2 ]
  %op58 = phi i32 [ 0, %label_entry ], [ %op50, %label_2 ]
  %op30 = icmp slt i32 %op57, 20
  br i1 %op30, label %label_2, label %label_ret
label_2:                                                ; preds = %label_1
  %op32 = getelementptr [20 x i32], [20 x i32]* %op3, i32 0, i32 %op57
  %op33 = load i32, i32* %op32
  %op35 = sub i32 %op57, 1
  %op36 = getelementptr [20 x i32], [20 x i32]* %op3, i32 0, i32 %op35
  %op37 = load i32, i32* %op36
  %op38 = add i32 %op33, %op37
  %op40 = sub i32 %op57, 2
  %op41 = getelementptr [20 x i32], [20 x i32]* %op3, i32 0, i32 %op40
  %op42 = load i32, i32* %op41
  %op43 = add i32 %op38, %op42
  store i32 %op43, i32* %op32
  %op49 = load i32, i32* %op32
  %op50 = add i32 %op58, %op49
  %op53 = load i32, i32* %op32
  call void @put_int(i32 %op53)
  call void @put_char(i32 10)
  %op55 = add i32 %op57, 1
  br label %label_1
}
