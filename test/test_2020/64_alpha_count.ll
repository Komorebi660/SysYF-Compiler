declare i32 @get_char()

declare void @put_int(i32)

define i32 @main() {
label_entry:
  br label %label_1
label_ret:                                                ; preds = %label_3
  ret i32 0
label_1:                                                ; preds = %label_entry, %label_5
  %op22 = phi i32 [ 0, %label_entry ], [ %op25, %label_5 ]
  %op24 = phi i32 [ 0, %label_entry ], [ %op8, %label_5 ]
  %op7 = icmp ne i32 %op24, 10
  br i1 %op7, label %label_2, label %label_3
label_2:                                                ; preds = %label_1
  %op8 = call i32 @get_char()
  %op10 = icmp sgt i32 %op8, 40
  br i1 %op10, label %label_7, label %label_6
label_3:                                                ; preds = %label_1
  call void @put_int(i32 %op22)
  br label %label_ret
label_4:                                                ; preds = %label_7, %label_8
  %op13 = add i32 %op22, 1
  br label %label_5
label_5:                                                ; preds = %label_6, %label_8, %label_4
  %op25 = phi i32 [ %op22, %label_6 ], [ %op22, %label_8 ], [ %op13, %label_4 ]
  br label %label_1
label_6:                                                ; preds = %label_2, %label_7
  %op17 = icmp sgt i32 %op8, 96
  br i1 %op17, label %label_8, label %label_5
label_7:                                                ; preds = %label_2
  %op19 = icmp slt i32 %op8, 91
  br i1 %op19, label %label_4, label %label_6
label_8:                                                ; preds = %label_6
  %op21 = icmp slt i32 %op8, 123
  br i1 %op21, label %label_4, label %label_5
}
