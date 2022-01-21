declare void @put_int(i32)

define i32 @ifElseIf() {
label_entry:
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 -5
}
define i32 @main() {
label_entry:
  %op1 = call i32 @ifElseIf()
  call void @put_int(i32 %op1)
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 0
}
