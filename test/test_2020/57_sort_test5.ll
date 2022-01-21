@n = global i32 zeroinitializer
declare void @put_int(i32)

declare void @put_char(i32)

define i32 @swap(i32* %arg0, i32 %arg1, i32 %arg2) {
label_entry:
  %op10 = getelementptr i32, i32* %arg0, i32 %arg1
  %op11 = load i32, i32* %op10
  %op14 = getelementptr i32, i32* %arg0, i32 %arg2
  %op15 = load i32, i32* %op14
  store i32 %op15, i32* %op10
  store i32 %op11, i32* %op14
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 0
}
define i32 @heap_ajust(i32* %arg0, i32 %arg1, i32 %arg2) {
label_entry:
  %op11 = mul i32 %arg1, 2
  %op12 = add i32 %op11, 1
  br label %label_1
label_ret:                                                ; preds = %label_7, %label_3
  %op51 = phi i32 [ 0, %label_3 ], [ 0, %label_7 ]
  ret i32 %op51
label_1:                                                ; preds = %label_entry, %label_8
  %op52 = phi i32 [ %op12, %label_entry ], [ %op49, %label_8 ]
  %op53 = phi i32 [ %arg1, %label_entry ], [ %op54, %label_8 ]
  %op16 = add i32 %arg2, 1
  %op17 = icmp slt i32 %op52, %op16
  br i1 %op17, label %label_2, label %label_3
label_2:                                                ; preds = %label_1
  %op20 = icmp slt i32 %op52, %arg2
  br i1 %op20, label %label_6, label %label_5
label_3:                                                ; preds = %label_1
  br label %label_ret
label_4:                                                ; preds = %label_6
  br label %label_5
label_5:                                                ; preds = %label_2, %label_6, %label_4
  %op54 = phi i32 [ %op52, %label_2 ], [ %op52, %label_6 ], [ %op37, %label_4 ]
  %op25 = getelementptr i32, i32* %arg0, i32 %op53
  %op26 = load i32, i32* %op25
  %op29 = getelementptr i32, i32* %arg0, i32 %op54
  %op30 = load i32, i32* %op29
  %op31 = icmp sgt i32 %op26, %op30
  br i1 %op31, label %label_7, label %label_8
label_6:                                                ; preds = %label_2
  %op34 = getelementptr i32, i32* %arg0, i32 %op52
  %op35 = load i32, i32* %op34
  %op37 = add i32 %op52, 1
  %op39 = getelementptr i32, i32* %arg0, i32 %op37
  %op40 = load i32, i32* %op39
  %op41 = icmp slt i32 %op35, %op40
  br i1 %op41, label %label_4, label %label_5
label_7:                                                ; preds = %label_5
  br label %label_ret
label_8:                                                ; preds = %label_5
  %op45 = call i32 @swap(i32* %arg0, i32 %op53, i32 %op54)
  %op48 = mul i32 %op54, 2
  %op49 = add i32 %op48, 1
  br label %label_1
}
define i32 @heap_sort(i32* %arg0, i32 %arg1) {
label_entry:
  %op8 = sdiv i32 %arg1, 2
  %op9 = sub i32 %op8, 1
  br label %label_10
label_ret:                                                ; preds = %label_13
  ret i32 0
label_10:                                                ; preds = %label_entry, %label_11
  %op38 = phi i32 [ %op9, %label_entry ], [ %op20, %label_11 ]
  %op12 = icmp sgt i32 %op38, -1
  br i1 %op12, label %label_11, label %label_12
label_11:                                                ; preds = %label_10
  %op14 = sub i32 %arg1, 1
  %op18 = call i32 @heap_ajust(i32* %arg0, i32 %op38, i32 %op14)
  %op20 = sub i32 %op38, 1
  br label %label_10
label_12:                                                ; preds = %label_10
  %op22 = sub i32 %arg1, 1
  br label %label_13
label_13:                                                ; preds = %label_12, %label_14
  %op39 = phi i32 [ %op22, %label_12 ], [ %op31, %label_14 ]
  %op24 = icmp sgt i32 %op39, 0
  br i1 %op24, label %label_14, label %label_ret
label_14:                                                ; preds = %label_13
  %op29 = call i32 @swap(i32* %arg0, i32 0, i32 %op39)
  %op31 = sub i32 %op39, 1
  %op35 = call i32 @heap_ajust(i32* %arg0, i32 0, i32 %op31)
  br label %label_13
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
  %op15 = call i32 @heap_sort(i32* %op2, i32 10)
  br label %label_16
label_ret:                                                ; preds = %label_16
  ret i32 0
label_16:                                                ; preds = %label_entry, %label_17
  %op28 = phi i32 [ %op15, %label_entry ], [ %op27, %label_17 ]
  %op18 = load i32, i32* @n
  %op19 = icmp slt i32 %op28, %op18
  br i1 %op19, label %label_17, label %label_ret
label_17:                                                ; preds = %label_16
  %op22 = getelementptr [10 x i32], [10 x i32]* %op1, i32 0, i32 %op28
  %op23 = load i32, i32* %op22
  call void @put_int(i32 %op23)
  call void @put_char(i32 10)
  %op27 = add i32 %op28, 1
  br label %label_16
}
