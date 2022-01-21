@a = global i32 1
@b = global i32 0
@c = global i32 1
@d = global i32 2
@e = global i32 4
declare void @put_int(i32)

define i32 @main() {
label_entry:
  %op2 = load i32, i32* @a
  %op3 = load i32, i32* @b
  %op4 = mul i32 %op2, %op3
  %op5 = load i32, i32* @c
  %op6 = sdiv i32 %op4, %op5
  %op7 = load i32, i32* @e
  %op8 = load i32, i32* @d
  %op9 = add i32 %op7, %op8
  %op10 = icmp eq i32 %op6, %op9
  br i1 %op10, label %label_4, label %label_3
label_ret:                                                ; preds = %label_2
  ret i32 %op36
label_1:                                                ; preds = %label_4, %label_3
  br label %label_2
label_2:                                                ; preds = %label_3, %label_1
  %op36 = phi i32 [ 0, %label_3 ], [ 1, %label_1 ]
  call void @put_int(i32 %op36)
  br label %label_ret
label_3:                                                ; preds = %label_entry, %label_4
  %op14 = load i32, i32* @a
  %op15 = load i32, i32* @b
  %op16 = load i32, i32* @c
  %op17 = mul i32 %op15, %op16
  %op18 = sub i32 %op14, %op17
  %op19 = load i32, i32* @d
  %op20 = load i32, i32* @a
  %op21 = load i32, i32* @c
  %op22 = sdiv i32 %op20, %op21
  %op23 = sub i32 %op19, %op22
  %op24 = icmp eq i32 %op18, %op23
  br i1 %op24, label %label_1, label %label_2
label_4:                                                ; preds = %label_entry
  %op25 = load i32, i32* @a
  %op26 = load i32, i32* @a
  %op27 = load i32, i32* @b
  %op28 = add i32 %op26, %op27
  %op29 = mul i32 %op25, %op28
  %op30 = load i32, i32* @c
  %op31 = add i32 %op29, %op30
  %op32 = load i32, i32* @d
  %op33 = load i32, i32* @e
  %op34 = add i32 %op32, %op33
  %op35 = icmp sle i32 %op31, %op34
  br i1 %op35, label %label_1, label %label_3
}
