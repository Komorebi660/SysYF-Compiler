@a = global i32 zeroinitializer
@b = global i32 zeroinitializer
declare i32 @get_int()

define i32 @main() {
label_entry:
  %op1 = call i32 @get_int()
  store i32 %op1, i32* @a
  %op2 = call i32 @get_int()
  store i32 %op2, i32* @b
  %op4 = load i32, i32* @a
  %op5 = load i32, i32* @b
  %op6 = icmp eq i32 %op4, %op5
  br i1 %op6, label %label_4, label %label_2
label_ret:                                                ; preds = %label_3
  ret i32 %op11
label_1:                                                ; preds = %label_4
  br label %label_3
label_2:                                                ; preds = %label_entry, %label_4
  br label %label_3
label_3:                                                ; preds = %label_1, %label_2
  %op11 = phi i32 [ 0, %label_2 ], [ 1, %label_1 ]
  br label %label_ret
label_4:                                                ; preds = %label_entry
  %op9 = load i32, i32* @a
  %op10 = icmp ne i32 %op9, 3
  br i1 %op10, label %label_1, label %label_2
}
