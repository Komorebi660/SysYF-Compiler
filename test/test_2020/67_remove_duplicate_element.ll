define i32 @removeElement(i32* %arg0, i32 %arg1, i32 %arg2) {
label_entry:
  br label %label_1
label_ret:                                                ; preds = %label_1
  ret i32 %op31
label_1:                                                ; preds = %label_entry, %label_6
  %op31 = phi i32 [ %arg1, %label_entry ], [ %op33, %label_6 ]
  %op32 = phi i32 [ 0, %label_entry ], [ %op34, %label_6 ]
  %op11 = icmp slt i32 %op32, %op31
  br i1 %op11, label %label_2, label %label_ret
label_2:                                                ; preds = %label_1
  %op14 = getelementptr i32, i32* %arg0, i32 %op32
  %op15 = load i32, i32* %op14
  %op17 = icmp eq i32 %op15, %arg2
  br i1 %op17, label %label_4, label %label_5
label_4:                                                ; preds = %label_2
  %op20 = sub i32 %op31, 1
  %op22 = getelementptr i32, i32* %arg0, i32 %op20
  %op23 = load i32, i32* %op22
  store i32 %op23, i32* %op14
  br label %label_6
label_5:                                                ; preds = %label_2
  %op30 = add i32 %op32, 1
  br label %label_6
label_6:                                                ; preds = %label_4, %label_5
  %op33 = phi i32 [ %op31, %label_5 ], [ %op20, %label_4 ]
  %op34 = phi i32 [ %op30, %label_5 ], [ %op32, %label_4 ]
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
  %op17 = call i32 @removeElement(i32* %op3, i32 10, i32 3)
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op17
}
