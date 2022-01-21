declare void @put_int(i32)

define i32 @func(i32 %arg0) {
label_entry:
  %op4 = icmp sle i32 %arg0, 50
  br i1 %op4, label %label_1, label %label_2
label_ret:                                                ; preds = %label_1, %label_2
  %op8 = phi i32 [ 0, %label_2 ], [ 1, %label_1 ]
  ret i32 %op8
label_1:                                                ; preds = %label_entry
  call void @put_int(i32 %arg0)
  br label %label_ret
label_2:                                                ; preds = %label_entry
  call void @put_int(i32 %arg0)
  br label %label_ret
}
define i32 @main() {
label_entry:
  %op2 = call i32 @func(i32 0)
  %op3 = icmp eq i32 %op2, 1
  br i1 %op3, label %label_4, label %label_7
label_ret:                                                ; preds = %label_11
  ret i32 0
label_4:                                                ; preds = %label_entry
  br label %label_6
label_5:                                                ; preds = %label_7
  br label %label_6
label_6:                                                ; preds = %label_4, %label_5, %label_8
  %op5 = call i32 @func(i32 50)
  %op6 = icmp eq i32 %op5, 1
  br i1 %op6, label %label_13, label %label_12
label_7:                                                ; preds = %label_entry
  %op7 = call i32 @func(i32 50)
  %op8 = icmp eq i32 %op7, 1
  br i1 %op8, label %label_8, label %label_5
label_8:                                                ; preds = %label_7
  %op9 = call i32 @func(i32 100)
  br label %label_6
label_9:                                                ; preds = %label_13
  br label %label_11
label_11:                                                ; preds = %label_9, %label_12
  br label %label_ret
label_12:                                                ; preds = %label_6, %label_13
  %op11 = call i32 @func(i32 1)
  br label %label_11
label_13:                                                ; preds = %label_6
  %op13 = call i32 @func(i32 40)
  %op14 = icmp eq i32 %op13, 1
  br i1 %op14, label %label_9, label %label_12
}
