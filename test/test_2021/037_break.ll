define i32 @main() {
label_entry:
  br label %label_1
label_ret:                                                ; preds = %label_3
  ret i32 %op14
label_1:                                                ; preds = %label_entry, %label_5
  %op14 = phi i32 [ 0, %label_entry ], [ %op11, %label_5 ]
  %op15 = phi i32 [ 0, %label_entry ], [ %op13, %label_5 ]
  %op5 = icmp slt i32 %op15, 100
  br i1 %op5, label %label_2, label %label_3
label_2:                                                ; preds = %label_1
  %op7 = icmp eq i32 %op15, 50
  br i1 %op7, label %label_4, label %label_5
label_3:                                                ; preds = %label_1, %label_4
  br label %label_ret
label_4:                                                ; preds = %label_2
  br label %label_3
label_5:                                                ; preds = %label_2
  %op11 = add i32 %op14, %op15
  %op13 = add i32 %op15, 1
  br label %label_1
}
