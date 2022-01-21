@a = global i32 7
declare void @put_int(i32)

define i32 @func() {
label_entry:
  %op2 = load i32, i32* @a
  %op6 = icmp eq i32 1, %op2
  br i1 %op6, label %label_1, label %label_2
label_ret:                                                ; preds = %label_1, %label_2
  %op11 = phi i32 [ 0, %label_2 ], [ 1, %label_1 ]
  ret i32 %op11
label_1:                                                ; preds = %label_entry
  br label %label_ret
label_2:                                                ; preds = %label_entry
  br label %label_ret
}
define i32 @main() {
label_entry:
  br label %label_4
label_ret:                                                ; preds = %label_11
  ret i32 0
label_4:                                                ; preds = %label_entry, %label_8
  %op14 = phi i32 [ 0, %label_entry ], [ %op13, %label_8 ]
  %op15 = phi i32 [ 0, %label_entry ], [ %op16, %label_8 ]
  %op5 = icmp slt i32 %op14, 100
  br i1 %op5, label %label_5, label %label_6
label_5:                                                ; preds = %label_4
  %op6 = call i32 @func()
  %op7 = icmp eq i32 %op6, 1
  br i1 %op7, label %label_7, label %label_8
label_6:                                                ; preds = %label_4
  %op9 = icmp slt i32 %op15, 100
  br i1 %op9, label %label_9, label %label_10
label_7:                                                ; preds = %label_5
  %op11 = add i32 %op15, 1
  br label %label_8
label_8:                                                ; preds = %label_5, %label_7
  %op16 = phi i32 [ %op15, %label_5 ], [ %op11, %label_7 ]
  %op13 = add i32 %op14, 1
  br label %label_4
label_9:                                                ; preds = %label_6
  call void @put_int(i32 1)
  br label %label_11
label_10:                                                ; preds = %label_6
  call void @put_int(i32 0)
  br label %label_11
label_11:                                                ; preds = %label_9, %label_10
  br label %label_ret
}
