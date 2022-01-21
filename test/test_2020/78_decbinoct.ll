declare void @put_int(i32)

declare void @put_char(i32)

define i32 @dec2bin(i32 %arg0) {
label_entry:
  br label %label_1
label_ret:                                                ; preds = %label_1
  ret i32 %op25
label_1:                                                ; preds = %label_entry, %label_2
  %op23 = phi i32 [ %arg0, %label_entry ], [ %op21, %label_2 ]
  %op24 = phi i32 [ 1, %label_entry ], [ %op19, %label_2 ]
  %op25 = phi i32 [ 0, %label_entry ], [ %op17, %label_2 ]
  %op10 = icmp ne i32 %op23, 0
  br i1 %op10, label %label_2, label %label_ret
label_2:                                                ; preds = %label_1
  %op12 = srem i32 %op23, 2
  %op15 = mul i32 %op24, %op12
  %op17 = add i32 %op15, %op25
  %op19 = mul i32 %op24, 10
  %op21 = sdiv i32 %op23, 2
  br label %label_1
}
define i32 @main() {
label_entry:
  %op4 = call i32 @dec2bin(i32 400)
  call void @put_int(i32 %op4)
  call void @put_char(i32 10)
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 0
}
