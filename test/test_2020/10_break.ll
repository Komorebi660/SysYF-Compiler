define i32 @main() {
label_entry:
  br label %label_1
label_ret:                                                ; preds = %label_3
  ret i32 %op11
label_1:                                                ; preds = %label_entry, %label_5
  %op10 = phi i32 [ 10, %label_entry ], [ %op6, %label_5 ]
  %op4 = icmp sgt i32 %op10, 0
  br i1 %op4, label %label_2, label %label_3
label_2:                                                ; preds = %label_1
  %op6 = sub i32 %op10, 1
  %op8 = icmp eq i32 %op6, 5
  br i1 %op8, label %label_4, label %label_5
label_3:                                                ; preds = %label_1, %label_4
  %op11 = phi i32 [ %op10, %label_1 ], [ %op6, %label_4 ]
  br label %label_ret
label_4:                                                ; preds = %label_2
  br label %label_3
label_5:                                                ; preds = %label_2
  br label %label_1
}
