define i32 @main() {
label_entry:
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 88
}
