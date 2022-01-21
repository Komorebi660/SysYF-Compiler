@a = global i32 zeroinitializer
define i32 @func(i32 %arg0) {
label_entry:
  %op4 = sub i32 %arg0, 1
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op4
}
define i32 @main() {
label_entry:
  store i32 10, i32* @a
  %op3 = call i32 @func(i32 10)
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op3
}
