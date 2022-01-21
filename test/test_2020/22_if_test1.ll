define i32 @ifElse() {
label_entry:
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 25
}
define i32 @main() {
label_entry:
  %op1 = call i32 @ifElse()
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op1
}
