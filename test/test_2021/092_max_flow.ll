@INF = constant i32 1879048192
@size = global [10 x i32] zeroinitializer
@to = global [10 x [10 x i32]] zeroinitializer
@cap = global [10 x [10 x i32]] zeroinitializer
@rev = global [10 x [10 x i32]] zeroinitializer
@used = global [10 x i32] zeroinitializer
declare i32 @get_int()

declare void @put_int(i32)

declare void @put_char(i32)

define void @my_memset(i32* %arg0, i32 %arg1, i32 %arg2) {
label_entry:
  br label %label_1
label_ret:                                                ; preds = %label_1
  ret void
label_1:                                                ; preds = %label_entry, %label_2
  %op16 = phi i32 [ 0, %label_entry ], [ %op15, %label_2 ]
  %op9 = icmp slt i32 %op16, %arg2
  br i1 %op9, label %label_2, label %label_ret
label_2:                                                ; preds = %label_1
  %op13 = getelementptr i32, i32* %arg0, i32 %op16
  store i32 %arg1, i32* %op13
  %op15 = add i32 %op16, 1
  br label %label_1
}
define void @add_node(i32 %arg0, i32 %arg1, i32 %arg2) {
label_entry:
  %op8 = getelementptr [10 x [10 x i32]], [10 x [10 x i32]]* @to, i32 0, i32 %arg0
  %op10 = getelementptr [10 x i32], [10 x i32]* @size, i32 0, i32 %arg0
  %op11 = load i32, i32* %op10
  %op12 = getelementptr [10 x i32], [10 x i32]* %op8, i32 0, i32 %op11
  store i32 %arg1, i32* %op12
  %op15 = getelementptr [10 x [10 x i32]], [10 x [10 x i32]]* @cap, i32 0, i32 %arg0
  %op18 = load i32, i32* %op10
  %op19 = getelementptr [10 x i32], [10 x i32]* %op15, i32 0, i32 %op18
  store i32 %arg2, i32* %op19
  %op21 = getelementptr [10 x i32], [10 x i32]* @size, i32 0, i32 %arg1
  %op22 = load i32, i32* %op21
  %op24 = getelementptr [10 x [10 x i32]], [10 x [10 x i32]]* @rev, i32 0, i32 %arg0
  %op27 = load i32, i32* %op10
  %op28 = getelementptr [10 x i32], [10 x i32]* %op24, i32 0, i32 %op27
  store i32 %op22, i32* %op28
  %op31 = getelementptr [10 x [10 x i32]], [10 x [10 x i32]]* @to, i32 0, i32 %arg1
  %op34 = load i32, i32* %op21
  %op35 = getelementptr [10 x i32], [10 x i32]* %op31, i32 0, i32 %op34
  store i32 %arg0, i32* %op35
  %op37 = getelementptr [10 x [10 x i32]], [10 x [10 x i32]]* @cap, i32 0, i32 %arg1
  %op40 = load i32, i32* %op21
  %op41 = getelementptr [10 x i32], [10 x i32]* %op37, i32 0, i32 %op40
  store i32 0, i32* %op41
  %op44 = load i32, i32* %op10
  %op46 = getelementptr [10 x [10 x i32]], [10 x [10 x i32]]* @rev, i32 0, i32 %arg1
  %op49 = load i32, i32* %op21
  %op50 = getelementptr [10 x i32], [10 x i32]* %op46, i32 0, i32 %op49
  store i32 %op44, i32* %op50
  %op53 = load i32, i32* %op10
  %op54 = add i32 %op53, 1
  store i32 %op54, i32* %op10
  %op59 = load i32, i32* %op21
  %op60 = add i32 %op59, 1
  store i32 %op60, i32* %op21
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret void
}
define i32 @dfs(i32 %arg0, i32 %arg1, i32 %arg2) {
label_entry:
  %op9 = icmp eq i32 %arg0, %arg1
  br i1 %op9, label %label_4, label %label_5
label_ret:                                                ; preds = %label_4, %label_16, %label_8
  %op107 = phi i32 [ 0, %label_8 ], [ %op60, %label_16 ], [ %arg2, %label_4 ]
  ret i32 %op107
label_4:                                                ; preds = %label_entry
  br label %label_ret
label_5:                                                ; preds = %label_entry
  %op13 = getelementptr [10 x i32], [10 x i32]* @used, i32 0, i32 %arg0
  store i32 1, i32* %op13
  br label %label_6
label_6:                                                ; preds = %label_5, %label_9, %label_11, %label_17
  %op110 = phi i32 [ 0, %label_5 ], [ %op103, %label_17 ], [ %op37, %label_11 ], [ %op29, %label_9 ]
  %op17 = getelementptr [10 x i32], [10 x i32]* @size, i32 0, i32 %arg0
  %op18 = load i32, i32* %op17
  %op19 = icmp slt i32 %op110, %op18
  br i1 %op19, label %label_7, label %label_8
label_7:                                                ; preds = %label_6
  %op21 = getelementptr [10 x [10 x i32]], [10 x [10 x i32]]* @to, i32 0, i32 %arg0
  %op23 = getelementptr [10 x i32], [10 x i32]* %op21, i32 0, i32 %op110
  %op24 = load i32, i32* %op23
  %op25 = getelementptr [10 x i32], [10 x i32]* @used, i32 0, i32 %op24
  %op26 = load i32, i32* %op25
  %op27 = icmp ne i32 %op26, 0
  br i1 %op27, label %label_9, label %label_10
label_8:                                                ; preds = %label_6
  br label %label_ret
label_9:                                                ; preds = %label_7
  %op29 = add i32 %op110, 1
  br label %label_6
label_10:                                                ; preds = %label_7
  %op31 = getelementptr [10 x [10 x i32]], [10 x [10 x i32]]* @cap, i32 0, i32 %arg0
  %op33 = getelementptr [10 x i32], [10 x i32]* %op31, i32 0, i32 %op110
  %op34 = load i32, i32* %op33
  %op35 = icmp sle i32 %op34, 0
  br i1 %op35, label %label_11, label %label_12
label_11:                                                ; preds = %label_10
  %op37 = add i32 %op110, 1
  br label %label_6
label_12:                                                ; preds = %label_10
  %op44 = load i32, i32* %op33
  %op45 = icmp slt i32 %arg2, %op44
  br i1 %op45, label %label_13, label %label_14
label_13:                                                ; preds = %label_12
  br label %label_15
label_14:                                                ; preds = %label_12
  %op51 = load i32, i32* %op33
  br label %label_15
label_15:                                                ; preds = %label_13, %label_14
  %op111 = phi i32 [ %op51, %label_14 ], [ %arg2, %label_13 ]
  %op57 = load i32, i32* %op23
  %op60 = call i32 @dfs(i32 %op57, i32 %arg1, i32 %op111)
  %op62 = icmp sgt i32 %op60, 0
  br i1 %op62, label %label_16, label %label_17
label_16:                                                ; preds = %label_15
  %op67 = load i32, i32* %op33
  %op69 = sub i32 %op67, %op60
  store i32 %op69, i32* %op33
  %op78 = load i32, i32* %op23
  %op79 = getelementptr [10 x [10 x i32]], [10 x [10 x i32]]* @cap, i32 0, i32 %op78
  %op81 = getelementptr [10 x [10 x i32]], [10 x [10 x i32]]* @rev, i32 0, i32 %arg0
  %op83 = getelementptr [10 x i32], [10 x i32]* %op81, i32 0, i32 %op110
  %op84 = load i32, i32* %op83
  %op85 = getelementptr [10 x i32], [10 x i32]* %op79, i32 0, i32 %op84
  %op86 = load i32, i32* %op85
  %op88 = add i32 %op86, %op60
  %op93 = load i32, i32* %op23
  %op94 = getelementptr [10 x [10 x i32]], [10 x [10 x i32]]* @cap, i32 0, i32 %op93
  %op99 = load i32, i32* %op83
  %op100 = getelementptr [10 x i32], [10 x i32]* %op94, i32 0, i32 %op99
  store i32 %op88, i32* %op100
  br label %label_ret
label_17:                                                ; preds = %label_15
  %op103 = add i32 %op110, 1
  br label %label_6
}
define i32 @max_flow(i32 %arg0, i32 %arg1) {
label_entry:
  br label %label_18
label_ret:                                                ; preds = %label_19
  ret i32 %op23
label_18:                                                ; preds = %label_entry, %label_22
  %op23 = phi i32 [ 0, %label_entry ], [ %op19, %label_22 ]
  br label %label_19
label_19:                                                ; preds = %label_18
  %op8 = getelementptr [10 x i32], [10 x i32]* @used, i32 0, i32 0
  call void @my_memset(i32* %op8, i32 0, i32 10)
  %op12 = load i32, i32* @INF
  %op13 = call i32 @dfs(i32 %arg0, i32 %arg1, i32 %op12)
  %op15 = icmp eq i32 %op13, 0
  br i1 %op15, label %label_ret, label %label_22
label_22:                                                ; preds = %label_19
  %op19 = add i32 %op23, %op13
  br label %label_18
}
define i32 @main() {
label_entry:
  %op3 = call i32 @get_int()
  %op4 = call i32 @get_int()
  %op5 = getelementptr [10 x i32], [10 x i32]* @size, i32 0, i32 0
  call void @my_memset(i32* %op5, i32 0, i32 10)
  br label %label_23
label_ret:                                                ; preds = %label_25
  ret i32 0
label_23:                                                ; preds = %label_entry, %label_24
  %op22 = phi i32 [ %op4, %label_entry ], [ %op19, %label_24 ]
  %op8 = icmp sgt i32 %op22, 0
  br i1 %op8, label %label_24, label %label_25
label_24:                                                ; preds = %label_23
  %op11 = call i32 @get_int()
  %op12 = call i32 @get_int()
  %op14 = call i32 @get_int()
  call void @add_node(i32 %op11, i32 %op12, i32 %op14)
  %op19 = sub i32 %op22, 1
  br label %label_23
label_25:                                                ; preds = %label_23
  %op21 = call i32 @max_flow(i32 1, i32 %op3)
  call void @put_int(i32 %op21)
  call void @put_char(i32 10)
  br label %label_ret
}
