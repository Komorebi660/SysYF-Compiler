declare i32 @get_int()

declare void @put_int(i32)

define i32 @fun(i32 %arg0, i32 %arg1) {
label_entry:
  br label %label_1
label_ret:                                                ; preds = %label_1
  ret i32 %op15
label_1:                                                ; preds = %label_entry, %label_2
  %op15 = phi i32 [ %arg0, %label_entry ], [ %op16, %label_2 ]
  %op16 = phi i32 [ %arg1, %label_entry ], [ %op11, %label_2 ]
  %op8 = icmp sgt i32 %op16, 0
  br i1 %op8, label %label_2, label %label_ret
label_2:                                                ; preds = %label_1
  %op11 = srem i32 %op15, %op16
  br label %label_1
}
define i32 @main() {
label_entry:
  %op4 = call i32 @get_int()
  %op5 = call i32 @get_int()
  %op8 = call i32 @fun(i32 %op4, i32 %op5)
  call void @put_int(i32 %op8)
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 0
}
