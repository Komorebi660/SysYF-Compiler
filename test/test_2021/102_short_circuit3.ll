@a = global i32 zeroinitializer
@b = global i32 zeroinitializer
@d = global i32 zeroinitializer
declare void @put_int(i32)

declare void @put_char(i32)

define i32 @set_a(i32 %arg0) {
label_entry:
  store i32 %arg0, i32* @a
  %op4 = load i32, i32* @a
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op4
}
define i32 @set_b(i32 %arg0) {
label_entry:
  store i32 %arg0, i32* @b
  %op4 = load i32, i32* @b
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op4
}
define i32 @set_d(i32 %arg0) {
label_entry:
  store i32 %arg0, i32* @d
  %op4 = load i32, i32* @d
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op4
}
define i32 @main() {
label_entry:
  store i32 2, i32* @a
  store i32 3, i32* @b
  %op1 = call i32 @set_a(i32 0)
  %op2 = icmp ne i32 %op1, 0
  br i1 %op2, label %label_3, label %label_2
label_ret:                                                ; preds = %label_43
  ret i32 0
label_2:                                                ; preds = %label_entry, %label_3
  %op4 = load i32, i32* @a
  call void @put_int(i32 %op4)
  call void @put_char(i32 32)
  %op5 = load i32, i32* @b
  call void @put_int(i32 %op5)
  call void @put_char(i32 32)
  store i32 2, i32* @a
  store i32 3, i32* @b
  %op6 = call i32 @set_a(i32 0)
  %op7 = icmp ne i32 %op6, 0
  br i1 %op7, label %label_6, label %label_5
label_3:                                                ; preds = %label_entry
  %op8 = call i32 @set_b(i32 1)
  br label %label_2
label_5:                                                ; preds = %label_2, %label_6
  %op10 = load i32, i32* @a
  call void @put_int(i32 %op10)
  call void @put_char(i32 32)
  %op11 = load i32, i32* @b
  call void @put_int(i32 %op11)
  call void @put_char(i32 10)
  store i32 2, i32* @d
  br label %label_9
label_6:                                                ; preds = %label_2
  %op15 = call i32 @set_b(i32 1)
  br label %label_5
label_8:                                                ; preds = %label_9
  %op17 = load i32, i32* @d
  call void @put_int(i32 %op17)
  call void @put_char(i32 32)
  br label %label_11
label_9:                                                ; preds = %label_5
  %op20 = call i32 @set_d(i32 3)
  br label %label_8
label_11:                                                ; preds = %label_8
  %op22 = load i32, i32* @d
  call void @put_int(i32 %op22)
  call void @put_char(i32 10)
  br label %label_13
label_13:                                                ; preds = %label_11
  call void @put_char(i32 65)
  br label %label_19
label_19:                                                ; preds = %label_13
  call void @put_char(i32 68)
  br label %label_23
label_23:                                                ; preds = %label_19
  call void @put_char(i32 70)
  br label %label_24
label_24:                                                ; preds = %label_23
  call void @put_char(i32 10)
  br label %label_29
label_29:                                                ; preds = %label_24
  call void @put_char(i32 67)
  br label %label_35
label_35:                                                ; preds = %label_29
  call void @put_char(i32 73)
  br label %label_38
label_38:                                                ; preds = %label_35
  call void @put_char(i32 74)
  br label %label_42
label_42:                                                ; preds = %label_38
  call void @put_char(i32 75)
  br label %label_43
label_43:                                                ; preds = %label_42
  call void @put_char(i32 10)
  br label %label_ret
}
