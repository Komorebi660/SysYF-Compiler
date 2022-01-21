define i32 @whileIf() {
label_entry:
  br label %label_1
label_ret:                                                ; preds = %label_1
  ret i32 %op15
label_1:                                                ; preds = %label_entry, %label_6
  %op15 = phi i32 [ 0, %label_entry ], [ %op17, %label_6 ]
  %op16 = phi i32 [ 0, %label_entry ], [ %op12, %label_6 ]
  %op5 = icmp slt i32 %op16, 100
  br i1 %op5, label %label_2, label %label_ret
label_2:                                                ; preds = %label_1
  %op7 = icmp eq i32 %op16, 5
  br i1 %op7, label %label_4, label %label_5
label_4:                                                ; preds = %label_2
  br label %label_6
label_5:                                                ; preds = %label_2
  %op10 = icmp eq i32 %op16, 10
  br i1 %op10, label %label_7, label %label_8
label_6:                                                ; preds = %label_4, %label_9
  %op17 = phi i32 [ %op18, %label_9 ], [ 25, %label_4 ]
  %op12 = add i32 %op16, 1
  br label %label_1
label_7:                                                ; preds = %label_5
  br label %label_9
label_8:                                                ; preds = %label_5
  %op14 = mul i32 %op16, 2
  br label %label_9
label_9:                                                ; preds = %label_7, %label_8
  %op18 = phi i32 [ %op14, %label_8 ], [ 42, %label_7 ]
  br label %label_6
}
define i32 @main() {
label_entry:
  %op1 = call i32 @whileIf()
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op1
}
