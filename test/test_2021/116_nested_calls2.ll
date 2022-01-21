declare void @put_int(i32)

define i32 @f(i32 %arg0, i32 %arg1) {
label_entry:
  %op7 = mul i32 %arg0, %arg1
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op7
}
define i32 @g(i32 %arg0, i32 %arg1) {
label_entry:
  %op7 = srem i32 %arg0, %arg1
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op7
}
define i32 @h(i32 %arg0, i32 %arg1) {
label_entry:
  %op7 = call i32 @g(i32 %arg0, i32 %arg1)
  %op8 = call i32 @f(i32 2, i32 %op7)
  %op11 = call i32 @f(i32 %arg0, i32 %arg1)
  %op12 = call i32 @g(i32 %op11, i32 4)
  %op13 = call i32 @f(i32 %op8, i32 %op12)
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op13
}
define i32 @main() {
label_entry:
  %op1 = call i32 @h(i32 11, i32 3)
  call void @put_int(i32 %op1)
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 0
}
