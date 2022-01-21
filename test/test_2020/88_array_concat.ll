declare void @put_int(i32)

declare void @put_char(i32)

define i32 @concat(i32* %arg0, i32* %arg1, i32* %arg2) {
label_entry:
  br label %label_1
label_ret:                                                ; preds = %label_4
  ret i32 0
label_1:                                                ; preds = %label_entry, %label_2
  %op34 = phi i32 [ 0, %label_entry ], [ %op19, %label_2 ]
  %op10 = icmp slt i32 %op34, 3
  br i1 %op10, label %label_2, label %label_3
label_2:                                                ; preds = %label_1
  %op13 = getelementptr i32, i32* %arg0, i32 %op34
  %op14 = load i32, i32* %op13
  %op17 = getelementptr i32, i32* %arg2, i32 %op34
  store i32 %op14, i32* %op17
  %op19 = add i32 %op34, 1
  br label %label_1
label_3:                                                ; preds = %label_1
  br label %label_4
label_4:                                                ; preds = %label_3, %label_5
  %op35 = phi i32 [ 0, %label_3 ], [ %op33, %label_5 ]
  %op36 = phi i32 [ %op34, %label_3 ], [ %op31, %label_5 ]
  %op22 = icmp slt i32 %op35, 3
  br i1 %op22, label %label_5, label %label_ret
label_5:                                                ; preds = %label_4
  %op25 = getelementptr i32, i32* %arg1, i32 %op35
  %op26 = load i32, i32* %op25
  %op29 = getelementptr i32, i32* %arg2, i32 %op36
  store i32 %op26, i32* %op29
  %op31 = add i32 %op36, 1
  %op33 = add i32 %op35, 1
  br label %label_4
}
define i32 @main() {
label_entry:
  %op1 = alloca [3 x i32]
  %op2 = alloca [3 x i32]
  %op3 = alloca [3 x i32]
  %op4 = alloca [3 x i32]
  %op5 = alloca [3 x i32]
  %op6 = alloca [3 x i32]
  %op7 = alloca [6 x i32]
  br label %label_7
label_ret:                                                ; preds = %label_12
  ret i32 0
label_7:                                                ; preds = %label_entry, %label_8
  %op48 = phi i32 [ 0, %label_entry ], [ %op33, %label_8 ]
  %op13 = icmp slt i32 %op48, 3
  br i1 %op13, label %label_8, label %label_9
label_8:                                                ; preds = %label_7
  %op16 = getelementptr [3 x i32], [3 x i32]* %op1, i32 0, i32 %op48
  store i32 %op48, i32* %op16
  %op19 = getelementptr [3 x i32], [3 x i32]* %op2, i32 0, i32 %op48
  store i32 %op48, i32* %op19
  %op22 = getelementptr [3 x i32], [3 x i32]* %op3, i32 0, i32 %op48
  store i32 %op48, i32* %op22
  %op25 = getelementptr [3 x i32], [3 x i32]* %op4, i32 0, i32 %op48
  store i32 %op48, i32* %op25
  %op28 = getelementptr [3 x i32], [3 x i32]* %op5, i32 0, i32 %op48
  store i32 %op48, i32* %op28
  %op31 = getelementptr [3 x i32], [3 x i32]* %op6, i32 0, i32 %op48
  store i32 %op48, i32* %op31
  %op33 = add i32 %op48, 1
  br label %label_7
label_9:                                                ; preds = %label_7
  %op34 = getelementptr [3 x i32], [3 x i32]* %op1, i32 0, i32 0
  %op35 = getelementptr [3 x i32], [3 x i32]* %op4, i32 0, i32 0
  %op36 = getelementptr [6 x i32], [6 x i32]* %op7, i32 0, i32 0
  %op37 = call i32 @concat(i32* %op34, i32* %op35, i32* %op36)
  br label %label_10
label_10:                                                ; preds = %label_9, %label_11
  %op49 = phi i32 [ %op37, %label_9 ], [ %op46, %label_11 ]
  %op40 = icmp slt i32 %op49, 6
  br i1 %op40, label %label_11, label %label_12
label_11:                                                ; preds = %label_10
  %op42 = getelementptr [6 x i32], [6 x i32]* %op7, i32 0, i32 %op49
  %op43 = load i32, i32* %op42
  call void @put_int(i32 %op43)
  %op46 = add i32 %op49, 1
  br label %label_10
label_12:                                                ; preds = %label_10
  call void @put_char(i32 10)
  br label %label_ret
}
