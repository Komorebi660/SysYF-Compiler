@n = global i32 zeroinitializer
declare i32 @get_int()

declare void @put_int(i32)

declare void @put_char(i32)

define i32 @f(i32 %arg0) {
label_entry:
  %op4 = icmp eq i32 %arg0, 1
  br i1 %op4, label %label_1, label %label_2
label_ret:                                                ; preds = %label_1, %label_3, %label_4
  %op21 = phi i32 [ %op19, %label_4 ], [ 1, %label_3 ], [ 1, %label_1 ]
  ret i32 %op21
label_1:                                                ; preds = %label_entry
  br label %label_ret
label_2:                                                ; preds = %label_entry
  %op7 = icmp eq i32 %arg0, 2
  br i1 %op7, label %label_3, label %label_4
label_3:                                                ; preds = %label_2
  br label %label_ret
label_4:                                                ; preds = %label_2
  %op11 = sub i32 %arg0, 1
  %op13 = sub i32 %arg0, 2
  %op16 = call i32 @f(i32 %op11)
  %op18 = call i32 @f(i32 %op13)
  %op19 = add i32 %op16, %op18
  br label %label_ret
}
define i32 @main() {
label_entry:
  %op1 = call i32 @get_int()
  store i32 %op1, i32* @n
  %op4 = load i32, i32* @n
  %op5 = call i32 @f(i32 %op4)
  call void @put_int(i32 %op5)
  call void @put_char(i32 10)
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op5
}
