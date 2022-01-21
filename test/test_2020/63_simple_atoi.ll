declare i32 @get_char()

declare void @put_int(i32)

define i32 @atoi_(i32* %arg0) {
label_entry:
  br label %label_1
label_ret:                                                ; preds = %label_10, %label_15
  %op70 = phi i32 [ %op59, %label_15 ], [ 2147483647, %label_10 ]
  ret i32 %op70
label_1:                                                ; preds = %label_entry, %label_2
  %op74 = phi i32 [ 0, %label_entry ], [ %op13, %label_2 ]
  %op9 = getelementptr i32, i32* %arg0, i32 %op74
  %op10 = load i32, i32* %op9
  %op11 = icmp eq i32 %op10, 32
  br i1 %op11, label %label_2, label %label_3
label_2:                                                ; preds = %label_1
  %op13 = add i32 %op74, 1
  br label %label_1
label_3:                                                ; preds = %label_1
  %op17 = load i32, i32* %op9
  %op18 = icmp eq i32 %op17, 43
  br i1 %op18, label %label_4, label %label_7
label_4:                                                ; preds = %label_3, %label_7
  %op22 = load i32, i32* %op9
  %op23 = icmp eq i32 %op22, 45
  br i1 %op23, label %label_8, label %label_9
label_5:                                                ; preds = %label_7
  %op27 = load i32, i32* %op9
  %op28 = icmp slt i32 %op27, 48
  br i1 %op28, label %label_10, label %label_12
label_6:                                                ; preds = %label_9, %label_11
  %op75 = phi i32 [ %op74, %label_11 ], [ %op35, %label_9 ]
  %op76 = phi i32 [ 1, %label_11 ], [ %op77, %label_9 ]
  br label %label_13
label_7:                                                ; preds = %label_3
  %op32 = load i32, i32* %op9
  %op33 = icmp eq i32 %op32, 45
  br i1 %op33, label %label_4, label %label_5
label_8:                                                ; preds = %label_4
  br label %label_9
label_9:                                                ; preds = %label_4, %label_8
  %op77 = phi i32 [ 1, %label_4 ], [ -1, %label_8 ]
  %op35 = add i32 %op74, 1
  br label %label_6
label_10:                                                ; preds = %label_5, %label_12
  br label %label_ret
label_11:                                                ; preds = %label_12
  br label %label_6
label_12:                                                ; preds = %label_5
  %op40 = load i32, i32* %op9
  %op41 = icmp sgt i32 %op40, 57
  br i1 %op41, label %label_10, label %label_11
label_13:                                                ; preds = %label_6, %label_14
  %op78 = phi i32 [ %op75, %label_6 ], [ %op56, %label_14 ]
  %op79 = phi i32 [ 0, %label_6 ], [ %op54, %label_14 ]
  %op44 = getelementptr i32, i32* %arg0, i32 %op78
  %op45 = load i32, i32* %op44
  %op46 = icmp ne i32 %op45, 0
  br i1 %op46, label %label_17, label %label_15
label_14:                                                ; preds = %label_16
  %op48 = mul i32 %op79, 10
  %op52 = load i32, i32* %op44
  %op53 = add i32 %op48, %op52
  %op54 = sub i32 %op53, 48
  %op56 = add i32 %op78, 1
  br label %label_13
label_15:                                                ; preds = %label_13, %label_17, %label_16
  %op59 = mul i32 %op79, %op76
  br label %label_ret
label_16:                                                ; preds = %label_17
  %op63 = load i32, i32* %op44
  %op64 = icmp slt i32 %op63, 58
  br i1 %op64, label %label_14, label %label_15
label_17:                                                ; preds = %label_13
  %op68 = load i32, i32* %op44
  %op69 = icmp sgt i32 %op68, 47
  br i1 %op69, label %label_16, label %label_15
}
define i32 @main() {
label_entry:
  %op1 = alloca [500 x i32]
  br label %label_18
label_ret:                                                ; preds = %label_20
  ret i32 0
label_18:                                                ; preds = %label_entry, %label_19
  %op18 = phi i32 [ 0, %label_entry ], [ %op12, %label_19 ]
  %op19 = phi i32 [ 0, %label_entry ], [ %op7, %label_19 ]
  %op6 = icmp ne i32 %op19, 10
  br i1 %op6, label %label_19, label %label_20
label_19:                                                ; preds = %label_18
  %op7 = call i32 @get_char()
  %op10 = getelementptr [500 x i32], [500 x i32]* %op1, i32 0, i32 %op18
  store i32 %op7, i32* %op10
  %op12 = add i32 %op18, 1
  br label %label_18
label_20:                                                ; preds = %label_18
  %op14 = getelementptr [500 x i32], [500 x i32]* %op1, i32 0, i32 %op18
  store i32 0, i32* %op14
  %op15 = getelementptr [500 x i32], [500 x i32]* %op1, i32 0, i32 0
  %op16 = call i32 @atoi_(i32* %op15)
  call void @put_int(i32 %op16)
  br label %label_ret
}
