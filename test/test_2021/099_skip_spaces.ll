declare i32 @get_int()

define i32 @main() {
label_entry:
  %op1 = alloca [100 x i32]
  br label %label_1
label_ret:                                                ; preds = %label_6
  ret i32 %op22
label_1:                                                ; preds = %label_entry, %label_2
  %op23 = phi i32 [ 0, %label_entry ], [ %op11, %label_2 ]
  %op5 = call i32 @get_int()
  %op6 = icmp ne i32 %op5, 0
  br i1 %op6, label %label_2, label %label_3
label_2:                                                ; preds = %label_1
  %op7 = call i32 @get_int()
  %op9 = getelementptr [100 x i32], [100 x i32]* %op1, i32 0, i32 %op23
  store i32 %op7, i32* %op9
  %op11 = add i32 %op23, 1
  br label %label_1
label_3:                                                ; preds = %label_1
  br label %label_4
label_4:                                                ; preds = %label_3, %label_5
  %op24 = phi i32 [ 0, %label_3 ], [ %op20, %label_5 ]
  %op25 = phi i32 [ %op23, %label_3 ], [ %op15, %label_5 ]
  %op13 = icmp ne i32 %op25, 0
  br i1 %op13, label %label_5, label %label_6
label_5:                                                ; preds = %label_4
  %op15 = sub i32 %op25, 1
  %op18 = getelementptr [100 x i32], [100 x i32]* %op1, i32 0, i32 %op15
  %op19 = load i32, i32* %op18
  %op20 = add i32 %op24, %op19
  br label %label_4
label_6:                                                ; preds = %label_4
  %op22 = srem i32 %op24, 79
  br label %label_ret
}
