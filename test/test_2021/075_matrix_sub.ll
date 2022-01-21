@N = global i32 zeroinitializer
@M = global i32 zeroinitializer
@L = global i32 zeroinitializer
declare void @put_int(i32)

declare void @put_char(i32)

define i32 @sub(i32* %arg0, i32* %arg1, i32* %arg2, i32* %arg3, i32* %arg4, i32* %arg5, i32* %arg6, i32* %arg7, i32* %arg8) {
label_entry:
  br label %label_1
label_ret:                                                ; preds = %label_1
  ret i32 0
label_1:                                                ; preds = %label_entry, %label_2
  %op61 = phi i32 [ 0, %label_entry ], [ %op60, %label_2 ]
  %op22 = icmp slt i32 %op61, 3
  br i1 %op22, label %label_2, label %label_ret
label_2:                                                ; preds = %label_1
  %op25 = getelementptr i32, i32* %arg0, i32 %op61
  %op26 = load i32, i32* %op25
  %op29 = getelementptr i32, i32* %arg3, i32 %op61
  %op30 = load i32, i32* %op29
  %op31 = sub i32 %op26, %op30
  %op34 = getelementptr i32, i32* %arg6, i32 %op61
  store i32 %op31, i32* %op34
  %op37 = getelementptr i32, i32* %arg1, i32 %op61
  %op38 = load i32, i32* %op37
  %op41 = getelementptr i32, i32* %arg4, i32 %op61
  %op42 = load i32, i32* %op41
  %op43 = sub i32 %op38, %op42
  %op46 = getelementptr i32, i32* %arg7, i32 %op61
  store i32 %op43, i32* %op46
  %op49 = getelementptr i32, i32* %arg2, i32 %op61
  %op50 = load i32, i32* %op49
  %op53 = getelementptr i32, i32* %arg5, i32 %op61
  %op54 = load i32, i32* %op53
  %op55 = sub i32 %op50, %op54
  %op58 = getelementptr i32, i32* %arg8, i32 %op61
  store i32 %op55, i32* %op58
  %op60 = add i32 %op61, 1
  br label %label_1
}
define i32 @main() {
label_entry:
  store i32 3, i32* @N
  store i32 3, i32* @M
  store i32 3, i32* @L
  %op1 = alloca [3 x i32]
  %op2 = alloca [3 x i32]
  %op3 = alloca [3 x i32]
  %op4 = alloca [3 x i32]
  %op5 = alloca [3 x i32]
  %op6 = alloca [3 x i32]
  %op7 = alloca [6 x i32]
  %op8 = alloca [3 x i32]
  %op9 = alloca [3 x i32]
  br label %label_4
label_ret:                                                ; preds = %label_15
  ret i32 0
label_4:                                                ; preds = %label_entry, %label_5
  %op72 = phi i32 [ 0, %label_entry ], [ %op33, %label_5 ]
  %op13 = icmp slt i32 %op72, 3
  br i1 %op13, label %label_5, label %label_6
label_5:                                                ; preds = %label_4
  %op16 = getelementptr [3 x i32], [3 x i32]* %op1, i32 0, i32 %op72
  store i32 %op72, i32* %op16
  %op19 = getelementptr [3 x i32], [3 x i32]* %op2, i32 0, i32 %op72
  store i32 %op72, i32* %op19
  %op22 = getelementptr [3 x i32], [3 x i32]* %op3, i32 0, i32 %op72
  store i32 %op72, i32* %op22
  %op25 = getelementptr [3 x i32], [3 x i32]* %op4, i32 0, i32 %op72
  store i32 %op72, i32* %op25
  %op28 = getelementptr [3 x i32], [3 x i32]* %op5, i32 0, i32 %op72
  store i32 %op72, i32* %op28
  %op31 = getelementptr [3 x i32], [3 x i32]* %op6, i32 0, i32 %op72
  store i32 %op72, i32* %op31
  %op33 = add i32 %op72, 1
  br label %label_4
label_6:                                                ; preds = %label_4
  %op34 = getelementptr [3 x i32], [3 x i32]* %op1, i32 0, i32 0
  %op35 = getelementptr [3 x i32], [3 x i32]* %op2, i32 0, i32 0
  %op36 = getelementptr [3 x i32], [3 x i32]* %op3, i32 0, i32 0
  %op37 = getelementptr [3 x i32], [3 x i32]* %op4, i32 0, i32 0
  %op38 = getelementptr [3 x i32], [3 x i32]* %op5, i32 0, i32 0
  %op39 = getelementptr [3 x i32], [3 x i32]* %op6, i32 0, i32 0
  %op40 = getelementptr [6 x i32], [6 x i32]* %op7, i32 0, i32 0
  %op41 = getelementptr [3 x i32], [3 x i32]* %op8, i32 0, i32 0
  %op42 = getelementptr [3 x i32], [3 x i32]* %op9, i32 0, i32 0
  %op43 = call i32 @sub(i32* %op34, i32* %op35, i32* %op36, i32* %op37, i32* %op38, i32* %op39, i32* %op40, i32* %op41, i32* %op42)
  br label %label_7
label_7:                                                ; preds = %label_6, %label_8
  %op73 = phi i32 [ %op43, %label_6 ], [ %op52, %label_8 ]
  %op46 = icmp slt i32 %op73, 3
  br i1 %op46, label %label_8, label %label_9
label_8:                                                ; preds = %label_7
  %op48 = getelementptr [6 x i32], [6 x i32]* %op7, i32 0, i32 %op73
  %op49 = load i32, i32* %op48
  call void @put_int(i32 %op49)
  %op52 = add i32 %op73, 1
  br label %label_7
label_9:                                                ; preds = %label_7
  call void @put_char(i32 10)
  br label %label_10
label_10:                                                ; preds = %label_9, %label_11
  %op74 = phi i32 [ 0, %label_9 ], [ %op61, %label_11 ]
  %op55 = icmp slt i32 %op74, 3
  br i1 %op55, label %label_11, label %label_12
label_11:                                                ; preds = %label_10
  %op57 = getelementptr [3 x i32], [3 x i32]* %op8, i32 0, i32 %op74
  %op58 = load i32, i32* %op57
  call void @put_int(i32 %op58)
  %op61 = add i32 %op74, 1
  br label %label_10
label_12:                                                ; preds = %label_10
  call void @put_char(i32 10)
  br label %label_13
label_13:                                                ; preds = %label_12, %label_14
  %op75 = phi i32 [ 0, %label_12 ], [ %op70, %label_14 ]
  %op64 = icmp slt i32 %op75, 3
  br i1 %op64, label %label_14, label %label_15
label_14:                                                ; preds = %label_13
  %op66 = getelementptr [3 x i32], [3 x i32]* %op9, i32 0, i32 %op75
  %op67 = load i32, i32* %op66
  call void @put_int(i32 %op67)
  %op70 = add i32 %op75, 1
  br label %label_13
label_15:                                                ; preds = %label_13
  call void @put_char(i32 10)
  br label %label_ret
}
