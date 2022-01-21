define i32 @canJump(i32* %arg0, i32 %arg1) {
label_entry:
  %op6 = icmp eq i32 %arg1, 1
  br i1 %op6, label %label_1, label %label_2
label_ret:                                                ; preds = %label_1, %label_3, %label_10
  %op67 = phi i32 [ %op42, %label_10 ], [ 1, %label_3 ], [ 1, %label_1 ]
  ret i32 %op67
label_1:                                                ; preds = %label_entry
  br label %label_ret
label_2:                                                ; preds = %label_entry
  %op9 = getelementptr i32, i32* %arg0, i32 0
  %op10 = load i32, i32* %op9
  %op12 = sub i32 %arg1, 2
  %op13 = icmp sgt i32 %op10, %op12
  br i1 %op13, label %label_3, label %label_4
label_3:                                                ; preds = %label_2
  br label %label_ret
label_4:                                                ; preds = %label_2
  %op14 = alloca [10 x i32]
  br label %label_5
label_5:                                                ; preds = %label_4, %label_6
  %op68 = phi i32 [ 0, %label_4 ], [ %op23, %label_6 ]
  %op18 = sub i32 %arg1, 1
  %op19 = icmp slt i32 %op68, %op18
  br i1 %op19, label %label_6, label %label_7
label_6:                                                ; preds = %label_5
  %op21 = getelementptr [10 x i32], [10 x i32]* %op14, i32 0, i32 %op68
  store i32 0, i32* %op21
  %op23 = add i32 %op68, 1
  br label %label_5
label_7:                                                ; preds = %label_5
  %op26 = getelementptr [10 x i32], [10 x i32]* %op14, i32 0, i32 %op18
  store i32 1, i32* %op26
  br label %label_8
label_8:                                                ; preds = %label_7, %label_16
  %op70 = phi i32 [ %op12, %label_7 ], [ %op60, %label_16 ]
  %op30 = icmp sgt i32 %op70, -1
  br i1 %op30, label %label_9, label %label_10
label_9:                                                ; preds = %label_8
  %op34 = getelementptr i32, i32* %arg0, i32 %op70
  %op35 = load i32, i32* %op34
  %op39 = sub i32 %op18, %op70
  %op40 = icmp slt i32 %op35, %op39
  br i1 %op40, label %label_11, label %label_12
label_10:                                                ; preds = %label_8
  %op41 = getelementptr [10 x i32], [10 x i32]* %op14, i32 0, i32 0
  %op42 = load i32, i32* %op41
  br label %label_ret
label_11:                                                ; preds = %label_9
  %op46 = load i32, i32* %op34
  br label %label_13
label_12:                                                ; preds = %label_9
  %op50 = sub i32 %op18, %op70
  br label %label_13
label_13:                                                ; preds = %label_11, %label_12
  %op71 = phi i32 [ %op50, %label_12 ], [ %op46, %label_11 ]
  br label %label_14
label_14:                                                ; preds = %label_13, %label_18
  %op72 = phi i32 [ %op71, %label_13 ], [ %op64, %label_18 ]
  %op52 = icmp sgt i32 %op72, -1
  br i1 %op52, label %label_15, label %label_16
label_15:                                                ; preds = %label_14
  %op55 = add i32 %op70, %op72
  %op56 = getelementptr [10 x i32], [10 x i32]* %op14, i32 0, i32 %op55
  %op57 = load i32, i32* %op56
  %op58 = icmp ne i32 %op57, 0
  br i1 %op58, label %label_17, label %label_18
label_16:                                                ; preds = %label_14
  %op60 = sub i32 %op70, 1
  br label %label_8
label_17:                                                ; preds = %label_15
  %op62 = getelementptr [10 x i32], [10 x i32]* %op14, i32 0, i32 %op70
  store i32 1, i32* %op62
  br label %label_18
label_18:                                                ; preds = %label_15, %label_17
  %op64 = sub i32 %op72, 1
  br label %label_14
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
  %op15 = call i32 @canJump(i32* %op3, i32 10)
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op15
}
