@g = global i32 0
declare i32 @get_int()

declare void @put_int(i32)

define i32 @func(i32 %arg0) {
label_entry:
  %op3 = load i32, i32* @g
  %op5 = add i32 %op3, %arg0
  store i32 %op5, i32* @g
  %op6 = load i32, i32* @g
  call void @put_int(i32 %op6)
  %op7 = load i32, i32* @g
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op7
}
define i32 @main() {
label_entry:
  %op2 = call i32 @get_int()
  %op4 = icmp sgt i32 %op2, 10
  br i1 %op4, label %label_4, label %label_2
label_ret:                                                ; preds = %label_19
  ret i32 0
label_2:                                                ; preds = %label_entry
  br label %label_3
label_3:                                                ; preds = %label_2, %label_4
  %op6 = call i32 @get_int()
  %op8 = icmp sgt i32 %op6, 11
  br i1 %op8, label %label_8, label %label_6
label_4:                                                ; preds = %label_entry
  %op10 = call i32 @func(i32 %op2)
  br label %label_3
label_6:                                                ; preds = %label_3
  br label %label_7
label_7:                                                ; preds = %label_6, %label_8
  %op12 = call i32 @get_int()
  %op14 = icmp sle i32 %op12, 99
  br i1 %op14, label %label_9, label %label_12
label_8:                                                ; preds = %label_3
  %op16 = call i32 @func(i32 %op6)
  br label %label_7
label_9:                                                ; preds = %label_7
  br label %label_11
label_11:                                                ; preds = %label_9, %label_12
  %op18 = call i32 @get_int()
  %op20 = icmp sle i32 %op18, 100
  br i1 %op20, label %label_13, label %label_16
label_12:                                                ; preds = %label_7
  %op22 = call i32 @func(i32 %op12)
  br label %label_11
label_13:                                                ; preds = %label_11
  br label %label_15
label_15:                                                ; preds = %label_13, %label_16
  %op24 = call i32 @func(i32 99)
  %op25 = icmp eq i32 %op24, 0
  br i1 %op25, label %label_20, label %label_18
label_16:                                                ; preds = %label_11
  %op27 = call i32 @func(i32 %op18)
  br label %label_15
label_18:                                                ; preds = %label_15
  br label %label_19
label_19:                                                ; preds = %label_18, %label_20
  br label %label_ret
label_20:                                                ; preds = %label_15
  %op29 = call i32 @func(i32 100)
  br label %label_19
}
