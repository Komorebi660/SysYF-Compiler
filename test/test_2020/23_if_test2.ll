define i32 @ifElseElseIf() {
label_entry:
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 132
}
define i32 @main() {
label_entry:
  %op1 = call i32 @ifElseElseIf()
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op1
}
