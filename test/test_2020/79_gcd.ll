@n = global i32 zeroinitializer
declare i32 @get_int()

define i32 @gcd(i32 %arg0, i32 %arg1) {
label_entry:
  %op9 = icmp slt i32 %arg0, %arg1
  br i1 %op9, label %label_1, label %label_2
label_ret:                                                ; preds = %label_3
  ret i32 %op29
label_1:                                                ; preds = %label_entry
  br label %label_2
label_2:                                                ; preds = %label_entry, %label_1
  %op25 = phi i32 [ %arg0, %label_entry ], [ %arg1, %label_1 ]
  %op26 = phi i32 [ %arg1, %label_entry ], [ %arg0, %label_1 ]
  %op16 = srem i32 %op25, %op26
  br label %label_3
label_3:                                                ; preds = %label_2, %label_4
  %op27 = phi i32 [ %op16, %label_2 ], [ %op23, %label_4 ]
  %op29 = phi i32 [ %op26, %label_2 ], [ %op27, %label_4 ]
  %op18 = icmp ne i32 %op27, 0
  br i1 %op18, label %label_4, label %label_ret
label_4:                                                ; preds = %label_3
  %op23 = srem i32 %op29, %op27
  br label %label_3
}
define i32 @main() {
label_entry:
  %op3 = call i32 @get_int()
  %op4 = call i32 @get_int()
  %op7 = call i32 @gcd(i32 %op3, i32 %op4)
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op7
}
