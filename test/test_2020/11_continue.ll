define i32 @main() {
label_entry:
  br label %label_1
label_ret:                                                ; preds = %label_5, %label_3
  %op11 = phi i32 [ %op12, %label_3 ], [ %op12, %label_5 ]
  ret i32 %op11
label_1:                                                ; preds = %label_entry, %label_4
  %op12 = phi i32 [ 10, %label_entry ], [ %op9, %label_4 ]
  %op4 = icmp sgt i32 %op12, 0
  br i1 %op4, label %label_2, label %label_3
label_2:                                                ; preds = %label_1
  %op6 = icmp sgt i32 %op12, 5
  br i1 %op6, label %label_4, label %label_5
label_3:                                                ; preds = %label_1
  br label %label_ret
label_4:                                                ; preds = %label_2
  %op9 = sub i32 %op12, 1
  br label %label_1
label_5:                                                ; preds = %label_2
  br label %label_ret
}
