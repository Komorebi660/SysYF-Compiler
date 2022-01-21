@n = global i32 zeroinitializer
declare void @put_int(i32)

declare void @put_char(i32)

define i32 @select_sort(i32* %arg0, i32 %arg1) {
label_entry:
  br label %label_1
label_ret:                                                ; preds = %label_1
  ret i32 0
label_1:                                                ; preds = %label_entry, %label_10
  %op54 = phi i32 [ 0, %label_entry ], [ %op15, %label_10 ]
  %op11 = sub i32 %arg1, 1
  %op12 = icmp slt i32 %op54, %op11
  br i1 %op12, label %label_2, label %label_ret
label_2:                                                ; preds = %label_1
  %op15 = add i32 %op54, 1
  br label %label_4
label_4:                                                ; preds = %label_2, %label_8
  %op55 = phi i32 [ %op54, %label_2 ], [ %op57, %label_8 ]
  %op56 = phi i32 [ %op15, %label_2 ], [ %op33, %label_8 ]
  %op18 = icmp slt i32 %op56, %arg1
  br i1 %op18, label %label_5, label %label_6
label_5:                                                ; preds = %label_4
  %op21 = getelementptr i32, i32* %arg0, i32 %op55
  %op22 = load i32, i32* %op21
  %op25 = getelementptr i32, i32* %arg0, i32 %op56
  %op26 = load i32, i32* %op25
  %op27 = icmp sgt i32 %op22, %op26
  br i1 %op27, label %label_7, label %label_8
label_6:                                                ; preds = %label_4
  %op30 = icmp ne i32 %op55, %op54
  br i1 %op30, label %label_9, label %label_10
label_7:                                                ; preds = %label_5
  br label %label_8
label_8:                                                ; preds = %label_5, %label_7
  %op57 = phi i32 [ %op55, %label_5 ], [ %op56, %label_7 ]
  %op33 = add i32 %op56, 1
  br label %label_4
label_9:                                                ; preds = %label_6
  %op37 = getelementptr i32, i32* %arg0, i32 %op55
  %op38 = load i32, i32* %op37
  %op41 = getelementptr i32, i32* %arg0, i32 %op54
  %op42 = load i32, i32* %op41
  store i32 %op42, i32* %op37
  store i32 %op38, i32* %op41
  br label %label_10
label_10:                                                ; preds = %label_6, %label_9
  br label %label_1
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
  %op15 = call i32 @select_sort(i32* %op2, i32 10)
  br label %label_11
label_ret:                                                ; preds = %label_11
  ret i32 0
label_11:                                                ; preds = %label_entry, %label_12
  %op28 = phi i32 [ %op15, %label_entry ], [ %op27, %label_12 ]
  %op18 = load i32, i32* @n
  %op19 = icmp slt i32 %op28, %op18
  br i1 %op19, label %label_12, label %label_ret
label_12:                                                ; preds = %label_11
  %op22 = getelementptr [10 x i32], [10 x i32]* %op1, i32 0, i32 %op28
  %op23 = load i32, i32* %op22
  call void @put_int(i32 %op23)
  call void @put_char(i32 10)
  %op27 = add i32 %op28, 1
  br label %label_11
}
