declare void @put_int(i32)

declare void @put_char(i32)

define i32 @fsqrt(i32 %arg0) {
label_entry:
  %op6 = sdiv i32 %arg0, 2
  br label %label_1
label_ret:                                                ; preds = %label_1
  ret i32 %op21
label_1:                                                ; preds = %label_entry, %label_2
  %op21 = phi i32 [ %op6, %label_entry ], [ %op19, %label_2 ]
  %op22 = phi i32 [ 0, %label_entry ], [ %op21, %label_2 ]
  %op10 = sub i32 %op22, %op21
  %op11 = icmp ne i32 %op10, 0
  br i1 %op11, label %label_2, label %label_ret
label_2:                                                ; preds = %label_1
  %op16 = sdiv i32 %arg0, %op21
  %op17 = add i32 %op21, %op16
  %op19 = sdiv i32 %op17, 2
  br label %label_1
}
define i32 @main() {
label_entry:
  %op4 = call i32 @fsqrt(i32 400)
  call void @put_int(i32 %op4)
  call void @put_char(i32 10)
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 0
}
