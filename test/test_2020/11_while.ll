@a = global i32 zeroinitializer
@b = global i32 zeroinitializer
define i32 @main() {
label_entry:
  store i32 0, i32* @b
  store i32 3, i32* @a
  br label %label_1
label_ret:                                                ; preds = %label_3
  ret i32 %op9
label_1:                                                ; preds = %label_entry, %label_2
  %op2 = load i32, i32* @a
  %op3 = icmp sgt i32 %op2, 0
  br i1 %op3, label %label_2, label %label_3
label_2:                                                ; preds = %label_1
  %op4 = load i32, i32* @b
  %op5 = load i32, i32* @a
  %op6 = add i32 %op4, %op5
  store i32 %op6, i32* @b
  %op7 = load i32, i32* @a
  %op8 = sub i32 %op7, 1
  store i32 %op8, i32* @a
  br label %label_1
label_3:                                                ; preds = %label_1
  %op9 = load i32, i32* @b
  br label %label_ret
}
