define i32 @FourWhile() {
label_entry:
  br label %label_1
label_ret:                                                ; preds = %label_3
  ret i32 %op16
label_1:                                                ; preds = %label_entry, %label_6
  %op35 = phi i32 [ 10, %label_entry ], [ %op39, %label_6 ]
  %op36 = phi i32 [ 7, %label_entry ], [ %op40, %label_6 ]
  %op37 = phi i32 [ 6, %label_entry ], [ %op22, %label_6 ]
  %op38 = phi i32 [ 5, %label_entry ], [ %op9, %label_6 ]
  %op7 = icmp slt i32 %op38, 20
  br i1 %op7, label %label_2, label %label_3
label_2:                                                ; preds = %label_1
  %op9 = add i32 %op38, 3
  br label %label_4
label_3:                                                ; preds = %label_1
  %op13 = add i32 %op37, %op35
  %op14 = add i32 %op38, %op13
  %op16 = add i32 %op14, %op36
  br label %label_ret
label_4:                                                ; preds = %label_2, %label_9
  %op39 = phi i32 [ %op35, %label_2 ], [ %op42, %label_9 ]
  %op40 = phi i32 [ %op36, %label_2 ], [ %op28, %label_9 ]
  %op41 = phi i32 [ %op37, %label_2 ], [ %op20, %label_9 ]
  %op18 = icmp slt i32 %op41, 10
  br i1 %op18, label %label_5, label %label_6
label_5:                                                ; preds = %label_4
  %op20 = add i32 %op41, 1
  br label %label_7
label_6:                                                ; preds = %label_4
  %op22 = sub i32 %op41, 2
  br label %label_1
label_7:                                                ; preds = %label_5, %label_12
  %op42 = phi i32 [ %op39, %label_5 ], [ %op34, %label_12 ]
  %op43 = phi i32 [ %op40, %label_5 ], [ %op26, %label_12 ]
  %op24 = icmp eq i32 %op43, 7
  br i1 %op24, label %label_8, label %label_9
label_8:                                                ; preds = %label_7
  %op26 = sub i32 %op43, 1
  br label %label_10
label_9:                                                ; preds = %label_7
  %op28 = add i32 %op43, 1
  br label %label_4
label_10:                                                ; preds = %label_8, %label_11
  %op44 = phi i32 [ %op42, %label_8 ], [ %op32, %label_11 ]
  %op30 = icmp slt i32 %op44, 20
  br i1 %op30, label %label_11, label %label_12
label_11:                                                ; preds = %label_10
  %op32 = add i32 %op44, 3
  br label %label_10
label_12:                                                ; preds = %label_10
  %op34 = sub i32 %op44, 1
  br label %label_7
}
define i32 @main() {
label_entry:
  %op1 = call i32 @FourWhile()
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op1
}
