@n = global i32 zeroinitializer
declare void @put_int(i32)

declare void @put_char(i32)

define i32 @insertsort(i32* %arg0) {
label_entry:
  br label %label_1
label_ret:                                                ; preds = %label_1
  ret i32 0
label_1:                                                ; preds = %label_entry, %label_6
  %op43 = phi i32 [ 1, %label_entry ], [ %op34, %label_6 ]
  %op6 = load i32, i32* @n
  %op7 = icmp slt i32 %op43, %op6
  br i1 %op7, label %label_2, label %label_ret
label_2:                                                ; preds = %label_1
  %op11 = getelementptr i32, i32* %arg0, i32 %op43
  %op12 = load i32, i32* %op11
  %op15 = sub i32 %op43, 1
  br label %label_4
label_4:                                                ; preds = %label_2, %label_5
  %op44 = phi i32 [ %op15, %label_2 ], [ %op27, %label_5 ]
  %op17 = icmp sgt i32 %op44, -1
  br i1 %op17, label %label_7, label %label_6
label_5:                                                ; preds = %label_7
  %op21 = load i32, i32* %op38
  %op23 = add i32 %op44, 1
  %op25 = getelementptr i32, i32* %arg0, i32 %op23
  store i32 %op21, i32* %op25
  %op27 = sub i32 %op44, 1
  br label %label_4
label_6:                                                ; preds = %label_4, %label_7
  %op30 = add i32 %op44, 1
  %op32 = getelementptr i32, i32* %arg0, i32 %op30
  store i32 %op12, i32* %op32
  %op34 = add i32 %op43, 1
  br label %label_1
label_7:                                                ; preds = %label_4
  %op38 = getelementptr i32, i32* %arg0, i32 %op44
  %op39 = load i32, i32* %op38
  %op40 = icmp slt i32 %op12, %op39
  br i1 %op40, label %label_5, label %label_6
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
  %op14 = call i32 @insertsort(i32* %op2)
  br label %label_8
label_ret:                                                ; preds = %label_8
  ret i32 0
label_8:                                                ; preds = %label_entry, %label_9
  %op27 = phi i32 [ %op14, %label_entry ], [ %op26, %label_9 ]
  %op17 = load i32, i32* @n
  %op18 = icmp slt i32 %op27, %op17
  br i1 %op18, label %label_9, label %label_ret
label_9:                                                ; preds = %label_8
  %op21 = getelementptr [10 x i32], [10 x i32]* %op1, i32 0, i32 %op27
  %op22 = load i32, i32* %op21
  call void @put_int(i32 %op22)
  call void @put_char(i32 10)
  %op26 = add i32 %op27, 1
  br label %label_8
}
