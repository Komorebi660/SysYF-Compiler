declare i32 @get_int()

declare void @put_int(i32)

define void @reverse(i32 %arg0) {
label_entry:
  %op4 = icmp sle i32 %arg0, 1
  br i1 %op4, label %label_1, label %label_2
label_ret:                                                ; preds = %label_3
  ret void
label_1:                                                ; preds = %label_entry
  %op5 = call i32 @get_int()
  call void @put_int(i32 %op5)
  br label %label_3
label_2:                                                ; preds = %label_entry
  %op7 = call i32 @get_int()
  %op9 = sub i32 %arg0, 1
  call void @reverse(i32 %op9)
  call void @put_int(i32 %op7)
  br label %label_3
label_3:                                                ; preds = %label_1, %label_2
  br label %label_ret
}
define i32 @main() {
label_entry:
  call void @reverse(i32 200)
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 0
}
