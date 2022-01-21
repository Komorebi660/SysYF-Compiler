define i32 @maxArea(i32* %arg0, i32 %arg1) {
label_entry:
  %op8 = sub i32 %arg1, 1
  br label %label_1
label_ret:                                                ; preds = %label_1
  ret i32 %op59
label_1:                                                ; preds = %label_entry, %label_11
  %op59 = phi i32 [ -1, %label_entry ], [ %op63, %label_11 ]
  %op60 = phi i32 [ %op8, %label_entry ], [ %op64, %label_11 ]
  %op61 = phi i32 [ 0, %label_entry ], [ %op65, %label_11 ]
  %op13 = icmp slt i32 %op61, %op60
  br i1 %op13, label %label_2, label %label_ret
label_2:                                                ; preds = %label_1
  %op17 = getelementptr i32, i32* %arg0, i32 %op61
  %op18 = load i32, i32* %op17
  %op21 = getelementptr i32, i32* %arg0, i32 %op60
  %op22 = load i32, i32* %op21
  %op23 = icmp slt i32 %op18, %op22
  br i1 %op23, label %label_4, label %label_5
label_4:                                                ; preds = %label_2
  %op27 = sub i32 %op60, %op61
  %op31 = load i32, i32* %op17
  %op32 = mul i32 %op27, %op31
  br label %label_6
label_5:                                                ; preds = %label_2
  %op35 = sub i32 %op60, %op61
  %op39 = load i32, i32* %op21
  %op40 = mul i32 %op35, %op39
  br label %label_6
label_6:                                                ; preds = %label_4, %label_5
  %op62 = phi i32 [ %op40, %label_5 ], [ %op32, %label_4 ]
  %op43 = icmp sgt i32 %op62, %op59
  br i1 %op43, label %label_7, label %label_8
label_7:                                                ; preds = %label_6
  br label %label_8
label_8:                                                ; preds = %label_6, %label_7
  %op63 = phi i32 [ %op59, %label_6 ], [ %op62, %label_7 ]
  %op48 = load i32, i32* %op17
  %op52 = load i32, i32* %op21
  %op53 = icmp sgt i32 %op48, %op52
  br i1 %op53, label %label_9, label %label_10
label_9:                                                ; preds = %label_8
  %op55 = sub i32 %op60, 1
  br label %label_11
label_10:                                                ; preds = %label_8
  %op57 = add i32 %op61, 1
  br label %label_11
label_11:                                                ; preds = %label_9, %label_10
  %op64 = phi i32 [ %op60, %label_10 ], [ %op55, %label_9 ]
  %op65 = phi i32 [ %op57, %label_10 ], [ %op61, %label_9 ]
  br label %label_1
}
define i32 @main() {
label_entry:
  %op2 = alloca [10 x i32]
  %op3 = getelementptr [10 x i32], [10 x i32]* %op2, i32 0, i32 0
  store i32 3, i32* %op3
  %op4 = getelementptr [10 x i32], [10 x i32]* %op2, i32 0, i32 1
  store i32 3, i32* %op4
  %op5 = getelementptr [10 x i32], [10 x i32]* %op2, i32 0, i32 2
  store i32 9, i32* %op5
  %op6 = getelementptr [10 x i32], [10 x i32]* %op2, i32 0, i32 3
  store i32 0, i32* %op6
  %op7 = getelementptr [10 x i32], [10 x i32]* %op2, i32 0, i32 4
  store i32 0, i32* %op7
  %op8 = getelementptr [10 x i32], [10 x i32]* %op2, i32 0, i32 5
  store i32 1, i32* %op8
  %op9 = getelementptr [10 x i32], [10 x i32]* %op2, i32 0, i32 6
  store i32 1, i32* %op9
  %op10 = getelementptr [10 x i32], [10 x i32]* %op2, i32 0, i32 7
  store i32 5, i32* %op10
  %op11 = getelementptr [10 x i32], [10 x i32]* %op2, i32 0, i32 8
  store i32 7, i32* %op11
  %op12 = getelementptr [10 x i32], [10 x i32]* %op2, i32 0, i32 9
  store i32 8, i32* %op12
  %op15 = call i32 @maxArea(i32* %op3, i32 10)
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op15
}
