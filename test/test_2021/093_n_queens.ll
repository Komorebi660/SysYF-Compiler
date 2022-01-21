@ans = global [50 x i32] zeroinitializer
@sum = global i32 0
@n = global i32 zeroinitializer
@row = global [50 x i32] zeroinitializer
@line1 = global [50 x i32] zeroinitializer
@line2 = global [100 x i32] zeroinitializer
declare i32 @get_int()

declare void @put_int(i32)

declare void @put_char(i32)

define void @printans() {
label_entry:
  %op0 = load i32, i32* @sum
  %op1 = add i32 %op0, 1
  store i32 %op1, i32* @sum
  br label %label_1
label_ret:                                                ; preds = %label_4, %label_3
  ret void
label_1:                                                ; preds = %label_entry, %label_6
  %op14 = phi i32 [ 1, %label_entry ], [ %op13, %label_6 ]
  %op4 = load i32, i32* @n
  %op5 = icmp sle i32 %op14, %op4
  br i1 %op5, label %label_2, label %label_3
label_2:                                                ; preds = %label_1
  %op7 = getelementptr [50 x i32], [50 x i32]* @ans, i32 0, i32 %op14
  %op8 = load i32, i32* %op7
  call void @put_int(i32 %op8)
  %op10 = load i32, i32* @n
  %op11 = icmp eq i32 %op14, %op10
  br i1 %op11, label %label_4, label %label_5
label_3:                                                ; preds = %label_1
  br label %label_ret
label_4:                                                ; preds = %label_2
  call void @put_char(i32 10)
  br label %label_ret
label_5:                                                ; preds = %label_2
  call void @put_char(i32 32)
  br label %label_6
label_6:                                                ; preds = %label_5
  %op13 = add i32 %op14, 1
  br label %label_1
}
define void @f(i32 %arg0) {
label_entry:
  br label %label_7
label_ret:                                                ; preds = %label_7
  ret void
label_7:                                                ; preds = %label_entry, %label_11
  %op58 = phi i32 [ 1, %label_entry ], [ %op17, %label_11 ]
  %op4 = load i32, i32* @n
  %op5 = icmp sle i32 %op58, %op4
  br i1 %op5, label %label_8, label %label_ret
label_8:                                                ; preds = %label_7
  %op7 = getelementptr [50 x i32], [50 x i32]* @row, i32 0, i32 %op58
  %op8 = load i32, i32* %op7
  %op9 = icmp ne i32 %op8, 1
  br i1 %op9, label %label_13, label %label_11
label_10:                                                ; preds = %label_12
  %op12 = getelementptr [50 x i32], [50 x i32]* @ans, i32 0, i32 %arg0
  store i32 %op58, i32* %op12
  %op14 = load i32, i32* @n
  %op15 = icmp eq i32 %arg0, %op14
  br i1 %op15, label %label_14, label %label_15
label_11:                                                ; preds = %label_8, %label_13, %label_12, %label_15
  %op17 = add i32 %op58, 1
  br label %label_7
label_12:                                                ; preds = %label_13
  %op18 = load i32, i32* @n
  %op20 = add i32 %op18, %arg0
  %op22 = sub i32 %op20, %op58
  %op23 = getelementptr [100 x i32], [100 x i32]* @line2, i32 0, i32 %op22
  %op24 = load i32, i32* %op23
  %op25 = icmp eq i32 %op24, 0
  br i1 %op25, label %label_10, label %label_11
label_13:                                                ; preds = %label_8
  %op28 = add i32 %arg0, %op58
  %op29 = getelementptr [50 x i32], [50 x i32]* @line1, i32 0, i32 %op28
  %op30 = load i32, i32* %op29
  %op31 = icmp eq i32 %op30, 0
  br i1 %op31, label %label_12, label %label_11
label_14:                                                ; preds = %label_10
  call void @printans()
  br label %label_15
label_15:                                                ; preds = %label_10, %label_14
  store i32 1, i32* %op7
  store i32 1, i32* %op29
  %op38 = load i32, i32* @n
  %op40 = add i32 %op38, %arg0
  %op42 = sub i32 %op40, %op58
  %op43 = getelementptr [100 x i32], [100 x i32]* @line2, i32 0, i32 %op42
  store i32 1, i32* %op43
  %op45 = add i32 %arg0, 1
  call void @f(i32 %op45)
  store i32 0, i32* %op7
  store i32 0, i32* %op29
  %op52 = load i32, i32* @n
  %op54 = add i32 %op52, %arg0
  %op56 = sub i32 %op54, %op58
  %op57 = getelementptr [100 x i32], [100 x i32]* @line2, i32 0, i32 %op56
  store i32 0, i32* %op57
  br label %label_11
}
define i32 @main() {
label_entry:
  %op2 = call i32 @get_int()
  br label %label_16
label_ret:                                                ; preds = %label_18
  ret i32 %op9
label_16:                                                ; preds = %label_entry, %label_17
  %op10 = phi i32 [ %op2, %label_entry ], [ %op8, %label_17 ]
  %op5 = icmp sgt i32 %op10, 0
  br i1 %op5, label %label_17, label %label_18
label_17:                                                ; preds = %label_16
  %op6 = call i32 @get_int()
  store i32 %op6, i32* @n
  call void @f(i32 1)
  %op8 = sub i32 %op10, 1
  br label %label_16
label_18:                                                ; preds = %label_16
  %op9 = load i32, i32* @sum
  br label %label_ret
}
