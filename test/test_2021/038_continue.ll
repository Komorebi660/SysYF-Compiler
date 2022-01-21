define i32 @main() {
label_entry:
  br label %label_1
label_ret:                                                ; preds = %label_1
  ret i32 %op16
label_1:                                                ; preds = %label_entry, %label_4, %label_5
  %op16 = phi i32 [ 0, %label_entry ], [ %op13, %label_5 ], [ %op16, %label_4 ]
  %op17 = phi i32 [ 0, %label_entry ], [ %op15, %label_5 ], [ %op10, %label_4 ]
  %op5 = icmp slt i32 %op17, 100
  br i1 %op5, label %label_2, label %label_ret
label_2:                                                ; preds = %label_1
  %op7 = icmp eq i32 %op17, 50
  br i1 %op7, label %label_4, label %label_5
label_4:                                                ; preds = %label_2
  %op10 = add i32 %op17, 1
  br label %label_1
label_5:                                                ; preds = %label_2
  %op13 = add i32 %op16, %op17
  %op15 = add i32 %op17, 1
  br label %label_1
}
