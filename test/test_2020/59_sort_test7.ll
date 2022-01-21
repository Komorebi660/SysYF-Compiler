@n = global i32 zeroinitializer
declare void @put_int(i32)

declare void @put_char(i32)

define i32 @Merge(i32* %arg0, i32 %arg1, i32 %arg2, i32 %arg3) {
label_entry:
  %op12 = sub i32 %arg2, %arg1
  %op13 = add i32 %op12, 1
  %op17 = sub i32 %arg3, %arg2
  %op18 = alloca [10 x i32]
  %op19 = alloca [10 x i32]
  br label %label_1
label_ret:                                                ; preds = %label_17
  ret i32 0
label_1:                                                ; preds = %label_entry, %label_2
  %op112 = phi i32 [ 0, %label_entry ], [ %op35, %label_2 ]
  %op25 = icmp slt i32 %op112, %op13
  br i1 %op25, label %label_2, label %label_3
label_2:                                                ; preds = %label_1
  %op28 = add i32 %op112, %arg1
  %op30 = getelementptr i32, i32* %arg0, i32 %op28
  %op31 = load i32, i32* %op30
  %op33 = getelementptr [10 x i32], [10 x i32]* %op18, i32 0, i32 %op112
  store i32 %op31, i32* %op33
  %op35 = add i32 %op112, 1
  br label %label_1
label_3:                                                ; preds = %label_1
  br label %label_4
label_4:                                                ; preds = %label_3, %label_5
  %op113 = phi i32 [ 0, %label_3 ], [ %op49, %label_5 ]
  %op38 = icmp slt i32 %op113, %op17
  br i1 %op38, label %label_5, label %label_6
label_5:                                                ; preds = %label_4
  %op41 = add i32 %op113, %arg2
  %op42 = add i32 %op41, 1
  %op44 = getelementptr i32, i32* %arg0, i32 %op42
  %op45 = load i32, i32* %op44
  %op47 = getelementptr [10 x i32], [10 x i32]* %op19, i32 0, i32 %op113
  store i32 %op45, i32* %op47
  %op49 = add i32 %op113, 1
  br label %label_4
label_6:                                                ; preds = %label_4
  br label %label_7
label_7:                                                ; preds = %label_6, %label_13
  %op114 = phi i32 [ %arg1, %label_6 ], [ %op117, %label_13 ]
  %op115 = phi i32 [ 0, %label_6 ], [ %op118, %label_13 ]
  %op116 = phi i32 [ 0, %label_6 ], [ %op119, %label_13 ]
  %op54 = icmp ne i32 %op116, %op13
  br i1 %op54, label %label_10, label %label_9
label_8:                                                ; preds = %label_10
  %op56 = getelementptr [10 x i32], [10 x i32]* %op18, i32 0, i32 %op116
  %op57 = load i32, i32* %op56
  %op59 = getelementptr [10 x i32], [10 x i32]* %op19, i32 0, i32 %op115
  %op60 = load i32, i32* %op59
  %op61 = add i32 %op60, 1
  %op62 = icmp slt i32 %op57, %op61
  br i1 %op62, label %label_11, label %label_12
label_9:                                                ; preds = %label_7, %label_10
  br label %label_14
label_10:                                                ; preds = %label_7
  %op65 = icmp ne i32 %op115, %op17
  br i1 %op65, label %label_8, label %label_9
label_11:                                                ; preds = %label_8
  %op68 = load i32, i32* %op56
  %op71 = getelementptr i32, i32* %arg0, i32 %op114
  store i32 %op68, i32* %op71
  %op73 = add i32 %op114, 1
  %op75 = add i32 %op116, 1
  br label %label_13
label_12:                                                ; preds = %label_8
  %op78 = load i32, i32* %op59
  %op81 = getelementptr i32, i32* %arg0, i32 %op114
  store i32 %op78, i32* %op81
  %op83 = add i32 %op114, 1
  %op85 = add i32 %op115, 1
  br label %label_13
label_13:                                                ; preds = %label_11, %label_12
  %op117 = phi i32 [ %op83, %label_12 ], [ %op73, %label_11 ]
  %op118 = phi i32 [ %op85, %label_12 ], [ %op115, %label_11 ]
  %op119 = phi i32 [ %op116, %label_12 ], [ %op75, %label_11 ]
  br label %label_7
label_14:                                                ; preds = %label_9, %label_15
  %op120 = phi i32 [ %op114, %label_9 ], [ %op96, %label_15 ]
  %op121 = phi i32 [ %op116, %label_9 ], [ %op98, %label_15 ]
  %op88 = icmp slt i32 %op121, %op13
  br i1 %op88, label %label_15, label %label_16
label_15:                                                ; preds = %label_14
  %op90 = getelementptr [10 x i32], [10 x i32]* %op18, i32 0, i32 %op121
  %op91 = load i32, i32* %op90
  %op94 = getelementptr i32, i32* %arg0, i32 %op120
  store i32 %op91, i32* %op94
  %op96 = add i32 %op120, 1
  %op98 = add i32 %op121, 1
  br label %label_14
label_16:                                                ; preds = %label_14
  br label %label_17
label_17:                                                ; preds = %label_16, %label_18
  %op122 = phi i32 [ %op120, %label_16 ], [ %op109, %label_18 ]
  %op123 = phi i32 [ %op115, %label_16 ], [ %op111, %label_18 ]
  %op101 = icmp slt i32 %op123, %op17
  br i1 %op101, label %label_18, label %label_ret
label_18:                                                ; preds = %label_17
  %op103 = getelementptr [10 x i32], [10 x i32]* %op19, i32 0, i32 %op123
  %op104 = load i32, i32* %op103
  %op107 = getelementptr i32, i32* %arg0, i32 %op122
  store i32 %op104, i32* %op107
  %op109 = add i32 %op122, 1
  %op111 = add i32 %op123, 1
  br label %label_17
}
define i32 @MergeSort(i32* %arg0, i32 %arg1, i32 %arg2) {
label_entry:
  %op9 = icmp slt i32 %arg1, %arg2
  br i1 %op9, label %label_20, label %label_21
label_ret:                                                ; preds = %label_21
  ret i32 0
label_20:                                                ; preds = %label_entry
  %op14 = add i32 %arg1, %arg2
  %op15 = sdiv i32 %op14, 2
  %op20 = call i32 @MergeSort(i32* %arg0, i32 %arg1, i32 %op15)
  %op22 = add i32 %op15, 1
  %op26 = call i32 @MergeSort(i32* %arg0, i32 %op22, i32 %arg2)
  %op31 = call i32 @Merge(i32* %arg0, i32 %arg1, i32 %op15, i32 %arg2)
  br label %label_21
label_21:                                                ; preds = %label_entry, %label_20
  br label %label_ret
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
  %op19 = call i32 @MergeSort(i32* %op2, i32 0, i32 9)
  br label %label_22
label_ret:                                                ; preds = %label_22
  ret i32 0
label_22:                                                ; preds = %label_entry, %label_23
  %op31 = phi i32 [ %op19, %label_entry ], [ %op30, %label_23 ]
  %op22 = load i32, i32* @n
  %op23 = icmp slt i32 %op31, %op22
  br i1 %op23, label %label_23, label %label_ret
label_23:                                                ; preds = %label_22
  %op25 = getelementptr [10 x i32], [10 x i32]* %op1, i32 0, i32 %op31
  %op26 = load i32, i32* %op25
  call void @put_int(i32 %op26)
  call void @put_char(i32 10)
  %op30 = add i32 %op31, 1
  br label %label_22
}
