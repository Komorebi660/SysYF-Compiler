@n = global i32 zeroinitializer
declare void @put_int(i32)

declare void @put_char(i32)

define i32 @QuickSort(i32* %arg0, i32 %arg1, i32 %arg2) {
label_entry:
  %op9 = icmp slt i32 %arg1, %arg2
  br i1 %op9, label %label_1, label %label_2
label_ret:                                                ; preds = %label_2
  ret i32 0
label_1:                                                ; preds = %label_entry
  %op18 = getelementptr i32, i32* %arg0, i32 %arg1
  %op19 = load i32, i32* %op18
  br label %label_3
label_2:                                                ; preds = %label_entry, %label_5
  br label %label_ret
label_3:                                                ; preds = %label_1, %label_17
  %op90 = phi i32 [ %arg2, %label_1 ], [ %op95, %label_17 ]
  %op91 = phi i32 [ %arg1, %label_1 ], [ %op94, %label_17 ]
  %op22 = icmp slt i32 %op91, %op90
  br i1 %op22, label %label_4, label %label_5
label_4:                                                ; preds = %label_3
  br label %label_6
label_5:                                                ; preds = %label_3
  %op26 = getelementptr i32, i32* %arg0, i32 %op91
  store i32 %op19, i32* %op26
  %op29 = sub i32 %op91, 1
  %op33 = call i32 @QuickSort(i32* %arg0, i32 %arg1, i32 %op29)
  %op35 = add i32 %op91, 1
  %op39 = call i32 @QuickSort(i32* %arg0, i32 %op35, i32 %arg2)
  br label %label_2
label_6:                                                ; preds = %label_4, %label_7
  %op92 = phi i32 [ %op90, %label_4 ], [ %op44, %label_7 ]
  %op42 = icmp slt i32 %op91, %op92
  br i1 %op42, label %label_9, label %label_8
label_7:                                                ; preds = %label_9
  %op44 = sub i32 %op92, 1
  br label %label_6
label_8:                                                ; preds = %label_6, %label_9
  br i1 %op42, label %label_10, label %label_11
label_9:                                                ; preds = %label_6
  %op50 = getelementptr i32, i32* %arg0, i32 %op92
  %op51 = load i32, i32* %op50
  %op53 = sub i32 %op19, 1
  %op54 = icmp sgt i32 %op51, %op53
  br i1 %op54, label %label_7, label %label_8
label_10:                                                ; preds = %label_8
  %op57 = getelementptr i32, i32* %arg0, i32 %op92
  %op58 = load i32, i32* %op57
  %op61 = getelementptr i32, i32* %arg0, i32 %op91
  store i32 %op58, i32* %op61
  %op63 = add i32 %op91, 1
  br label %label_11
label_11:                                                ; preds = %label_8, %label_10
  %op93 = phi i32 [ %op91, %label_8 ], [ %op63, %label_10 ]
  br label %label_12
label_12:                                                ; preds = %label_11, %label_13
  %op94 = phi i32 [ %op93, %label_11 ], [ %op68, %label_13 ]
  %op66 = icmp slt i32 %op94, %op92
  br i1 %op66, label %label_15, label %label_14
label_13:                                                ; preds = %label_15
  %op68 = add i32 %op94, 1
  br label %label_12
label_14:                                                ; preds = %label_12, %label_15
  br i1 %op66, label %label_16, label %label_17
label_15:                                                ; preds = %label_12
  %op74 = getelementptr i32, i32* %arg0, i32 %op94
  %op75 = load i32, i32* %op74
  %op77 = icmp slt i32 %op75, %op19
  br i1 %op77, label %label_13, label %label_14
label_16:                                                ; preds = %label_14
  %op80 = getelementptr i32, i32* %arg0, i32 %op94
  %op81 = load i32, i32* %op80
  %op84 = getelementptr i32, i32* %arg0, i32 %op92
  store i32 %op81, i32* %op84
  %op86 = sub i32 %op92, 1
  br label %label_17
label_17:                                                ; preds = %label_14, %label_16
  %op95 = phi i32 [ %op92, %label_14 ], [ %op86, %label_16 ]
  br label %label_3
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
  %op17 = call i32 @QuickSort(i32* %op2, i32 0, i32 9)
  br label %label_18
label_ret:                                                ; preds = %label_18
  ret i32 0
label_18:                                                ; preds = %label_entry, %label_19
  %op30 = phi i32 [ %op17, %label_entry ], [ %op29, %label_19 ]
  %op20 = load i32, i32* @n
  %op21 = icmp slt i32 %op30, %op20
  br i1 %op21, label %label_19, label %label_ret
label_19:                                                ; preds = %label_18
  %op24 = getelementptr [10 x i32], [10 x i32]* %op1, i32 0, i32 %op30
  %op25 = load i32, i32* %op24
  call void @put_int(i32 %op25)
  call void @put_char(i32 10)
  %op29 = add i32 %op30, 1
  br label %label_18
}
