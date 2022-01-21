declare i32 @get_char()

declare void @put_int(i32)

declare void @put_char(i32)

define void @get_next(i32* %arg0, i32* %arg1) {
label_entry:
  %op5 = getelementptr i32, i32* %arg1, i32 0
  store i32 -1, i32* %op5
  br label %label_1
label_ret:                                                ; preds = %label_1
  ret void
label_1:                                                ; preds = %label_entry, %label_6
  %op36 = phi i32 [ -1, %label_entry ], [ %op38, %label_6 ]
  %op37 = phi i32 [ 0, %label_entry ], [ %op39, %label_6 ]
  %op10 = getelementptr i32, i32* %arg0, i32 %op37
  %op11 = load i32, i32* %op10
  %op12 = icmp ne i32 %op11, 0
  br i1 %op12, label %label_2, label %label_ret
label_2:                                                ; preds = %label_1
  %op14 = icmp eq i32 %op36, -1
  br i1 %op14, label %label_4, label %label_7
label_4:                                                ; preds = %label_2, %label_7
  %op16 = add i32 %op36, 1
  %op18 = add i32 %op37, 1
  %op22 = getelementptr i32, i32* %arg1, i32 %op18
  store i32 %op16, i32* %op22
  br label %label_6
label_5:                                                ; preds = %label_7
  %op25 = getelementptr i32, i32* %arg1, i32 %op36
  %op26 = load i32, i32* %op25
  br label %label_6
label_6:                                                ; preds = %label_4, %label_5
  %op38 = phi i32 [ %op26, %label_5 ], [ %op16, %label_4 ]
  %op39 = phi i32 [ %op37, %label_5 ], [ %op18, %label_4 ]
  br label %label_1
label_7:                                                ; preds = %label_2
  %op30 = load i32, i32* %op10
  %op33 = getelementptr i32, i32* %arg0, i32 %op36
  %op34 = load i32, i32* %op33
  %op35 = icmp eq i32 %op30, %op34
  br i1 %op35, label %label_4, label %label_5
}
define i32 @KMP(i32* %arg0, i32* %arg1) {
label_entry:
  %op5 = alloca [4096 x i32]
  %op7 = getelementptr [4096 x i32], [4096 x i32]* %op5, i32 0, i32 0
  call void @get_next(i32* %arg0, i32* %op7)
  br label %label_8
label_ret:                                                ; preds = %label_14, %label_10
  %op46 = phi i32 [ -1, %label_10 ], [ %op28, %label_14 ]
  ret i32 %op46
label_8:                                                ; preds = %label_entry, %label_13
  %op47 = phi i32 [ 0, %label_entry ], [ %op49, %label_13 ]
  %op48 = phi i32 [ 0, %label_entry ], [ %op50, %label_13 ]
  %op13 = getelementptr i32, i32* %arg1, i32 %op47
  %op14 = load i32, i32* %op13
  %op15 = icmp ne i32 %op14, 0
  br i1 %op15, label %label_9, label %label_10
label_9:                                                ; preds = %label_8
  %op18 = getelementptr i32, i32* %arg0, i32 %op48
  %op19 = load i32, i32* %op18
  %op23 = load i32, i32* %op13
  %op24 = icmp eq i32 %op19, %op23
  br i1 %op24, label %label_11, label %label_12
label_10:                                                ; preds = %label_8
  br label %label_ret
label_11:                                                ; preds = %label_9
  %op26 = add i32 %op48, 1
  %op28 = add i32 %op47, 1
  %op31 = getelementptr i32, i32* %arg0, i32 %op26
  %op32 = load i32, i32* %op31
  %op33 = icmp eq i32 %op32, 0
  br i1 %op33, label %label_14, label %label_15
label_12:                                                ; preds = %label_9
  %op35 = getelementptr [4096 x i32], [4096 x i32]* %op5, i32 0, i32 %op48
  %op36 = load i32, i32* %op35
  %op38 = icmp eq i32 %op36, -1
  br i1 %op38, label %label_16, label %label_17
label_13:                                                ; preds = %label_15, %label_17
  %op49 = phi i32 [ %op51, %label_17 ], [ %op28, %label_15 ]
  %op50 = phi i32 [ %op52, %label_17 ], [ %op26, %label_15 ]
  br label %label_8
label_14:                                                ; preds = %label_11
  br label %label_ret
label_15:                                                ; preds = %label_11
  br label %label_13
label_16:                                                ; preds = %label_12
  %op41 = add i32 %op36, 1
  %op43 = add i32 %op47, 1
  br label %label_17
label_17:                                                ; preds = %label_12, %label_16
  %op51 = phi i32 [ %op47, %label_12 ], [ %op43, %label_16 ]
  %op52 = phi i32 [ %op36, %label_12 ], [ %op41, %label_16 ]
  br label %label_13
}
define i32 @read_str(i32* %arg0) {
label_entry:
  br label %label_18
label_ret:                                                ; preds = %label_20
  ret i32 %op21
label_18:                                                ; preds = %label_entry, %label_22
  %op21 = phi i32 [ 0, %label_entry ], [ %op20, %label_22 ]
  br label %label_19
label_19:                                                ; preds = %label_18
  %op6 = call i32 @get_char()
  %op9 = getelementptr i32, i32* %arg0, i32 %op21
  store i32 %op6, i32* %op9
  %op13 = load i32, i32* %op9
  %op14 = icmp eq i32 %op13, 10
  br i1 %op14, label %label_20, label %label_22
label_20:                                                ; preds = %label_19
  store i32 0, i32* %op9
  br label %label_ret
label_22:                                                ; preds = %label_19
  %op20 = add i32 %op21, 1
  br label %label_18
}
define i32 @main() {
label_entry:
  %op1 = alloca [4096 x i32]
  %op2 = alloca [4096 x i32]
  %op3 = getelementptr [4096 x i32], [4096 x i32]* %op1, i32 0, i32 0
  %op4 = call i32 @read_str(i32* %op3)
  %op5 = getelementptr [4096 x i32], [4096 x i32]* %op2, i32 0, i32 0
  %op6 = call i32 @read_str(i32* %op5)
  %op9 = call i32 @KMP(i32* %op3, i32* %op5)
  call void @put_int(i32 %op9)
  call void @put_char(i32 10)
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 0
}
