declare void @put_int(i32)

declare void @put_char(i32)

define i32 @enc(i32 %arg0) {
label_entry:
  %op4 = icmp sgt i32 %arg0, 25
  br i1 %op4, label %label_1, label %label_2
label_ret:                                                ; preds = %label_3
  ret i32 %op11
label_1:                                                ; preds = %label_entry
  %op7 = add i32 %arg0, 60
  br label %label_3
label_2:                                                ; preds = %label_entry
  %op9 = sub i32 %arg0, 15
  br label %label_3
label_3:                                                ; preds = %label_1, %label_2
  %op11 = phi i32 [ %op9, %label_2 ], [ %op7, %label_1 ]
  br label %label_ret
}
define i32 @dec(i32 %arg0) {
label_entry:
  %op4 = icmp sgt i32 %arg0, 85
  br i1 %op4, label %label_4, label %label_5
label_ret:                                                ; preds = %label_6
  ret i32 %op11
label_4:                                                ; preds = %label_entry
  %op7 = sub i32 %arg0, 59
  br label %label_6
label_5:                                                ; preds = %label_entry
  %op9 = add i32 %arg0, 14
  br label %label_6
label_6:                                                ; preds = %label_4, %label_5
  %op11 = phi i32 [ %op9, %label_5 ], [ %op7, %label_4 ]
  br label %label_ret
}
define i32 @main() {
label_entry:
  %op4 = call i32 @enc(i32 400)
  %op6 = call i32 @dec(i32 %op4)
  call void @put_int(i32 %op6)
  call void @put_char(i32 10)
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 0
}
