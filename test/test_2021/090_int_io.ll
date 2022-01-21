@ascii_0 = constant i32 48
declare i32 @get_char()

declare void @put_char(i32)

define i32 @my_getint() {
label_entry:
  br label %label_1
label_ret:                                                ; preds = %label_12
  ret i32 %op29
label_1:                                                ; preds = %label_entry, %label_4
  br label %label_2
label_2:                                                ; preds = %label_1
  %op5 = call i32 @get_char()
  %op6 = load i32, i32* @ascii_0
  %op7 = sub i32 %op5, %op6
  %op9 = icmp slt i32 %op7, 0
  br i1 %op9, label %label_4, label %label_7
label_4:                                                ; preds = %label_2, %label_7
  br label %label_1
label_5:                                                ; preds = %label_7
  br label %label_8
label_7:                                                ; preds = %label_2
  %op12 = icmp sgt i32 %op7, 9
  br i1 %op12, label %label_4, label %label_5
label_8:                                                ; preds = %label_5, %label_11
  %op29 = phi i32 [ %op7, %label_5 ], [ %op23, %label_11 ]
  br label %label_9
label_9:                                                ; preds = %label_8
  %op14 = call i32 @get_char()
  %op15 = load i32, i32* @ascii_0
  %op16 = sub i32 %op14, %op15
  %op18 = icmp sge i32 %op16, 0
  br i1 %op18, label %label_14, label %label_12
label_11:                                                ; preds = %label_14
  %op21 = mul i32 %op29, 10
  %op23 = add i32 %op21, %op16
  br label %label_8
label_12:                                                ; preds = %label_9, %label_14
  br label %label_ret
label_14:                                                ; preds = %label_9
  %op25 = icmp sle i32 %op16, 9
  br i1 %op25, label %label_11, label %label_12
}
define void @my_putint(i32 %arg0) {
label_entry:
  %op2 = alloca [16 x i32]
  br label %label_15
label_ret:                                                ; preds = %label_18
  ret void
label_15:                                                ; preds = %label_entry, %label_16
  %op23 = phi i32 [ 0, %label_entry ], [ %op15, %label_16 ]
  %op24 = phi i32 [ %arg0, %label_entry ], [ %op13, %label_16 ]
  %op5 = icmp sgt i32 %op24, 0
  br i1 %op5, label %label_16, label %label_17
label_16:                                                ; preds = %label_15
  %op7 = srem i32 %op24, 10
  %op8 = load i32, i32* @ascii_0
  %op9 = add i32 %op7, %op8
  %op11 = getelementptr [16 x i32], [16 x i32]* %op2, i32 0, i32 %op23
  store i32 %op9, i32* %op11
  %op13 = sdiv i32 %op24, 10
  %op15 = add i32 %op23, 1
  br label %label_15
label_17:                                                ; preds = %label_15
  br label %label_18
label_18:                                                ; preds = %label_17, %label_19
  %op25 = phi i32 [ %op23, %label_17 ], [ %op19, %label_19 ]
  %op17 = icmp sgt i32 %op25, 0
  br i1 %op17, label %label_19, label %label_ret
label_19:                                                ; preds = %label_18
  %op19 = sub i32 %op25, 1
  %op21 = getelementptr [16 x i32], [16 x i32]* %op2, i32 0, i32 %op19
  %op22 = load i32, i32* %op21
  call void @put_char(i32 %op22)
  br label %label_18
}
define i32 @main() {
label_entry:
  %op2 = call i32 @my_getint()
  br label %label_21
label_ret:                                                ; preds = %label_21
  ret i32 0
label_21:                                                ; preds = %label_entry, %label_22
  %op11 = phi i32 [ %op2, %label_entry ], [ %op10, %label_22 ]
  %op5 = icmp sgt i32 %op11, 0
  br i1 %op5, label %label_22, label %label_ret
label_22:                                                ; preds = %label_21
  %op7 = call i32 @my_getint()
  call void @my_putint(i32 %op7)
  call void @put_char(i32 10)
  %op10 = sub i32 %op11, 1
  br label %label_21
}
