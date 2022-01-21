@maxn = constant i32 18
@mod = constant i32 1000000007
@dp = global [18 x [18 x [18 x [18 x [18 x [7 x i32]]]]]] zeroinitializer
@list = global [200 x i32] zeroinitializer
@cns = global [20 x i32] zeroinitializer
declare void @put_int(i32)

define i32 @equal(i32 %arg0, i32 %arg1) {
label_entry:
  %op7 = icmp eq i32 %arg0, %arg1
  br i1 %op7, label %label_1, label %label_2
label_ret:                                                ; preds = %label_1, %label_2
  %op9 = phi i32 [ 0, %label_2 ], [ 1, %label_1 ]
  ret i32 %op9
label_1:                                                ; preds = %label_entry
  br label %label_ret
label_2:                                                ; preds = %label_entry
  br label %label_ret
}
define i32 @dfs(i32 %arg0, i32 %arg1, i32 %arg2, i32 %arg3, i32 %arg4, i32 %arg5) {
label_entry:
  %op14 = getelementptr [18 x [18 x [18 x [18 x [18 x [7 x i32]]]]]], [18 x [18 x [18 x [18 x [18 x [7 x i32]]]]]]* @dp, i32 0, i32 %arg0
  %op16 = getelementptr [18 x [18 x [18 x [18 x [7 x i32]]]]], [18 x [18 x [18 x [18 x [7 x i32]]]]]* %op14, i32 0, i32 %arg1
  %op18 = getelementptr [18 x [18 x [18 x [7 x i32]]]], [18 x [18 x [18 x [7 x i32]]]]* %op16, i32 0, i32 %arg2
  %op20 = getelementptr [18 x [18 x [7 x i32]]], [18 x [18 x [7 x i32]]]* %op18, i32 0, i32 %arg3
  %op22 = getelementptr [18 x [7 x i32]], [18 x [7 x i32]]* %op20, i32 0, i32 %arg4
  %op24 = getelementptr [7 x i32], [7 x i32]* %op22, i32 0, i32 %arg5
  %op25 = load i32, i32* %op24
  %op26 = icmp ne i32 %op25, -1
  br i1 %op26, label %label_3, label %label_4
label_ret:                                                ; preds = %label_3, %label_5, %label_16
  %op172 = phi i32 [ %op170, %label_16 ], [ 1, %label_5 ], [ %op40, %label_3 ]
  ret i32 %op172
label_3:                                                ; preds = %label_entry
  %op40 = load i32, i32* %op24
  br label %label_ret
label_4:                                                ; preds = %label_entry
  %op43 = add i32 %arg0, %arg1
  %op45 = add i32 %op43, %arg2
  %op47 = add i32 %op45, %arg3
  %op49 = add i32 %op47, %arg4
  %op50 = icmp eq i32 %op49, 0
  br i1 %op50, label %label_5, label %label_6
label_5:                                                ; preds = %label_4
  br label %label_ret
label_6:                                                ; preds = %label_4
  %op53 = icmp ne i32 %arg0, 0
  br i1 %op53, label %label_7, label %label_8
label_7:                                                ; preds = %label_6
  %op57 = call i32 @equal(i32 %arg5, i32 2)
  %op58 = sub i32 %arg0, %op57
  %op60 = sub i32 %arg0, 1
  %op65 = call i32 @dfs(i32 %op60, i32 %arg1, i32 %arg2, i32 %arg3, i32 %arg4, i32 1)
  %op66 = mul i32 %op58, %op65
  %op67 = add i32 0, %op66
  %op68 = load i32, i32* @mod
  %op69 = srem i32 %op67, %op68
  br label %label_8
label_8:                                                ; preds = %label_6, %label_7
  %op173 = phi i32 [ 0, %label_6 ], [ %op69, %label_7 ]
  %op71 = icmp ne i32 %arg1, 0
  br i1 %op71, label %label_9, label %label_10
label_9:                                                ; preds = %label_8
  %op75 = call i32 @equal(i32 %arg5, i32 3)
  %op76 = sub i32 %arg1, %op75
  %op78 = add i32 %arg0, 1
  %op80 = sub i32 %arg1, 1
  %op84 = call i32 @dfs(i32 %op78, i32 %op80, i32 %arg2, i32 %arg3, i32 %arg4, i32 2)
  %op85 = mul i32 %op76, %op84
  %op86 = add i32 %op173, %op85
  %op87 = load i32, i32* @mod
  %op88 = srem i32 %op86, %op87
  br label %label_10
label_10:                                                ; preds = %label_8, %label_9
  %op174 = phi i32 [ %op173, %label_8 ], [ %op88, %label_9 ]
  %op90 = icmp ne i32 %arg2, 0
  br i1 %op90, label %label_11, label %label_12
label_11:                                                ; preds = %label_10
  %op94 = call i32 @equal(i32 %arg5, i32 4)
  %op95 = sub i32 %arg2, %op94
  %op98 = add i32 %arg1, 1
  %op100 = sub i32 %arg2, 1
  %op103 = call i32 @dfs(i32 %arg0, i32 %op98, i32 %op100, i32 %arg3, i32 %arg4, i32 3)
  %op104 = mul i32 %op95, %op103
  %op105 = add i32 %op174, %op104
  %op106 = load i32, i32* @mod
  %op107 = srem i32 %op105, %op106
  br label %label_12
label_12:                                                ; preds = %label_10, %label_11
  %op175 = phi i32 [ %op174, %label_10 ], [ %op107, %label_11 ]
  %op109 = icmp ne i32 %arg3, 0
  br i1 %op109, label %label_13, label %label_14
label_13:                                                ; preds = %label_12
  %op113 = call i32 @equal(i32 %arg5, i32 5)
  %op114 = sub i32 %arg3, %op113
  %op118 = add i32 %arg2, 1
  %op120 = sub i32 %arg3, 1
  %op122 = call i32 @dfs(i32 %arg0, i32 %arg1, i32 %op118, i32 %op120, i32 %arg4, i32 4)
  %op123 = mul i32 %op114, %op122
  %op124 = add i32 %op175, %op123
  %op125 = load i32, i32* @mod
  %op126 = srem i32 %op124, %op125
  br label %label_14
label_14:                                                ; preds = %label_12, %label_13
  %op176 = phi i32 [ %op175, %label_12 ], [ %op126, %label_13 ]
  %op128 = icmp ne i32 %arg4, 0
  br i1 %op128, label %label_15, label %label_16
label_15:                                                ; preds = %label_14
  %op135 = add i32 %arg3, 1
  %op137 = sub i32 %arg4, 1
  %op138 = call i32 @dfs(i32 %arg0, i32 %arg1, i32 %arg2, i32 %op135, i32 %op137, i32 5)
  %op139 = mul i32 %arg4, %op138
  %op140 = add i32 %op176, %op139
  %op141 = load i32, i32* @mod
  %op142 = srem i32 %op140, %op141
  br label %label_16
label_16:                                                ; preds = %label_14, %label_15
  %op177 = phi i32 [ %op176, %label_14 ], [ %op142, %label_15 ]
  %op144 = load i32, i32* @mod
  %op145 = srem i32 %op177, %op144
  store i32 %op145, i32* %op24
  %op170 = load i32, i32* %op24
  br label %label_ret
}
define i32 @main() {
label_entry:
  br label %label_17
label_ret:                                                ; preds = %label_34
  ret i32 %op136
label_17:                                                ; preds = %label_entry, %label_22
  %op143 = phi i32 [ 0, %label_entry ], [ %op12, %label_22 ]
  %op4 = load i32, i32* @maxn
  %op5 = icmp slt i32 %op143, %op4
  br i1 %op5, label %label_18, label %label_19
label_18:                                                ; preds = %label_17
  br label %label_20
label_19:                                                ; preds = %label_17
  br label %label_32
label_20:                                                ; preds = %label_18, %label_25
  %op147 = phi i32 [ 0, %label_18 ], [ %op18, %label_25 ]
  %op8 = load i32, i32* @maxn
  %op9 = icmp slt i32 %op147, %op8
  br i1 %op9, label %label_21, label %label_22
label_21:                                                ; preds = %label_20
  br label %label_23
label_22:                                                ; preds = %label_20
  %op12 = add i32 %op143, 1
  br label %label_17
label_23:                                                ; preds = %label_21, %label_28
  %op150 = phi i32 [ 0, %label_21 ], [ %op24, %label_28 ]
  %op14 = load i32, i32* @maxn
  %op15 = icmp slt i32 %op150, %op14
  br i1 %op15, label %label_24, label %label_25
label_24:                                                ; preds = %label_23
  br label %label_26
label_25:                                                ; preds = %label_23
  %op18 = add i32 %op147, 1
  br label %label_20
label_26:                                                ; preds = %label_24, %label_31
  %op152 = phi i32 [ 0, %label_24 ], [ %op108, %label_31 ]
  %op20 = load i32, i32* @maxn
  %op21 = icmp slt i32 %op152, %op20
  br i1 %op21, label %label_27, label %label_28
label_27:                                                ; preds = %label_26
  br label %label_29
label_28:                                                ; preds = %label_26
  %op24 = add i32 %op150, 1
  br label %label_23
label_29:                                                ; preds = %label_27, %label_30
  %op153 = phi i32 [ 0, %label_27 ], [ %op106, %label_30 ]
  %op26 = load i32, i32* @maxn
  %op27 = icmp slt i32 %op153, %op26
  br i1 %op27, label %label_30, label %label_31
label_30:                                                ; preds = %label_29
  %op29 = getelementptr [18 x [18 x [18 x [18 x [18 x [7 x i32]]]]]], [18 x [18 x [18 x [18 x [18 x [7 x i32]]]]]]* @dp, i32 0, i32 %op143
  %op31 = getelementptr [18 x [18 x [18 x [18 x [7 x i32]]]]], [18 x [18 x [18 x [18 x [7 x i32]]]]]* %op29, i32 0, i32 %op147
  %op33 = getelementptr [18 x [18 x [18 x [7 x i32]]]], [18 x [18 x [18 x [7 x i32]]]]* %op31, i32 0, i32 %op150
  %op35 = getelementptr [18 x [18 x [7 x i32]]], [18 x [18 x [7 x i32]]]* %op33, i32 0, i32 %op152
  %op37 = getelementptr [18 x [7 x i32]], [18 x [7 x i32]]* %op35, i32 0, i32 %op153
  %op38 = getelementptr [7 x i32], [7 x i32]* %op37, i32 0, i32 0
  store i32 -1, i32* %op38
  %op49 = getelementptr [7 x i32], [7 x i32]* %op37, i32 0, i32 1
  store i32 -1, i32* %op49
  %op60 = getelementptr [7 x i32], [7 x i32]* %op37, i32 0, i32 2
  store i32 -1, i32* %op60
  %op71 = getelementptr [7 x i32], [7 x i32]* %op37, i32 0, i32 3
  store i32 -1, i32* %op71
  %op82 = getelementptr [7 x i32], [7 x i32]* %op37, i32 0, i32 4
  store i32 -1, i32* %op82
  %op93 = getelementptr [7 x i32], [7 x i32]* %op37, i32 0, i32 5
  store i32 -1, i32* %op93
  %op104 = getelementptr [7 x i32], [7 x i32]* %op37, i32 0, i32 6
  store i32 -1, i32* %op104
  %op106 = add i32 %op153, 1
  br label %label_29
label_31:                                                ; preds = %label_29
  %op108 = add i32 %op152, 1
  br label %label_26
label_32:                                                ; preds = %label_19, %label_33
  %op154 = phi i32 [ 0, %label_19 ], [ %op124, %label_33 ]
  %op110 = icmp slt i32 %op154, 5
  br i1 %op110, label %label_33, label %label_34
label_33:                                                ; preds = %label_32
  %op112 = getelementptr [200 x i32], [200 x i32]* @list, i32 0, i32 %op154
  store i32 2, i32* %op112
  %op115 = load i32, i32* %op112
  %op116 = getelementptr [20 x i32], [20 x i32]* @cns, i32 0, i32 %op115
  %op117 = load i32, i32* %op116
  %op118 = add i32 %op117, 1
  %op121 = load i32, i32* %op112
  %op122 = getelementptr [20 x i32], [20 x i32]* @cns, i32 0, i32 %op121
  store i32 %op118, i32* %op122
  %op124 = add i32 %op154, 1
  br label %label_32
label_34:                                                ; preds = %label_32
  %op126 = getelementptr [20 x i32], [20 x i32]* @cns, i32 0, i32 1
  %op127 = load i32, i32* %op126
  %op128 = getelementptr [20 x i32], [20 x i32]* @cns, i32 0, i32 2
  %op129 = load i32, i32* %op128
  %op130 = getelementptr [20 x i32], [20 x i32]* @cns, i32 0, i32 3
  %op131 = load i32, i32* %op130
  %op132 = getelementptr [20 x i32], [20 x i32]* @cns, i32 0, i32 4
  %op133 = load i32, i32* %op132
  %op134 = getelementptr [20 x i32], [20 x i32]* @cns, i32 0, i32 5
  %op135 = load i32, i32* %op134
  %op136 = call i32 @dfs(i32 %op127, i32 %op129, i32 %op131, i32 %op133, i32 %op135, i32 0)
  call void @put_int(i32 %op136)
  br label %label_ret
}
