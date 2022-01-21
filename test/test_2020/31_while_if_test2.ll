define i32 @ifWhile() {
label_entry:
  br label %label_7
label_ret:                                                ; preds = %label_7
  ret i32 %op22
label_7:                                                ; preds = %label_8, %label_entry
  %op22 = phi i32 [ %op16, %label_8 ], [ 3, %label_entry ]
  %op23 = phi i32 [ %op18, %label_8 ], [ 0, %label_entry ]
  %op14 = icmp slt i32 %op23, 5
  br i1 %op14, label %label_8, label %label_ret
label_8:                                                ; preds = %label_7
  %op16 = mul i32 %op22, 2
  %op18 = add i32 %op23, 1
  br label %label_7
}
define i32 @main() {
label_entry:
  %op1 = call i32 @ifWhile()
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op1
}
