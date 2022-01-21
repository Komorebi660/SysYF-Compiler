@a = global [5 x i32] zeroinitializer
declare i32 @get_int()

define i32 @main() {
label_entry:
  %op1 = call i32 @get_int()
  %op2 = getelementptr [5 x i32], [5 x i32]* @a, i32 0, i32 0
  store i32 %op1, i32* %op2
  %op3 = call i32 @get_int()
  %op4 = getelementptr [5 x i32], [5 x i32]* @a, i32 0, i32 1
  store i32 %op3, i32* %op4
  %op5 = call i32 @get_int()
  %op6 = getelementptr [5 x i32], [5 x i32]* @a, i32 0, i32 2
  store i32 %op5, i32* %op6
  %op7 = call i32 @get_int()
  %op8 = getelementptr [5 x i32], [5 x i32]* @a, i32 0, i32 3
  store i32 %op7, i32* %op8
  %op9 = call i32 @get_int()
  %op10 = getelementptr [5 x i32], [5 x i32]* @a, i32 0, i32 4
  store i32 %op9, i32* %op10
  br label %label_1
label_ret:                                                ; preds = %label_1
  ret i32 %op24
label_1:                                                ; preds = %label_entry, %label_2
  %op24 = phi i32 [ 0, %label_entry ], [ %op20, %label_2 ]
  %op25 = phi i32 [ 4, %label_entry ], [ %op22, %label_2 ]
  %op15 = icmp sgt i32 %op25, 1
  br i1 %op15, label %label_2, label %label_ret
label_2:                                                ; preds = %label_1
  %op18 = getelementptr [5 x i32], [5 x i32]* @a, i32 0, i32 %op25
  %op19 = load i32, i32* %op18
  %op20 = add i32 %op24, %op19
  %op22 = sub i32 %op25, 1
  br label %label_1
}
