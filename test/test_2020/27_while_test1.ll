define i32 @doubleWhile() {
label_entry:
  br label %label_1
label_ret:                                                ; preds = %label_1
  ret i32 %op15
label_1:                                                ; preds = %label_entry, %label_6
  %op15 = phi i32 [ 7, %label_entry ], [ %op14, %label_6 ]
  %op16 = phi i32 [ 5, %label_entry ], [ %op7, %label_6 ]
  %op5 = icmp slt i32 %op16, 100
  br i1 %op5, label %label_2, label %label_ret
label_2:                                                ; preds = %label_1
  %op7 = add i32 %op16, 30
  br label %label_4
label_4:                                                ; preds = %label_2, %label_5
  %op17 = phi i32 [ %op15, %label_2 ], [ %op12, %label_5 ]
  %op10 = icmp slt i32 %op17, 100
  br i1 %op10, label %label_5, label %label_6
label_5:                                                ; preds = %label_4
  %op12 = add i32 %op17, 6
  br label %label_4
label_6:                                                ; preds = %label_4
  %op14 = sub i32 %op17, 100
  br label %label_1
}
define i32 @main() {
label_entry:
  %op1 = call i32 @doubleWhile()
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op1
}
