@a = global i32 zeroinitializer
@b = global i32 zeroinitializer
@c = global i32 zeroinitializer
define void @add(i32 %arg0, i32 %arg1) {
label_entry:
  %op6 = add i32 %arg0, %arg1
  store i32 %op6, i32* @c
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret void
}
define i32 @main() {
label_entry:
  store i32 3, i32* @a
  store i32 2, i32* @b
  call void @add(i32 3, i32 2)
  %op3 = load i32, i32* @c
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op3
}
