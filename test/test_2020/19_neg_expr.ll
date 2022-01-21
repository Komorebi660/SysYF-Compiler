@a = global i32 zeroinitializer
@b = global i32 zeroinitializer
declare i32 @get_int()

declare void @put_int(i32)

define i32 @main() {
label_entry:
  %op1 = call i32 @get_int()
  store i32 %op1, i32* @a
  %op2 = call i32 @get_int()
  store i32 %op2, i32* @b
  %op4 = load i32, i32* @a
  %op5 = load i32, i32* @b
  %op6 = add i32 %op4, %op5
  %op7 = mul i32 %op6, -1
  call void @put_int(i32 %op7)
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 0
}
