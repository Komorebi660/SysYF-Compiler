define i32 @fact(i32 %arg0) {
label_entry:
  %op4 = icmp eq i32 %arg0, 0
  br i1 %op4, label %label_1, label %label_2
label_ret:                                                ; preds = %label_1, %label_2
  %op13 = phi i32 [ %op12, %label_2 ], [ 1, %label_1 ]
  ret i32 %op13
label_1:                                                ; preds = %label_entry
  br label %label_ret
label_2:                                                ; preds = %label_entry
  %op8 = sub i32 %arg0, 1
  %op11 = call i32 @fact(i32 %op8)
  %op12 = mul i32 %arg0, %op11
  br label %label_ret
}
define i32 @main() {
label_entry:
  %op3 = call i32 @fact(i32 4)
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op3
}
