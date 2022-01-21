@n = global i32 zeroinitializer
declare void @put_int(i32)

declare void @put_char(i32)

define i32 @bubblesort(i32* %arg0) {
label_entry:
  br label %label_1
label_ret:                                                ; preds = %label_1
  ret i32 0
label_1:                                                ; preds = %label_entry, %label_6
  %op49 = phi i32 [ 0, %label_entry ], [ %op27, %label_6 ]
  %op7 = load i32, i32* @n
  %op8 = sub i32 %op7, 1
  %op9 = icmp slt i32 %op49, %op8
  br i1 %op9, label %label_2, label %label_ret
label_2:                                                ; preds = %label_1
  br label %label_4
label_4:                                                ; preds = %label_2, %label_8
  %op50 = phi i32 [ 0, %label_2 ], [ %op21, %label_8 ]
  %op11 = load i32, i32* @n
  %op13 = sub i32 %op11, %op49
  %op14 = sub i32 %op13, 1
  %op15 = icmp slt i32 %op50, %op14
  br i1 %op15, label %label_5, label %label_6
label_5:                                                ; preds = %label_4
  %op18 = getelementptr i32, i32* %arg0, i32 %op50
  %op19 = load i32, i32* %op18
  %op21 = add i32 %op50, 1
  %op23 = getelementptr i32, i32* %arg0, i32 %op21
  %op24 = load i32, i32* %op23
  %op25 = icmp sgt i32 %op19, %op24
  br i1 %op25, label %label_7, label %label_8
label_6:                                                ; preds = %label_4
  %op27 = add i32 %op49, 1
  br label %label_1
label_7:                                                ; preds = %label_5
  %op33 = load i32, i32* %op23
  %op37 = load i32, i32* %op18
  store i32 %op37, i32* %op23
  store i32 %op33, i32* %op18
  br label %label_8
label_8:                                                ; preds = %label_5, %label_7
  br label %label_4
}
define i32 @main() {
label_entry:
  store i32 10, i32* @n
  %op1 = alloca [10 x i32]
  %op2 = getelementptr [10 x i32], [10 x i32]* %op1, i32 0, i32 0
  store i32 4, i32* %op2
  %op3 = getelementptr [10 x i32], [10 x i32]* %op1, i32 0, i32 1
  store i32 3, i32* %op3
  %op4 = getelementptr [10 x i32], [10 x i32]* %op1, i32 0, i32 2
  store i32 9, i32* %op4
  %op5 = getelementptr [10 x i32], [10 x i32]* %op1, i32 0, i32 3
  store i32 2, i32* %op5
  %op6 = getelementptr [10 x i32], [10 x i32]* %op1, i32 0, i32 4
  store i32 0, i32* %op6
  %op7 = getelementptr [10 x i32], [10 x i32]* %op1, i32 0, i32 5
  store i32 1, i32* %op7
  %op8 = getelementptr [10 x i32], [10 x i32]* %op1, i32 0, i32 6
  store i32 6, i32* %op8
  %op9 = getelementptr [10 x i32], [10 x i32]* %op1, i32 0, i32 7
  store i32 5, i32* %op9
  %op10 = getelementptr [10 x i32], [10 x i32]* %op1, i32 0, i32 8
  store i32 7, i32* %op10
  %op11 = getelementptr [10 x i32], [10 x i32]* %op1, i32 0, i32 9
  store i32 8, i32* %op11
  %op14 = call i32 @bubblesort(i32* %op2)
  br label %label_9
label_ret:                                                ; preds = %label_9
  ret i32 0
label_9:                                                ; preds = %label_entry, %label_10
  %op27 = phi i32 [ %op14, %label_entry ], [ %op26, %label_10 ]
  %op17 = load i32, i32* @n
  %op18 = icmp slt i32 %op27, %op17
  br i1 %op18, label %label_10, label %label_ret
label_10:                                                ; preds = %label_9
  %op21 = getelementptr [10 x i32], [10 x i32]* %op1, i32 0, i32 %op27
  %op22 = load i32, i32* %op21
  call void @put_int(i32 %op22)
  call void @put_char(i32 10)
  %op26 = add i32 %op27, 1
  br label %label_9
}
