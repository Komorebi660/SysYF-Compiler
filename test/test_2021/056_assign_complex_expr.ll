declare void @put_int(i32)

define i32 @main() {
label_entry:
  call void @put_int(i32 -1)
  call void @put_int(i32 71)
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 0
}
