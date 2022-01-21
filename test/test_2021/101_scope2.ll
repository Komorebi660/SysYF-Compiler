@k = global i32 zeroinitializer
declare void @put_int(i32)

define i32 @main() {
label_entry:
  store i32 3389, i32* @k
  br label %label_1
label_ret:                                                ; preds = %label_2
  ret i32 %op7
label_1:                                                ; preds = %label_entry
  %op4 = load i32, i32* @k
  %op5 = add i32 %op4, 1
  store i32 %op5, i32* @k
  br label %label_3
label_2:                                                ; preds = %label_5
  %op7 = load i32, i32* @k
  br label %label_ret
label_3:                                                ; preds = %label_1, %label_7
  %op27 = phi i32 [ 112, %label_1 ], [ %op28, %label_7 ]
  %op9 = icmp sgt i32 %op27, 10
  br i1 %op9, label %label_4, label %label_5
label_4:                                                ; preds = %label_3
  %op11 = sub i32 %op27, 88
  %op13 = icmp slt i32 %op11, 1000
  br i1 %op13, label %label_6, label %label_7
label_5:                                                ; preds = %label_3
  call void @put_int(i32 %op27)
  br label %label_2
label_6:                                                ; preds = %label_4
  %op19 = sub i32 %op11, 10
  %op23 = add i32 %op19, 11
  %op25 = add i32 %op23, 11
  br label %label_7
label_7:                                                ; preds = %label_4, %label_6
  %op28 = phi i32 [ %op11, %label_4 ], [ %op25, %label_6 ]
  br label %label_3
}
