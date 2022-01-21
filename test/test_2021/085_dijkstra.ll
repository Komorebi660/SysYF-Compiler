@INF = constant i32 65535
@e = global [16 x [16 x i32]] zeroinitializer
@book = global [16 x i32] zeroinitializer
@dis = global [16 x i32] zeroinitializer
@n = global i32 zeroinitializer
@m = global i32 zeroinitializer
@v1 = global i32 zeroinitializer
@v2 = global i32 zeroinitializer
@w = global i32 zeroinitializer
declare i32 @get_int()

declare void @put_int(i32)

declare void @put_char(i32)

define void @Dijkstra() {
label_entry:
  br label %label_1
label_ret:                                                ; preds = %label_4
  ret void
label_1:                                                ; preds = %label_entry, %label_2
  %op83 = phi i32 [ 1, %label_entry ], [ %op14, %label_2 ]
  %op3 = load i32, i32* @n
  %op4 = icmp sle i32 %op83, %op3
  br i1 %op4, label %label_2, label %label_3
label_2:                                                ; preds = %label_1
  %op5 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* @e, i32 0, i32 1
  %op7 = getelementptr [16 x i32], [16 x i32]* %op5, i32 0, i32 %op83
  %op8 = load i32, i32* %op7
  %op10 = getelementptr [16 x i32], [16 x i32]* @dis, i32 0, i32 %op83
  store i32 %op8, i32* %op10
  %op12 = getelementptr [16 x i32], [16 x i32]* @book, i32 0, i32 %op83
  store i32 0, i32* %op12
  %op14 = add i32 %op83, 1
  br label %label_1
label_3:                                                ; preds = %label_1
  %op15 = getelementptr [16 x i32], [16 x i32]* @book, i32 0, i32 1
  store i32 1, i32* %op15
  br label %label_4
label_4:                                                ; preds = %label_3, %label_15
  %op88 = phi i32 [ 1, %label_3 ], [ %op56, %label_15 ]
  %op17 = load i32, i32* @n
  %op18 = sub i32 %op17, 1
  %op19 = icmp sle i32 %op88, %op18
  br i1 %op19, label %label_5, label %label_ret
label_5:                                                ; preds = %label_4
  %op21 = load i32, i32* @INF
  br label %label_7
label_7:                                                ; preds = %label_5, %label_11
  %op89 = phi i32 [ 1, %label_5 ], [ %op40, %label_11 ]
  %op90 = phi i32 [ 0, %label_5 ], [ %op92, %label_11 ]
  %op91 = phi i32 [ %op21, %label_5 ], [ %op93, %label_11 ]
  %op25 = load i32, i32* @n
  %op26 = icmp sle i32 %op89, %op25
  br i1 %op26, label %label_8, label %label_9
label_8:                                                ; preds = %label_7
  %op29 = getelementptr [16 x i32], [16 x i32]* @dis, i32 0, i32 %op89
  %op30 = load i32, i32* %op29
  %op31 = icmp sgt i32 %op91, %op30
  br i1 %op31, label %label_12, label %label_11
label_9:                                                ; preds = %label_7
  %op33 = getelementptr [16 x i32], [16 x i32]* @book, i32 0, i32 %op90
  store i32 1, i32* %op33
  br label %label_13
label_10:                                                ; preds = %label_12
  %op37 = load i32, i32* %op29
  br label %label_11
label_11:                                                ; preds = %label_8, %label_12, %label_10
  %op92 = phi i32 [ %op90, %label_8 ], [ %op90, %label_12 ], [ %op89, %label_10 ]
  %op93 = phi i32 [ %op91, %label_8 ], [ %op91, %label_12 ], [ %op37, %label_10 ]
  %op40 = add i32 %op89, 1
  br label %label_7
label_12:                                                ; preds = %label_8
  %op42 = getelementptr [16 x i32], [16 x i32]* @book, i32 0, i32 %op89
  %op43 = load i32, i32* %op42
  %op44 = icmp eq i32 %op43, 0
  br i1 %op44, label %label_10, label %label_11
label_13:                                                ; preds = %label_9, %label_17
  %op94 = phi i32 [ 1, %label_9 ], [ %op71, %label_17 ]
  %op46 = load i32, i32* @n
  %op47 = icmp sle i32 %op94, %op46
  br i1 %op47, label %label_14, label %label_15
label_14:                                                ; preds = %label_13
  %op49 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* @e, i32 0, i32 %op90
  %op51 = getelementptr [16 x i32], [16 x i32]* %op49, i32 0, i32 %op94
  %op52 = load i32, i32* %op51
  %op53 = load i32, i32* @INF
  %op54 = icmp slt i32 %op52, %op53
  br i1 %op54, label %label_16, label %label_17
label_15:                                                ; preds = %label_13
  %op56 = add i32 %op88, 1
  br label %label_4
label_16:                                                ; preds = %label_14
  %op58 = getelementptr [16 x i32], [16 x i32]* @dis, i32 0, i32 %op94
  %op59 = load i32, i32* %op58
  %op61 = getelementptr [16 x i32], [16 x i32]* @dis, i32 0, i32 %op90
  %op62 = load i32, i32* %op61
  %op67 = load i32, i32* %op51
  %op68 = add i32 %op62, %op67
  %op69 = icmp sgt i32 %op59, %op68
  br i1 %op69, label %label_18, label %label_19
label_17:                                                ; preds = %label_14, %label_19
  %op71 = add i32 %op94, 1
  br label %label_13
label_18:                                                ; preds = %label_16
  %op74 = load i32, i32* %op61
  %op79 = load i32, i32* %op51
  %op80 = add i32 %op74, %op79
  store i32 %op80, i32* %op58
  br label %label_19
label_19:                                                ; preds = %label_16, %label_18
  br label %label_17
}
define i32 @main() {
label_entry:
  %op2 = call i32 @get_int()
  store i32 %op2, i32* @n
  %op3 = call i32 @get_int()
  store i32 %op3, i32* @m
  br label %label_20
label_ret:                                                ; preds = %label_34
  ret i32 0
label_20:                                                ; preds = %label_entry, %label_25
  %op51 = phi i32 [ 1, %label_entry ], [ %op16, %label_25 ]
  %op6 = load i32, i32* @n
  %op7 = icmp sle i32 %op51, %op6
  br i1 %op7, label %label_21, label %label_22
label_21:                                                ; preds = %label_20
  br label %label_23
label_22:                                                ; preds = %label_20
  br label %label_29
label_23:                                                ; preds = %label_21, %label_28
  %op52 = phi i32 [ 1, %label_21 ], [ %op27, %label_28 ]
  %op10 = load i32, i32* @n
  %op11 = icmp sle i32 %op52, %op10
  br i1 %op11, label %label_24, label %label_25
label_24:                                                ; preds = %label_23
  %op14 = icmp eq i32 %op51, %op52
  br i1 %op14, label %label_26, label %label_27
label_25:                                                ; preds = %label_23
  %op16 = add i32 %op51, 1
  br label %label_20
label_26:                                                ; preds = %label_24
  %op18 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* @e, i32 0, i32 %op51
  %op20 = getelementptr [16 x i32], [16 x i32]* %op18, i32 0, i32 %op52
  store i32 0, i32* %op20
  br label %label_28
label_27:                                                ; preds = %label_24
  %op21 = load i32, i32* @INF
  %op23 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* @e, i32 0, i32 %op51
  %op25 = getelementptr [16 x i32], [16 x i32]* %op23, i32 0, i32 %op52
  store i32 %op21, i32* %op25
  br label %label_28
label_28:                                                ; preds = %label_26, %label_27
  %op27 = add i32 %op52, 1
  br label %label_23
label_29:                                                ; preds = %label_22, %label_30
  %op53 = phi i32 [ 1, %label_22 ], [ %op41, %label_30 ]
  %op29 = load i32, i32* @m
  %op30 = icmp sle i32 %op53, %op29
  br i1 %op30, label %label_30, label %label_31
label_30:                                                ; preds = %label_29
  %op32 = call i32 @get_int()
  %op34 = call i32 @get_int()
  %op35 = call i32 @get_int()
  %op37 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* @e, i32 0, i32 %op32
  %op39 = getelementptr [16 x i32], [16 x i32]* %op37, i32 0, i32 %op34
  store i32 %op35, i32* %op39
  %op41 = add i32 %op53, 1
  br label %label_29
label_31:                                                ; preds = %label_29
  call void @Dijkstra()
  br label %label_32
label_32:                                                ; preds = %label_31, %label_33
  %op54 = phi i32 [ 1, %label_31 ], [ %op49, %label_33 ]
  %op43 = load i32, i32* @n
  %op44 = icmp sle i32 %op54, %op43
  br i1 %op44, label %label_33, label %label_34
label_33:                                                ; preds = %label_32
  %op46 = getelementptr [16 x i32], [16 x i32]* @dis, i32 0, i32 %op54
  %op47 = load i32, i32* %op46
  call void @put_int(i32 %op47)
  call void @put_char(i32 32)
  %op49 = add i32 %op54, 1
  br label %label_32
label_34:                                                ; preds = %label_32
  call void @put_char(i32 10)
  br label %label_ret
}
