define i32 @lengthOfLastWord(i32* %arg0, i32 %arg1) {
label_entry:
  %op6 = icmp eq i32 %arg1, 0
  br i1 %op6, label %label_1, label %label_2
label_ret:                                                ; preds = %label_1, %label_7, %label_12, %label_11
  %op47 = phi i32 [ %op33, %label_11 ], [ %op42, %label_12 ], [ 0, %label_7 ], [ 0, %label_1 ]
  ret i32 %op47
label_1:                                                ; preds = %label_entry
  br label %label_ret
label_2:                                                ; preds = %label_entry
  %op10 = sub i32 %arg1, 1
  br label %label_3
label_3:                                                ; preds = %label_2, %label_4
  %op48 = phi i32 [ %op10, %label_2 ], [ %op14, %label_4 ]
  %op12 = icmp sgt i32 %op48, -1
  br i1 %op12, label %label_6, label %label_5
label_4:                                                ; preds = %label_6
  %op14 = sub i32 %op48, 1
  br label %label_3
label_5:                                                ; preds = %label_3, %label_6
  %op16 = icmp eq i32 %op48, -1
  br i1 %op16, label %label_7, label %label_8
label_6:                                                ; preds = %label_3
  %op19 = getelementptr i32, i32* %arg0, i32 %op48
  %op20 = load i32, i32* %op19
  %op21 = icmp eq i32 %op20, 0
  br i1 %op21, label %label_4, label %label_5
label_7:                                                ; preds = %label_5
  br label %label_ret
label_8:                                                ; preds = %label_5
  br label %label_9
label_9:                                                ; preds = %label_8, %label_13
  %op49 = phi i32 [ %op48, %label_8 ], [ %op44, %label_13 ]
  %op25 = icmp sgt i32 %op49, -1
  br i1 %op25, label %label_10, label %label_11
label_10:                                                ; preds = %label_9
  %op28 = getelementptr i32, i32* %arg0, i32 %op49
  %op29 = load i32, i32* %op28
  %op30 = icmp eq i32 %op29, 0
  br i1 %op30, label %label_12, label %label_13
label_11:                                                ; preds = %label_9
  %op33 = sub i32 %op48, %op49
  br label %label_ret
label_12:                                                ; preds = %label_10
  %op36 = sub i32 %arg1, %op49
  %op37 = sub i32 %op36, 1
  %op41 = sub i32 %op10, %op48
  %op42 = sub i32 %op37, %op41
  br label %label_ret
label_13:                                                ; preds = %label_10
  %op44 = sub i32 %op49, 1
  br label %label_9
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
  %op15 = call i32 @lengthOfLastWord(i32* %op3, i32 10)
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op15
}
