@a = global [3 x [4 x i32]] zeroinitializer
define i32 @main() {
label_entry:
  br label %label_1
label_ret:                                                ; preds = %label_1
  ret i32 0
label_1:                                                ; preds = %label_entry, %label_6
  %op28 = phi i32 [ 0, %label_entry ], [ %op31, %label_6 ]
  %op29 = phi i32 [ 0, %label_entry ], [ %op13, %label_6 ]
  %op5 = icmp sle i32 %op29, 5
  br i1 %op5, label %label_2, label %label_ret
label_2:                                                ; preds = %label_1
  br label %label_4
label_4:                                                ; preds = %label_2, %label_8
  %op30 = phi i32 [ %op29, %label_2 ], [ %op22, %label_8 ]
  %op31 = phi i32 [ %op28, %label_2 ], [ %op32, %label_8 ]
  %op9 = icmp sge i32 %op30, 0
  br i1 %op9, label %label_5, label %label_6
label_5:                                                ; preds = %label_4
  %op11 = icmp slt i32 %op30, 4
  br i1 %op11, label %label_9, label %label_8
label_6:                                                ; preds = %label_4
  %op13 = add i32 %op29, 1
  br label %label_1
label_7:                                                ; preds = %label_9
  %op18 = getelementptr [3 x [4 x i32]], [3 x [4 x i32]]* @a, i32 0, i32 %op25
  %op20 = getelementptr [4 x i32], [4 x i32]* %op18, i32 0, i32 %op30
  store i32 %op31, i32* %op20
  br label %label_8
label_8:                                                ; preds = %label_5, %label_9, %label_7
  %op32 = phi i32 [ %op31, %label_5 ], [ %op31, %label_9 ], [ 1, %label_7 ]
  %op22 = sub i32 %op30, 1
  br label %label_4
label_9:                                                ; preds = %label_5
  %op25 = sub i32 %op29, %op30
  %op26 = icmp slt i32 %op25, 3
  br i1 %op26, label %label_7, label %label_8
}
