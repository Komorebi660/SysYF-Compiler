declare i32 @get_char()

declare void @put_int(i32)

define i32 @wc(i32* %arg0, i32 %arg1) {
label_entry:
  br label %label_1
label_ret:                                                ; preds = %label_1
  ret i32 %op24
label_1:                                                ; preds = %label_entry, %label_6
  %op24 = phi i32 [ 0, %label_entry ], [ %op27, %label_6 ]
  %op25 = phi i32 [ 0, %label_entry ], [ %op21, %label_6 ]
  %op26 = phi i32 [ 0, %label_entry ], [ %op28, %label_6 ]
  %op11 = icmp slt i32 %op25, %arg1
  br i1 %op11, label %label_2, label %label_ret
label_2:                                                ; preds = %label_1
  %op14 = getelementptr i32, i32* %arg0, i32 %op25
  %op15 = load i32, i32* %op14
  %op16 = icmp ne i32 %op15, 32
  br i1 %op16, label %label_4, label %label_5
label_4:                                                ; preds = %label_2
  %op19 = icmp eq i32 %op26, 0
  br i1 %op19, label %label_7, label %label_8
label_5:                                                ; preds = %label_2
  br label %label_6
label_6:                                                ; preds = %label_8, %label_5
  %op27 = phi i32 [ %op24, %label_5 ], [ %op29, %label_8 ]
  %op28 = phi i32 [ 0, %label_5 ], [ %op30, %label_8 ]
  %op21 = add i32 %op25, 1
  br label %label_1
label_7:                                                ; preds = %label_4
  %op23 = add i32 %op24, 1
  br label %label_8
label_8:                                                ; preds = %label_4, %label_7
  %op29 = phi i32 [ %op24, %label_4 ], [ %op23, %label_7 ]
  %op30 = phi i32 [ %op26, %label_4 ], [ 1, %label_7 ]
  br label %label_6
}
define i32 @main() {
label_entry:
  %op1 = alloca [500 x i32]
  br label %label_9
label_ret:                                                ; preds = %label_11
  ret i32 0
label_9:                                                ; preds = %label_entry, %label_10
  %op17 = phi i32 [ 0, %label_entry ], [ %op12, %label_10 ]
  %op18 = phi i32 [ 0, %label_entry ], [ %op7, %label_10 ]
  %op6 = icmp ne i32 %op18, 10
  br i1 %op6, label %label_10, label %label_11
label_10:                                                ; preds = %label_9
  %op7 = call i32 @get_char()
  %op10 = getelementptr [500 x i32], [500 x i32]* %op1, i32 0, i32 %op17
  store i32 %op7, i32* %op10
  %op12 = add i32 %op17, 1
  br label %label_9
label_11:                                                ; preds = %label_9
  %op13 = getelementptr [500 x i32], [500 x i32]* %op1, i32 0, i32 0
  %op15 = call i32 @wc(i32* %op13, i32 %op17)
  call void @put_int(i32 %op15)
  br label %label_ret
}
