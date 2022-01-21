@a = global i32 zeroinitializer
@b = global i32 zeroinitializer
define i32 @main() {
label_entry:
  store i32 10, i32* @a
  store i32 5, i32* @b
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 28
}
