@a = global i32 zeroinitializer
define i32 @myFunc(i32 %arg0, i32 %arg1, i32 %arg2) {
label_entry:
  br label %label_3
label_ret:                                                ; preds = %label_5
  ret i32 %op17
label_3:                                                ; preds = %label_4, %label_entry
  %op20 = phi i32 [ %op14, %label_4 ], [ %arg1, %label_entry ]
  %op12 = icmp sgt i32 %op20, 0
  br i1 %op12, label %label_4, label %label_5
label_4:                                                ; preds = %label_3
  %op14 = sub i32 %op20, 1
  br label %label_3
label_5:                                                ; preds = %label_3
  %op17 = add i32 2, %op20
  br label %label_ret
}
define i32 @main() {
label_entry:
  store i32 3, i32* @a
  %op2 = call i32 @myFunc(i32 1, i32 2, i32 1)
  %op3 = load i32, i32* @a
  %op5 = add i32 %op3, %op2
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op5
}
