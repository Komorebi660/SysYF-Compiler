define i32 @defn() {
label_entry:
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 4
}
define i32 @main() {
label_entry:
  %op2 = call i32 @defn()
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op2
}
