define void @f1([5 x [6 x i32]]* %arg0) {
label_entry:
  %op3 = getelementptr [5 x [6 x i32]], [5 x [6 x i32]]* %arg0, i32 3
  %op4 = getelementptr [5 x [6 x i32]], [5 x [6 x i32]]* %op3, i32 0, i32 1
  %op5 = getelementptr [6 x i32], [6 x i32]* %op4, i32 0, i32 2
  store i32 7, i32* %op5
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret void
}
define void @f2([3 x [4 x [5 x [6 x i32]]]]* %arg0) {
label_entry:
  %op3 = getelementptr [3 x [4 x [5 x [6 x i32]]]], [3 x [4 x [5 x [6 x i32]]]]* %arg0, i32 0
  %op4 = getelementptr [3 x [4 x [5 x [6 x i32]]]], [3 x [4 x [5 x [6 x i32]]]]* %op3, i32 0, i32 1
  %op5 = getelementptr [4 x [5 x [6 x i32]]], [4 x [5 x [6 x i32]]]* %op4, i32 0, i32 3
  %op6 = getelementptr [5 x [6 x i32]], [5 x [6 x i32]]* %op5, i32 0, i32 1
  %op7 = getelementptr [6 x i32], [6 x i32]* %op6, i32 0, i32 2
  store i32 10, i32* %op7
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret void
}
define i32 @main() {
label_entry:
  %op1 = alloca [2 x [3 x [4 x [5 x [6 x i32]]]]]
  %op2 = getelementptr [2 x [3 x [4 x [5 x [6 x i32]]]]], [2 x [3 x [4 x [5 x [6 x i32]]]]]* %op1, i32 0, i32 1
  %op3 = getelementptr [3 x [4 x [5 x [6 x i32]]]], [3 x [4 x [5 x [6 x i32]]]]* %op2, i32 0, i32 2
  %op4 = getelementptr [4 x [5 x [6 x i32]]], [4 x [5 x [6 x i32]]]* %op3, i32 0, i32 0
  call void @f1([5 x [6 x i32]]* %op4)
  %op5 = getelementptr [2 x [3 x [4 x [5 x [6 x i32]]]]], [2 x [3 x [4 x [5 x [6 x i32]]]]]* %op1, i32 0, i32 0
  call void @f2([3 x [4 x [5 x [6 x i32]]]]* %op5)
  %op8 = getelementptr [4 x [5 x [6 x i32]]], [4 x [5 x [6 x i32]]]* %op3, i32 0, i32 3
  %op9 = getelementptr [5 x [6 x i32]], [5 x [6 x i32]]* %op8, i32 0, i32 1
  %op10 = getelementptr [6 x i32], [6 x i32]* %op9, i32 0, i32 2
  %op11 = load i32, i32* %op10
  %op13 = getelementptr [3 x [4 x [5 x [6 x i32]]]], [3 x [4 x [5 x [6 x i32]]]]* %op5, i32 0, i32 1
  %op14 = getelementptr [4 x [5 x [6 x i32]]], [4 x [5 x [6 x i32]]]* %op13, i32 0, i32 3
  %op15 = getelementptr [5 x [6 x i32]], [5 x [6 x i32]]* %op14, i32 0, i32 1
  %op16 = getelementptr [6 x i32], [6 x i32]* %op15, i32 0, i32 2
  %op17 = load i32, i32* %op16
  %op18 = add i32 %op11, %op17
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op18
}
