@N = constant i32 -1
@arr = global [6 x i32] [i32 1, i32 2, i32 33, i32 4, i32 5, i32 6]
define i32 @main() {
label_entry:
  br label %label_1
label_ret:                                                ; preds = %label_1
  ret i32 %op14
label_1:                                                ; preds = %label_entry, %label_2
  %op14 = phi i32 [ 0, %label_entry ], [ %op10, %label_2 ]
  %op15 = phi i32 [ 0, %label_entry ], [ %op12, %label_2 ]
  %op5 = icmp slt i32 %op15, 6
  br i1 %op5, label %label_2, label %label_ret
label_2:                                                ; preds = %label_1
  %op8 = getelementptr [6 x i32], [6 x i32]* @arr, i32 0, i32 %op15
  %op9 = load i32, i32* %op8
  %op10 = add i32 %op14, %op9
  %op12 = add i32 %op15, 1
  br label %label_1
}
