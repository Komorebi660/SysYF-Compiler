@a = global i32 zeroinitializer
@b = global i32 zeroinitializer
@c = global i32 zeroinitializer
@d = global i32 zeroinitializer
@e = global i32 zeroinitializer
declare i32 @get_int()

define i32 @main() {
label_entry:
  %op1 = call i32 @get_int()
  store i32 %op1, i32* @a
  %op2 = call i32 @get_int()
  store i32 %op2, i32* @b
  %op3 = call i32 @get_int()
  store i32 %op3, i32* @c
  %op4 = call i32 @get_int()
  store i32 %op4, i32* @d
  %op5 = call i32 @get_int()
  store i32 %op5, i32* @e
  %op7 = load i32, i32* @a
  %op8 = load i32, i32* @b
  %op9 = load i32, i32* @c
  %op10 = mul i32 %op8, %op9
  %op11 = sub i32 %op7, %op10
  %op12 = load i32, i32* @d
  %op13 = load i32, i32* @a
  %op14 = load i32, i32* @c
  %op15 = sdiv i32 %op13, %op14
  %op16 = sub i32 %op12, %op15
  %op17 = icmp ne i32 %op11, %op16
  br i1 %op17, label %label_1, label %label_4
label_ret:                                                ; preds = %label_2
  ret i32 %op38
label_1:                                                ; preds = %label_entry, %label_4, %label_3
  br label %label_2
label_2:                                                ; preds = %label_3, %label_1
  %op38 = phi i32 [ 0, %label_3 ], [ 1, %label_1 ]
  br label %label_ret
label_3:                                                ; preds = %label_4
  %op20 = load i32, i32* @a
  %op21 = load i32, i32* @b
  %op22 = add i32 %op20, %op21
  %op23 = load i32, i32* @c
  %op24 = add i32 %op22, %op23
  %op25 = load i32, i32* @d
  %op26 = load i32, i32* @e
  %op27 = add i32 %op25, %op26
  %op28 = icmp eq i32 %op24, %op27
  br i1 %op28, label %label_1, label %label_2
label_4:                                                ; preds = %label_entry
  %op29 = load i32, i32* @a
  %op30 = load i32, i32* @b
  %op31 = mul i32 %op29, %op30
  %op32 = load i32, i32* @c
  %op33 = sdiv i32 %op31, %op32
  %op34 = load i32, i32* @e
  %op35 = load i32, i32* @d
  %op36 = add i32 %op34, %op35
  %op37 = icmp eq i32 %op33, %op36
  br i1 %op37, label %label_1, label %label_3
}
