declare void @put_int(i32)

define i32 @main() {
label_entry:
  br label %label_1
label_ret:                                                ; preds = %label_3
  ret i32 0
label_1:                                                ; preds = %label_entry, %label_2
  %op12 = phi i32 [ 0, %label_entry ], [ %op8, %label_2 ]
  %op13 = phi i32 [ 0, %label_entry ], [ %op10, %label_2 ]
  %op5 = icmp slt i32 %op13, 21
  br i1 %op5, label %label_2, label %label_3
label_2:                                                ; preds = %label_1
  %op8 = add i32 %op12, %op13
  %op10 = add i32 %op13, 1
  br label %label_1
label_3:                                                ; preds = %label_1
  call void @put_int(i32 %op12)
  br label %label_ret
}
