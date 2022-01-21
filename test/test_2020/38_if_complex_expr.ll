declare void @put_int(i32)

define i32 @main() {
label_entry:
  br label %label_1
label_ret:                                                ; preds = %label_1
  ret i32 0
label_1:                                                ; preds = %label_entry
  call void @put_int(i32 2)
  br label %label_ret
}
