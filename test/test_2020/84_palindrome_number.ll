declare void @put_int(i32)

declare void @put_char(i32)

define i32 @palindrome(i32 %arg0) {
label_entry:
  %op3 = alloca [4 x i32]
  br label %label_1
label_ret:                                                ; preds = %label_6
  ret i32 %op30
label_1:                                                ; preds = %label_entry, %label_2
  %op28 = phi i32 [ 0, %label_entry ], [ %op16, %label_2 ]
  %op29 = phi i32 [ %arg0, %label_entry ], [ %op14, %label_2 ]
  %op8 = icmp slt i32 %op28, 4
  br i1 %op8, label %label_2, label %label_3
label_2:                                                ; preds = %label_1
  %op10 = srem i32 %op29, 10
  %op12 = getelementptr [4 x i32], [4 x i32]* %op3, i32 0, i32 %op28
  store i32 %op10, i32* %op12
  %op14 = sdiv i32 %op29, 10
  %op16 = add i32 %op28, 1
  br label %label_1
label_3:                                                ; preds = %label_1
  %op17 = getelementptr [4 x i32], [4 x i32]* %op3, i32 0, i32 0
  %op18 = load i32, i32* %op17
  %op19 = getelementptr [4 x i32], [4 x i32]* %op3, i32 0, i32 3
  %op20 = load i32, i32* %op19
  %op21 = icmp eq i32 %op18, %op20
  br i1 %op21, label %label_7, label %label_5
label_4:                                                ; preds = %label_7
  br label %label_6
label_5:                                                ; preds = %label_3, %label_7
  br label %label_6
label_6:                                                ; preds = %label_4, %label_5
  %op30 = phi i32 [ 0, %label_5 ], [ 1, %label_4 ]
  br label %label_ret
label_7:                                                ; preds = %label_3
  %op23 = getelementptr [4 x i32], [4 x i32]* %op3, i32 0, i32 1
  %op24 = load i32, i32* %op23
  %op25 = getelementptr [4 x i32], [4 x i32]* %op3, i32 0, i32 2
  %op26 = load i32, i32* %op25
  %op27 = icmp eq i32 %op24, %op26
  br i1 %op27, label %label_4, label %label_5
}
define i32 @main() {
label_entry:
  %op4 = call i32 @palindrome(i32 1221)
  %op6 = icmp eq i32 %op4, 1
  br i1 %op6, label %label_8, label %label_9
label_ret:                                                ; preds = %label_10
  ret i32 0
label_8:                                                ; preds = %label_entry
  call void @put_int(i32 1221)
  br label %label_10
label_9:                                                ; preds = %label_entry
  call void @put_int(i32 0)
  br label %label_10
label_10:                                                ; preds = %label_8, %label_9
  call void @put_char(i32 10)
  br label %label_ret
}
