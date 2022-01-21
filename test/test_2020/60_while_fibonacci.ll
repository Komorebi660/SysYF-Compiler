@n = global i32 zeroinitializer
declare i32 @get_int()

define i32 @fib(i32 %arg0) {
label_entry:
  %op7 = icmp eq i32 %arg0, 0
  br i1 %op7, label %label_1, label %label_2
label_ret:                                                ; preds = %label_1, %label_3, %label_7
  %op25 = phi i32 [ %op26, %label_7 ], [ 1, %label_3 ], [ 0, %label_1 ]
  ret i32 %op25
label_1:                                                ; preds = %label_entry
  br label %label_ret
label_2:                                                ; preds = %label_entry
  %op10 = icmp eq i32 %arg0, 1
  br i1 %op10, label %label_3, label %label_4
label_3:                                                ; preds = %label_2
  br label %label_ret
label_4:                                                ; preds = %label_2
  br label %label_5
label_5:                                                ; preds = %label_4, %label_6
  %op26 = phi i32 [ %op15, %label_6 ], [ undef, %label_4 ]
  %op27 = phi i32 [ 1, %label_4 ], [ %op15, %label_6 ]
  %op28 = phi i32 [ 0, %label_4 ], [ %op27, %label_6 ]
  %op29 = phi i32 [ %arg0, %label_4 ], [ %op19, %label_6 ]
  %op12 = icmp sgt i32 %op29, 1
  br i1 %op12, label %label_6, label %label_7
label_6:                                                ; preds = %label_5
  %op15 = add i32 %op28, %op27
  %op19 = sub i32 %op29, 1
  br label %label_5
label_7:                                                ; preds = %label_5
  br label %label_ret
}
define i32 @main() {
label_entry:
  %op1 = call i32 @get_int()
  store i32 %op1, i32* @n
  %op3 = load i32, i32* @n
  %op4 = call i32 @fib(i32 %op3)
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op4
}
