define i32 @fib(i32 %arg0) {
label_entry:
  %op4 = icmp eq i32 %arg0, 0
  br i1 %op4, label %label_1, label %label_2
label_ret:                                                ; preds = %label_1, %label_3, %label_4
  %op19 = phi i32 [ %op18, %label_4 ], [ 1, %label_3 ], [ 0, %label_1 ]
  ret i32 %op19
label_1:                                                ; preds = %label_entry
  br label %label_ret
label_2:                                                ; preds = %label_entry
  %op7 = icmp eq i32 %arg0, 1
  br i1 %op7, label %label_3, label %label_4
label_3:                                                ; preds = %label_2
  br label %label_ret
label_4:                                                ; preds = %label_2
  %op10 = sub i32 %arg0, 1
  %op13 = sub i32 %arg0, 2
  %op15 = call i32 @fib(i32 %op10)
  %op17 = call i32 @fib(i32 %op13)
  %op18 = add i32 %op15, %op17
  br label %label_ret
}
define i32 @main() {
label_entry:
  %op3 = call i32 @fib(i32 10)
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op3
}
