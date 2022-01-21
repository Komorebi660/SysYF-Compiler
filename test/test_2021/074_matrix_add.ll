@M = global i32 zeroinitializer
@L = global i32 zeroinitializer
@N = global i32 zeroinitializer
declare void @put_int(i32)

declare void @put_char(i32)

define i32 @add(i32* %arg0, i32* %arg1, i32* %arg2, i32* %arg3, i32* %arg4, i32* %arg5, i32* %arg6, i32* %arg7, i32* %arg8) {
label_entry:
  br label %label_1
label_ret:                                                ; preds = %label_1
  ret i32 0
label_1:                                                ; preds = %label_entry, %label_2
  %op62 = phi i32 [ 0, %label_entry ], [ %op61, %label_2 ]
  %op22 = load i32, i32* @M
  %op23 = icmp slt i32 %op62, %op22
  br i1 %op23, label %label_2, label %label_ret
label_2:                                                ; preds = %label_1
  %op26 = getelementptr i32, i32* %arg0, i32 %op62
  %op27 = load i32, i32* %op26
  %op30 = getelementptr i32, i32* %arg3, i32 %op62
  %op31 = load i32, i32* %op30
  %op32 = add i32 %op27, %op31
  %op35 = getelementptr i32, i32* %arg6, i32 %op62
  store i32 %op32, i32* %op35
  %op38 = getelementptr i32, i32* %arg1, i32 %op62
  %op39 = load i32, i32* %op38
  %op42 = getelementptr i32, i32* %arg4, i32 %op62
  %op43 = load i32, i32* %op42
  %op44 = add i32 %op39, %op43
  %op47 = getelementptr i32, i32* %arg7, i32 %op62
  store i32 %op44, i32* %op47
  %op50 = getelementptr i32, i32* %arg2, i32 %op62
  %op51 = load i32, i32* %op50
  %op54 = getelementptr i32, i32* %arg5, i32 %op62
  %op55 = load i32, i32* %op54
  %op56 = add i32 %op51, %op55
  %op59 = getelementptr i32, i32* %arg8, i32 %op62
  store i32 %op56, i32* %op59
  %op61 = add i32 %op62, 1
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
  %op76 = phi i32 [ 0, %label_entry ], [ %op34, %label_5 ]
  %op13 = load i32, i32* @M
  %op14 = icmp slt i32 %op76, %op13
  br i1 %op14, label %label_5, label %label_6
label_5:                                                ; preds = %label_4
  %op17 = getelementptr [3 x i32], [3 x i32]* %op1, i32 0, i32 %op76
  store i32 %op76, i32* %op17
  %op20 = getelementptr [3 x i32], [3 x i32]* %op2, i32 0, i32 %op76
  store i32 %op76, i32* %op20
  %op23 = getelementptr [3 x i32], [3 x i32]* %op3, i32 0, i32 %op76
  store i32 %op76, i32* %op23
  %op26 = getelementptr [3 x i32], [3 x i32]* %op4, i32 0, i32 %op76
  store i32 %op76, i32* %op26
  %op29 = getelementptr [3 x i32], [3 x i32]* %op5, i32 0, i32 %op76
  store i32 %op76, i32* %op29
  %op32 = getelementptr [3 x i32], [3 x i32]* %op6, i32 0, i32 %op76
  store i32 %op76, i32* %op32
  %op34 = add i32 %op76, 1
  br label %label_4
label_6:                                                ; preds = %label_4
  %op35 = getelementptr [3 x i32], [3 x i32]* %op1, i32 0, i32 0
  %op36 = getelementptr [3 x i32], [3 x i32]* %op2, i32 0, i32 0
  %op37 = getelementptr [3 x i32], [3 x i32]* %op3, i32 0, i32 0
  %op38 = getelementptr [3 x i32], [3 x i32]* %op4, i32 0, i32 0
  %op39 = getelementptr [3 x i32], [3 x i32]* %op5, i32 0, i32 0
  %op40 = getelementptr [3 x i32], [3 x i32]* %op6, i32 0, i32 0
  %op41 = getelementptr [6 x i32], [6 x i32]* %op7, i32 0, i32 0
  %op42 = getelementptr [3 x i32], [3 x i32]* %op8, i32 0, i32 0
  %op43 = getelementptr [3 x i32], [3 x i32]* %op9, i32 0, i32 0
  %op44 = call i32 @add(i32* %op35, i32* %op36, i32* %op37, i32* %op38, i32* %op39, i32* %op40, i32* %op41, i32* %op42, i32* %op43)
  br label %label_7
label_7:                                                ; preds = %label_6, %label_8
  %op77 = phi i32 [ %op44, %label_6 ], [ %op54, %label_8 ]
  %op47 = load i32, i32* @N
  %op48 = icmp slt i32 %op77, %op47
  br i1 %op48, label %label_8, label %label_9
label_8:                                                ; preds = %label_7
  %op50 = getelementptr [6 x i32], [6 x i32]* %op7, i32 0, i32 %op77
  %op51 = load i32, i32* %op50
  call void @put_int(i32 %op51)
  %op54 = add i32 %op77, 1
  br label %label_7
label_9:                                                ; preds = %label_7
  call void @put_char(i32 10)
  br label %label_10
label_10:                                                ; preds = %label_9, %label_11
  %op78 = phi i32 [ 0, %label_9 ], [ %op64, %label_11 ]
  %op57 = load i32, i32* @N
  %op58 = icmp slt i32 %op78, %op57
  br i1 %op58, label %label_11, label %label_12
label_11:                                                ; preds = %label_10
  %op60 = getelementptr [3 x i32], [3 x i32]* %op8, i32 0, i32 %op78
  %op61 = load i32, i32* %op60
  call void @put_int(i32 %op61)
  %op64 = add i32 %op78, 1
  br label %label_10
label_12:                                                ; preds = %label_10
  call void @put_char(i32 10)
  br label %label_13
label_13:                                                ; preds = %label_12, %label_14
  %op79 = phi i32 [ 0, %label_12 ], [ %op74, %label_14 ]
  %op67 = load i32, i32* @N
  %op68 = icmp slt i32 %op79, %op67
  br i1 %op68, label %label_14, label %label_15
label_14:                                                ; preds = %label_13
  %op70 = getelementptr [3 x i32], [3 x i32]* %op9, i32 0, i32 %op79
  %op71 = load i32, i32* %op70
  call void @put_int(i32 %op71)
  %op74 = add i32 %op79, 1
  br label %label_13
label_15:                                                ; preds = %label_13
  call void @put_char(i32 10)
  br label %label_ret
}
