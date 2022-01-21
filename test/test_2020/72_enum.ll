declare void @put_int(i32)

declare void @put_char(i32)

define i32 @main() {
label_entry:
  br label %label_1
label_ret:                                                ; preds = %label_1
  ret i32 0
label_1:                                                ; preds = %label_entry, %label_6
  %op34 = phi i32 [ 0, %label_entry ], [ %op37, %label_6 ]
  %op35 = phi i32 [ 0, %label_entry ], [ %op26, %label_6 ]
  %op7 = icmp slt i32 %op35, 21
  br i1 %op7, label %label_2, label %label_ret
label_2:                                                ; preds = %label_1
  br label %label_4
label_4:                                                ; preds = %label_2, %label_8
  %op37 = phi i32 [ %op34, %label_2 ], [ %op32, %label_8 ]
  %op10 = sub i32 101, %op35
  %op11 = icmp slt i32 %op37, %op10
  br i1 %op11, label %label_5, label %label_6
label_5:                                                ; preds = %label_4
  %op13 = sub i32 100, %op35
  %op15 = sub i32 %op13, %op37
  %op17 = mul i32 5, %op35
  %op19 = mul i32 1, %op37
  %op20 = add i32 %op17, %op19
  %op22 = sdiv i32 %op15, 2
  %op23 = add i32 %op20, %op22
  %op24 = icmp eq i32 %op23, 100
  br i1 %op24, label %label_7, label %label_8
label_6:                                                ; preds = %label_4
  %op26 = add i32 %op35, 1
  br label %label_1
label_7:                                                ; preds = %label_5
  call void @put_int(i32 %op35)
  call void @put_int(i32 %op37)
  call void @put_int(i32 %op15)
  call void @put_char(i32 10)
  br label %label_8
label_8:                                                ; preds = %label_5, %label_7
  %op32 = add i32 %op37, 1
  br label %label_4
}
