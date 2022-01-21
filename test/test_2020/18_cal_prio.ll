@a = global i32 zeroinitializer
@b = global i32 zeroinitializer
@c = global i32 zeroinitializer
declare i32 @get_int()

define i32 @main() {
label_entry:
  %op1 = call i32 @get_int()
  store i32 %op1, i32* @a
  %op2 = call i32 @get_int()
  store i32 %op2, i32* @b
  %op3 = call i32 @get_int()
  store i32 %op3, i32* @c
  %op5 = load i32, i32* @a
  %op6 = load i32, i32* @b
  %op7 = load i32, i32* @c
  %op8 = mul i32 %op6, %op7
  %op9 = add i32 %op5, %op8
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op9
}
