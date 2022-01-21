define i32 @func1() {
label_entry:
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 1
}
define i32 @func2() {
label_entry:
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 2
}
define i32 @func3() {
label_entry:
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 4
}
define i32 @func4() {
label_entry:
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 24
}
define i32 @main() {
label_entry:
  %op4 = call i32 @func1()
  %op5 = call i32 @func2()
  %op6 = add i32 %op4, %op5
  %op7 = call i32 @func3()
  %op8 = add i32 %op6, %op7
  %op9 = call i32 @func4()
  %op10 = add i32 %op8, %op9
  %op12 = add i32 %op10, 32
  %op14 = add i32 %op12, 32
  %op16 = add i32 %op14, 32
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op16
}
