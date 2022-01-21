define i32 @climbStairs(i32 %arg0) {
label_entry:
  %op4 = icmp slt i32 %arg0, 4
  br i1 %op4, label %label_1, label %label_2
label_ret:                                                ; preds = %label_1, %label_5
  %op33 = phi i32 [ %op31, %label_5 ], [ %arg0, %label_1 ]
  ret i32 %op33
label_1:                                                ; preds = %label_entry
  br label %label_ret
label_2:                                                ; preds = %label_entry
  %op7 = alloca [10 x i32]
  %op8 = getelementptr [10 x i32], [10 x i32]* %op7, i32 0, i32 0
  store i32 0, i32* %op8
  %op9 = getelementptr [10 x i32], [10 x i32]* %op7, i32 0, i32 1
  store i32 1, i32* %op9
  %op10 = getelementptr [10 x i32], [10 x i32]* %op7, i32 0, i32 2
  store i32 2, i32* %op10
  br label %label_3
label_3:                                                ; preds = %label_2, %label_4
  %op34 = phi i32 [ 3, %label_2 ], [ %op28, %label_4 ]
  %op14 = add i32 %arg0, 1
  %op15 = icmp slt i32 %op34, %op14
  br i1 %op15, label %label_4, label %label_5
label_4:                                                ; preds = %label_3
  %op17 = sub i32 %op34, 1
  %op18 = getelementptr [10 x i32], [10 x i32]* %op7, i32 0, i32 %op17
  %op19 = load i32, i32* %op18
  %op21 = sub i32 %op34, 2
  %op22 = getelementptr [10 x i32], [10 x i32]* %op7, i32 0, i32 %op21
  %op23 = load i32, i32* %op22
  %op24 = add i32 %op19, %op23
  %op26 = getelementptr [10 x i32], [10 x i32]* %op7, i32 0, i32 %op34
  store i32 %op24, i32* %op26
  %op28 = add i32 %op34, 1
  br label %label_3
label_5:                                                ; preds = %label_3
  %op30 = getelementptr [10 x i32], [10 x i32]* %op7, i32 0, i32 %arg0
  %op31 = load i32, i32* %op30
  br label %label_ret
}
define i32 @main() {
label_entry:
  %op4 = call i32 @climbStairs(i32 5)
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op4
}
