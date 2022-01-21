@N = global i32 zeroinitializer
declare i32 @get_int()

declare void @put_int(i32)

declare void @put_char(i32)

define i32 @insert(i32* %arg0, i32 %arg1) {
label_entry:
  br label %label_1
label_ret:                                                ; preds = %label_5
  ret i32 0
label_1:                                                ; preds = %label_entry, %label_2
  %op37 = phi i32 [ 0, %label_entry ], [ %op15, %label_2 ]
  %op11 = getelementptr i32, i32* %arg0, i32 %op37
  %op12 = load i32, i32* %op11
  %op13 = icmp sgt i32 %arg1, %op12
  br i1 %op13, label %label_4, label %label_3
label_2:                                                ; preds = %label_4
  %op15 = add i32 %op37, 1
  br label %label_1
label_3:                                                ; preds = %label_1, %label_4
  %op16 = load i32, i32* @N
  br label %label_5
label_4:                                                ; preds = %label_1
  %op18 = load i32, i32* @N
  %op19 = icmp slt i32 %op37, %op18
  br i1 %op19, label %label_2, label %label_3
label_5:                                                ; preds = %label_3, %label_6
  %op38 = phi i32 [ %op16, %label_3 ], [ %op24, %label_6 ]
  %op22 = icmp sgt i32 %op38, %op37
  br i1 %op22, label %label_6, label %label_ret
label_6:                                                ; preds = %label_5
  %op24 = sub i32 %op38, 1
  %op26 = getelementptr i32, i32* %arg0, i32 %op24
  %op27 = load i32, i32* %op26
  %op30 = getelementptr i32, i32* %arg0, i32 %op38
  store i32 %op27, i32* %op30
  store i32 %arg1, i32* %op11
  br label %label_5
}
define i32 @main() {
label_entry:
  store i32 10, i32* @N
  %op1 = alloca [11 x i32]
  %op2 = getelementptr [11 x i32], [11 x i32]* %op1, i32 0, i32 0
  store i32 1, i32* %op2
  %op3 = getelementptr [11 x i32], [11 x i32]* %op1, i32 0, i32 1
  store i32 3, i32* %op3
  %op4 = getelementptr [11 x i32], [11 x i32]* %op1, i32 0, i32 2
  store i32 4, i32* %op4
  %op5 = getelementptr [11 x i32], [11 x i32]* %op1, i32 0, i32 3
  store i32 7, i32* %op5
  %op6 = getelementptr [11 x i32], [11 x i32]* %op1, i32 0, i32 4
  store i32 8, i32* %op6
  %op7 = getelementptr [11 x i32], [11 x i32]* %op1, i32 0, i32 5
  store i32 11, i32* %op7
  %op8 = getelementptr [11 x i32], [11 x i32]* %op1, i32 0, i32 6
  store i32 13, i32* %op8
  %op9 = getelementptr [11 x i32], [11 x i32]* %op1, i32 0, i32 7
  store i32 18, i32* %op9
  %op10 = getelementptr [11 x i32], [11 x i32]* %op1, i32 0, i32 8
  store i32 56, i32* %op10
  %op11 = getelementptr [11 x i32], [11 x i32]* %op1, i32 0, i32 9
  store i32 78, i32* %op11
  %op14 = call i32 @get_int()
  %op17 = call i32 @insert(i32* %op2, i32 %op14)
  br label %label_8
label_ret:                                                ; preds = %label_8
  ret i32 0
label_8:                                                ; preds = %label_entry, %label_9
  %op29 = phi i32 [ 0, %label_entry ], [ %op28, %label_9 ]
  %op20 = load i32, i32* @N
  %op21 = icmp slt i32 %op29, %op20
  br i1 %op21, label %label_9, label %label_ret
label_9:                                                ; preds = %label_8
  %op23 = getelementptr [11 x i32], [11 x i32]* %op1, i32 0, i32 %op29
  %op24 = load i32, i32* %op23
  call void @put_int(i32 %op24)
  call void @put_char(i32 10)
  %op28 = add i32 %op29, 1
  br label %label_8
}
