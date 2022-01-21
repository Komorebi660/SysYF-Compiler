declare void @put_int(i32)

define i32 @_getMaxOfAll(i32* %arg0, i32 %arg1) {
label_entry:
  %op7 = sub i32 %arg1, 1
  br label %label_1
label_ret:                                                ; preds = %label_1
  ret i32 %op24
label_1:                                                ; preds = %label_entry, %label_5
  %op24 = phi i32 [ -999999, %label_entry ], [ %op26, %label_5 ]
  %op25 = phi i32 [ %op7, %label_entry ], [ %op23, %label_5 ]
  %op10 = icmp sgt i32 %op25, -1
  br i1 %op10, label %label_2, label %label_ret
label_2:                                                ; preds = %label_1
  %op13 = getelementptr i32, i32* %arg0, i32 %op25
  %op14 = load i32, i32* %op13
  %op16 = icmp sgt i32 %op14, %op24
  br i1 %op16, label %label_4, label %label_5
label_4:                                                ; preds = %label_2
  %op21 = load i32, i32* %op13
  br label %label_5
label_5:                                                ; preds = %label_2, %label_4
  %op26 = phi i32 [ %op24, %label_2 ], [ %op21, %label_4 ]
  %op23 = sub i32 %op25, 1
  br label %label_1
}
define i32 @main() {
label_entry:
  %op1 = alloca [3 x i32]
  %op2 = getelementptr [3 x i32], [3 x i32]* %op1, i32 0, i32 0
  store i32 -2, i32* %op2
  %op3 = getelementptr [3 x i32], [3 x i32]* %op1, i32 0, i32 1
  store i32 2, i32* %op3
  %op4 = getelementptr [3 x i32], [3 x i32]* %op1, i32 0, i32 2
  store i32 -7, i32* %op4
  %op7 = call i32 @_getMaxOfAll(i32* %op2, i32 3)
  %op8 = getelementptr [3 x i32], [3 x i32]* %op1, i32 0, i32 %op7
  %op9 = load i32, i32* %op8
  call void @put_int(i32 %op9)
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 0
}
