@a = global i32 -1
@b = global i32 1
declare void @put_int(i32)

declare void @put_char(i32)

define i32 @inc_a() {
label_entry:
  %op2 = load i32, i32* @a
  %op4 = add i32 %op2, 1
  store i32 %op4, i32* @a
  %op6 = load i32, i32* @a
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op6
}
define i32 @main() {
label_entry:
  br label %label_1
label_ret:                                                ; preds = %label_3
  ret i32 %op9
label_1:                                                ; preds = %label_entry, %label_10
  %op31 = phi i32 [ 5, %label_entry ], [ %op23, %label_10 ]
  %op4 = icmp sge i32 %op31, 0
  br i1 %op4, label %label_2, label %label_3
label_2:                                                ; preds = %label_1
  %op5 = call i32 @inc_a()
  %op6 = icmp ne i32 %op5, 0
  br i1 %op6, label %label_7, label %label_5
label_3:                                                ; preds = %label_1
  %op7 = load i32, i32* @a
  call void @put_int(i32 %op7)
  call void @put_char(i32 32)
  %op8 = load i32, i32* @b
  call void @put_int(i32 %op8)
  call void @put_char(i32 10)
  %op9 = load i32, i32* @a
  br label %label_ret
label_4:                                                ; preds = %label_6
  %op10 = load i32, i32* @a
  call void @put_int(i32 %op10)
  call void @put_char(i32 32)
  %op11 = load i32, i32* @b
  call void @put_int(i32 %op11)
  call void @put_char(i32 10)
  br label %label_5
label_5:                                                ; preds = %label_2, %label_7, %label_6, %label_4
  %op12 = call i32 @inc_a()
  %op13 = icmp slt i32 %op12, 14
  br i1 %op13, label %label_8, label %label_11
label_6:                                                ; preds = %label_7
  %op14 = call i32 @inc_a()
  %op15 = icmp ne i32 %op14, 0
  br i1 %op15, label %label_4, label %label_5
label_7:                                                ; preds = %label_2
  %op16 = call i32 @inc_a()
  %op17 = icmp ne i32 %op16, 0
  br i1 %op17, label %label_6, label %label_5
label_8:                                                ; preds = %label_5, %label_12
  %op18 = load i32, i32* @a
  call void @put_int(i32 %op18)
  call void @put_char(i32 10)
  %op19 = load i32, i32* @b
  %op20 = mul i32 %op19, 2
  store i32 %op20, i32* @b
  br label %label_10
label_9:                                                ; preds = %label_11, %label_12
  %op21 = call i32 @inc_a()
  br label %label_10
label_10:                                                ; preds = %label_8, %label_9
  %op23 = sub i32 %op31, 1
  br label %label_1
label_11:                                                ; preds = %label_5
  %op24 = call i32 @inc_a()
  %op25 = icmp ne i32 %op24, 0
  br i1 %op25, label %label_12, label %label_9
label_12:                                                ; preds = %label_11
  %op26 = call i32 @inc_a()
  %op27 = call i32 @inc_a()
  %op28 = sub i32 %op26, %op27
  %op29 = add i32 %op28, 1
  %op30 = icmp ne i32 %op29, 0
  br i1 %op30, label %label_8, label %label_9
}
