@k = global i32 zeroinitializer
@n = constant i32 10
declare void @put_int(i32)

define i32 @main() {
label_entry:
  store i32 1, i32* @k
  br label %label_1
label_ret:                                                ; preds = %label_3
  ret i32 %op15
label_1:                                                ; preds = %label_entry, %label_2
  %op16 = phi i32 [ 0, %label_entry ], [ %op8, %label_2 ]
  %op4 = load i32, i32* @n
  %op5 = sub i32 %op4, 1
  %op6 = icmp sle i32 %op16, %op5
  br i1 %op6, label %label_2, label %label_3
label_2:                                                ; preds = %label_1
  %op8 = add i32 %op16, 1
  %op11 = load i32, i32* @k
  %op12 = load i32, i32* @k
  %op13 = add i32 %op11, %op12
  store i32 %op13, i32* @k
  br label %label_1
label_3:                                                ; preds = %label_1
  %op14 = load i32, i32* @k
  call void @put_int(i32 %op14)
  %op15 = load i32, i32* @k
  br label %label_ret
}
