declare i32 @get_int()

declare void @put_int(i32)

declare void @put_char(i32)

define i32 @gcd(i32 %arg0, i32 %arg1) {
label_entry:
  %op6 = icmp eq i32 %arg1, 0
  br i1 %op6, label %label_1, label %label_2
label_ret:                                                ; preds = %label_1, %label_2
  %op14 = phi i32 [ %op13, %label_2 ], [ %arg0, %label_1 ]
  ret i32 %op14
label_1:                                                ; preds = %label_entry
  br label %label_ret
label_2:                                                ; preds = %label_entry
  %op12 = srem i32 %arg0, %arg1
  %op13 = call i32 @gcd(i32 %arg1, i32 %op12)
  br label %label_ret
}
define i32 @main() {
label_entry:
  %op2 = call i32 @get_int()
  br label %label_3
label_ret:                                                ; preds = %label_3
  ret i32 0
label_3:                                                ; preds = %label_entry, %label_4
  %op15 = phi i32 [ %op2, %label_entry ], [ %op14, %label_4 ]
  %op5 = icmp sgt i32 %op15, 0
  br i1 %op5, label %label_4, label %label_ret
label_4:                                                ; preds = %label_3
  %op7 = call i32 @get_int()
  %op9 = call i32 @get_int()
  %op12 = call i32 @gcd(i32 %op7, i32 %op9)
  call void @put_int(i32 %op12)
  call void @put_char(i32 10)
  %op14 = sub i32 %op15, 1
  br label %label_3
}
