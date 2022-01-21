declare void @put_int(i32)

define i32 @main() {
label_entry:
  br label %label_3
label_ret:                                                ; preds = %label_3
  ret i32 0
label_3:                                                ; preds = %label_entry
  call void @put_int(i32 4)
  br label %label_ret
}
