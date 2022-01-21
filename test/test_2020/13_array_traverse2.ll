@a = global [3 x [3 x [3 x i32]]] zeroinitializer
define i32 @main() {
label_entry:
  br label %label_1
label_ret:                                                ; preds = %label_1
  ret i32 0
label_1:                                                ; preds = %label_entry, %label_6
  %op27 = phi i32 [ 0, %label_entry ], [ %op31, %label_6 ]
  %op28 = phi i32 [ 0, %label_entry ], [ %op32, %label_6 ]
  %op29 = phi i32 [ 0, %label_entry ], [ %op33, %label_6 ]
  %op30 = phi i32 [ 0, %label_entry ], [ %op11, %label_6 ]
  %op7 = icmp slt i32 %op30, 3
  br i1 %op7, label %label_2, label %label_ret
label_2:                                                ; preds = %label_1
  br label %label_4
label_4:                                                ; preds = %label_2, %label_9
  %op31 = phi i32 [ %op27, %label_2 ], [ %op34, %label_9 ]
  %op32 = phi i32 [ %op28, %label_2 ], [ %op35, %label_9 ]
  %op33 = phi i32 [ %op29, %label_2 ], [ %op26, %label_9 ]
  %op9 = icmp slt i32 %op33, 3
  br i1 %op9, label %label_5, label %label_6
label_5:                                                ; preds = %label_4
  br label %label_7
label_6:                                                ; preds = %label_4
  %op11 = add i32 %op30, 1
  br label %label_1
label_7:                                                ; preds = %label_5, %label_8
  %op34 = phi i32 [ %op31, %label_5 ], [ %op22, %label_8 ]
  %op35 = phi i32 [ %op32, %label_5 ], [ %op24, %label_8 ]
  %op13 = icmp slt i32 %op35, 3
  br i1 %op13, label %label_8, label %label_9
label_8:                                                ; preds = %label_7
  %op16 = getelementptr [3 x [3 x [3 x i32]]], [3 x [3 x [3 x i32]]]* @a, i32 0, i32 %op30
  %op18 = getelementptr [3 x [3 x i32]], [3 x [3 x i32]]* %op16, i32 0, i32 %op33
  %op20 = getelementptr [3 x i32], [3 x i32]* %op18, i32 0, i32 %op35
  store i32 %op34, i32* %op20
  %op22 = add i32 %op34, 1
  %op24 = add i32 %op35, 1
  br label %label_7
label_9:                                                ; preds = %label_7
  %op26 = add i32 %op33, 1
  br label %label_4
}
