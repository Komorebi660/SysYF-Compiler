declare i32 @get_int()

declare void @put_int(i32)

declare void @put_char(i32)

define void @move(i32 %arg0, i32 %arg1) {
label_entry:
  call void @put_int(i32 %arg0)
  call void @put_char(i32 32)
  call void @put_int(i32 %arg1)
  call void @put_char(i32 44)
  call void @put_char(i32 32)
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret void
}
define void @hanoi(i32 %arg0, i32 %arg1, i32 %arg2, i32 %arg3) {
label_entry:
  %op9 = icmp eq i32 %arg0, 1
  br i1 %op9, label %label_1, label %label_2
label_ret:                                                ; preds = %label_3
  ret void
label_1:                                                ; preds = %label_entry
  call void @move(i32 %arg1, i32 %arg3)
  br label %label_3
label_2:                                                ; preds = %label_entry
  %op13 = sub i32 %arg0, 1
  call void @hanoi(i32 %op13, i32 %arg1, i32 %arg3, i32 %arg2)
  call void @move(i32 %arg1, i32 %arg3)
  call void @hanoi(i32 %op13, i32 %arg2, i32 %arg1, i32 %arg3)
  br label %label_3
label_3:                                                ; preds = %label_1, %label_2
  br label %label_ret
}
define i32 @main() {
label_entry:
  %op2 = call i32 @get_int()
  br label %label_4
label_ret:                                                ; preds = %label_4
  ret i32 0
label_4:                                                ; preds = %label_entry, %label_5
  %op11 = phi i32 [ %op2, %label_entry ], [ %op10, %label_5 ]
  %op5 = icmp sgt i32 %op11, 0
  br i1 %op5, label %label_5, label %label_ret
label_5:                                                ; preds = %label_4
  %op7 = call i32 @get_int()
  call void @hanoi(i32 %op7, i32 1, i32 2, i32 3)
  call void @put_char(i32 10)
  %op10 = sub i32 %op11, 1
  br label %label_4
}
