define i32 @maxSubArray(i32* %arg0, i32 %arg1) {
label_entry:
  %op6 = icmp eq i32 %arg1, 0
  br i1 %op6, label %label_1, label %label_2
label_ret:                                                ; preds = %label_1, %label_3, %label_7
  %op41 = phi i32 [ %op43, %label_7 ], [ %op12, %label_3 ], [ 0, %label_1 ]
  ret i32 %op41
label_1:                                                ; preds = %label_entry
  br label %label_ret
label_2:                                                ; preds = %label_entry
  %op9 = icmp eq i32 %arg1, 1
  br i1 %op9, label %label_3, label %label_4
label_3:                                                ; preds = %label_2
  %op11 = getelementptr i32, i32* %arg0, i32 0
  %op12 = load i32, i32* %op11
  br label %label_ret
label_4:                                                ; preds = %label_2
  %op15 = getelementptr i32, i32* %arg0, i32 0
  %op16 = load i32, i32* %op15
  br label %label_5
label_5:                                                ; preds = %label_4, %label_11
  %op42 = phi i32 [ 1, %label_4 ], [ %op37, %label_11 ]
  %op43 = phi i32 [ %op16, %label_4 ], [ %op46, %label_11 ]
  %op44 = phi i32 [ %op16, %label_4 ], [ %op31, %label_11 ]
  %op22 = icmp slt i32 %op42, %arg1
  br i1 %op22, label %label_6, label %label_7
label_6:                                                ; preds = %label_5
  %op24 = icmp slt i32 %op44, 0
  br i1 %op24, label %label_8, label %label_9
label_7:                                                ; preds = %label_5
  br label %label_ret
label_8:                                                ; preds = %label_6
  br label %label_9
label_9:                                                ; preds = %label_6, %label_8
  %op45 = phi i32 [ %op44, %label_6 ], [ 0, %label_8 ]
  %op29 = getelementptr i32, i32* %arg0, i32 %op42
  %op30 = load i32, i32* %op29
  %op31 = add i32 %op45, %op30
  %op34 = icmp slt i32 %op43, %op31
  br i1 %op34, label %label_10, label %label_11
label_10:                                                ; preds = %label_9
  br label %label_11
label_11:                                                ; preds = %label_9, %label_10
  %op46 = phi i32 [ %op43, %label_9 ], [ %op31, %label_10 ]
  %op37 = add i32 %op42, 1
  br label %label_5
}
define i32 @main() {
label_entry:
  %op2 = alloca [10 x i32]
  %op3 = getelementptr [10 x i32], [10 x i32]* %op2, i32 0, i32 0
  store i32 -4, i32* %op3
  %op4 = getelementptr [10 x i32], [10 x i32]* %op2, i32 0, i32 1
  store i32 3, i32* %op4
  %op5 = getelementptr [10 x i32], [10 x i32]* %op2, i32 0, i32 2
  store i32 9, i32* %op5
  %op6 = getelementptr [10 x i32], [10 x i32]* %op2, i32 0, i32 3
  store i32 -2, i32* %op6
  %op7 = getelementptr [10 x i32], [10 x i32]* %op2, i32 0, i32 4
  store i32 0, i32* %op7
  %op8 = getelementptr [10 x i32], [10 x i32]* %op2, i32 0, i32 5
  store i32 1, i32* %op8
  %op9 = getelementptr [10 x i32], [10 x i32]* %op2, i32 0, i32 6
  store i32 -6, i32* %op9
  %op10 = getelementptr [10 x i32], [10 x i32]* %op2, i32 0, i32 7
  store i32 5, i32* %op10
  %op11 = getelementptr [10 x i32], [10 x i32]* %op2, i32 0, i32 8
  store i32 7, i32* %op11
  %op12 = getelementptr [10 x i32], [10 x i32]* %op2, i32 0, i32 9
  store i32 8, i32* %op12
  %op15 = call i32 @maxSubArray(i32* %op3, i32 10)
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op15
}
