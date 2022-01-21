define i32 @main() {
label_entry:
  %op1 = alloca [5 x [5 x i32]]
  %op2 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %op1, i32 0, i32 0, i32 0
  store i32 0, i32* %op2
  %op3 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %op1, i32 0, i32 0, i32 1
  store i32 0, i32* %op3
  %op4 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %op1, i32 0, i32 0, i32 2
  store i32 0, i32* %op4
  %op5 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %op1, i32 0, i32 0, i32 3
  store i32 0, i32* %op5
  %op6 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %op1, i32 0, i32 0, i32 4
  store i32 0, i32* %op6
  %op7 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %op1, i32 0, i32 1, i32 0
  store i32 0, i32* %op7
  %op8 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %op1, i32 0, i32 1, i32 1
  store i32 0, i32* %op8
  %op9 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %op1, i32 0, i32 1, i32 2
  store i32 0, i32* %op9
  %op10 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %op1, i32 0, i32 1, i32 3
  store i32 0, i32* %op10
  %op11 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %op1, i32 0, i32 1, i32 4
  store i32 0, i32* %op11
  %op12 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %op1, i32 0, i32 2, i32 0
  store i32 0, i32* %op12
  %op13 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %op1, i32 0, i32 2, i32 1
  store i32 0, i32* %op13
  %op14 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %op1, i32 0, i32 2, i32 2
  store i32 0, i32* %op14
  %op15 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %op1, i32 0, i32 2, i32 3
  store i32 0, i32* %op15
  %op16 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %op1, i32 0, i32 2, i32 4
  store i32 0, i32* %op16
  %op17 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %op1, i32 0, i32 3, i32 0
  store i32 0, i32* %op17
  %op18 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %op1, i32 0, i32 3, i32 1
  store i32 0, i32* %op18
  %op19 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %op1, i32 0, i32 3, i32 2
  store i32 0, i32* %op19
  %op20 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %op1, i32 0, i32 3, i32 3
  store i32 0, i32* %op20
  %op21 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %op1, i32 0, i32 3, i32 4
  store i32 0, i32* %op21
  %op22 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %op1, i32 0, i32 4, i32 0
  store i32 0, i32* %op22
  %op23 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %op1, i32 0, i32 4, i32 1
  store i32 0, i32* %op23
  %op24 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %op1, i32 0, i32 4, i32 2
  store i32 0, i32* %op24
  %op25 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %op1, i32 0, i32 4, i32 3
  store i32 0, i32* %op25
  %op26 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %op1, i32 0, i32 4, i32 4
  store i32 0, i32* %op26
  store i32 1, i32* %op2
  store i32 1, i32* %op3
  store i32 1, i32* %op4
  store i32 1, i32* %op5
  store i32 1, i32* %op6
  store i32 2, i32* %op7
  store i32 2, i32* %op8
  store i32 2, i32* %op9
  store i32 2, i32* %op10
  store i32 2, i32* %op11
  store i32 3, i32* %op12
  store i32 3, i32* %op13
  store i32 3, i32* %op14
  store i32 3, i32* %op15
  store i32 3, i32* %op16
  store i32 4, i32* %op17
  store i32 4, i32* %op18
  store i32 4, i32* %op19
  store i32 4, i32* %op20
  store i32 4, i32* %op21
  store i32 5, i32* %op22
  store i32 5, i32* %op23
  store i32 5, i32* %op24
  store i32 5, i32* %op25
  store i32 5, i32* %op26
  br label %label_1
label_ret:                                                ; preds = %label_3
  ret i32 %op86
label_1:                                                ; preds = %label_entry, %label_2
  %op87 = phi i32 [ 0, %label_entry ], [ %op83, %label_2 ]
  %op58 = icmp slt i32 %op87, 5
  br i1 %op58, label %label_2, label %label_3
label_2:                                                ; preds = %label_1
  %op61 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %op1, i32 0, i32 1
  %op63 = getelementptr [5 x i32], [5 x i32]* %op61, i32 0, i32 %op87
  %op64 = load i32, i32* %op63
  %op67 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %op1, i32 0, i32 2
  %op69 = getelementptr [5 x i32], [5 x i32]* %op67, i32 0, i32 %op87
  %op70 = load i32, i32* %op69
  store i32 %op70, i32* %op63
  store i32 %op64, i32* %op69
  %op83 = add i32 %op87, 1
  br label %label_1
label_3:                                                ; preds = %label_1
  %op84 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %op1, i32 0, i32 2
  %op85 = getelementptr [5 x i32], [5 x i32]* %op84, i32 0, i32 0
  %op86 = load i32, i32* %op85
  br label %label_ret
}
