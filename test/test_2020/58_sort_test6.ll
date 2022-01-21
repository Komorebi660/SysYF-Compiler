@n = global i32 zeroinitializer
declare void @put_int(i32)

declare void @put_char(i32)

define i32 @counting_sort(i32* %arg0, i32* %arg1, i32 %arg2) {
label_entry:
  %op7 = alloca [10 x i32]
  br label %label_1
label_ret:                                                ; preds = %label_10
  ret i32 0
label_1:                                                ; preds = %label_entry, %label_2
  %op82 = phi i32 [ 0, %label_entry ], [ %op17, %label_2 ]
  %op13 = icmp slt i32 %op82, 10
  br i1 %op13, label %label_2, label %label_3
label_2:                                                ; preds = %label_1
  %op15 = getelementptr [10 x i32], [10 x i32]* %op7, i32 0, i32 %op82
  store i32 0, i32* %op15
  %op17 = add i32 %op82, 1
  br label %label_1
label_3:                                                ; preds = %label_1
  br label %label_4
label_4:                                                ; preds = %label_3, %label_5
  %op83 = phi i32 [ 0, %label_3 ], [ %op34, %label_5 ]
  %op20 = icmp slt i32 %op83, %arg2
  br i1 %op20, label %label_5, label %label_6
label_5:                                                ; preds = %label_4
  %op23 = getelementptr i32, i32* %arg0, i32 %op83
  %op24 = load i32, i32* %op23
  %op25 = getelementptr [10 x i32], [10 x i32]* %op7, i32 0, i32 %op24
  %op26 = load i32, i32* %op25
  %op27 = add i32 %op26, 1
  %op31 = load i32, i32* %op23
  %op32 = getelementptr [10 x i32], [10 x i32]* %op7, i32 0, i32 %op31
  store i32 %op27, i32* %op32
  %op34 = add i32 %op83, 1
  br label %label_4
label_6:                                                ; preds = %label_4
  br label %label_7
label_7:                                                ; preds = %label_6, %label_8
  %op84 = phi i32 [ 1, %label_6 ], [ %op48, %label_8 ]
  %op36 = icmp slt i32 %op84, 10
  br i1 %op36, label %label_8, label %label_9
label_8:                                                ; preds = %label_7
  %op38 = getelementptr [10 x i32], [10 x i32]* %op7, i32 0, i32 %op84
  %op39 = load i32, i32* %op38
  %op41 = sub i32 %op84, 1
  %op42 = getelementptr [10 x i32], [10 x i32]* %op7, i32 0, i32 %op41
  %op43 = load i32, i32* %op42
  %op44 = add i32 %op39, %op43
  store i32 %op44, i32* %op38
  %op48 = add i32 %op84, 1
  br label %label_7
label_9:                                                ; preds = %label_7
  br label %label_10
label_10:                                                ; preds = %label_9, %label_11
  %op85 = phi i32 [ %arg2, %label_9 ], [ %op53, %label_11 ]
  %op51 = icmp sgt i32 %op85, 0
  br i1 %op51, label %label_11, label %label_ret
label_11:                                                ; preds = %label_10
  %op53 = sub i32 %op85, 1
  %op55 = getelementptr i32, i32* %arg0, i32 %op53
  %op56 = load i32, i32* %op55
  %op57 = getelementptr [10 x i32], [10 x i32]* %op7, i32 0, i32 %op56
  %op58 = load i32, i32* %op57
  %op59 = sub i32 %op58, 1
  %op64 = load i32, i32* %op55
  %op65 = getelementptr [10 x i32], [10 x i32]* %op7, i32 0, i32 %op64
  store i32 %op59, i32* %op65
  %op70 = load i32, i32* %op55
  %op75 = load i32, i32* %op55
  %op76 = getelementptr [10 x i32], [10 x i32]* %op7, i32 0, i32 %op75
  %op77 = load i32, i32* %op76
  %op79 = getelementptr i32, i32* %arg1, i32 %op77
  store i32 %op70, i32* %op79
  br label %label_10
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
  %op13 = alloca [10 x i32]
  %op15 = getelementptr [10 x i32], [10 x i32]* %op13, i32 0, i32 0
  %op17 = call i32 @counting_sort(i32* %op2, i32* %op15, i32 10)
  br label %label_13
label_ret:                                                ; preds = %label_13
  ret i32 0
label_13:                                                ; preds = %label_entry, %label_14
  %op30 = phi i32 [ %op17, %label_entry ], [ %op29, %label_14 ]
  %op20 = load i32, i32* @n
  %op21 = icmp slt i32 %op30, %op20
  br i1 %op21, label %label_14, label %label_ret
label_14:                                                ; preds = %label_13
  %op24 = getelementptr [10 x i32], [10 x i32]* %op13, i32 0, i32 %op30
  %op25 = load i32, i32* %op24
  call void @put_int(i32 %op25)
  call void @put_char(i32 10)
  %op29 = add i32 %op30, 1
  br label %label_13
}
