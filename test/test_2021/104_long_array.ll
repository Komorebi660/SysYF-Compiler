@N = constant i32 10000
declare void @put_int(i32)

define i32 @long_array(i32 %arg0) {
label_entry:
  %op3 = alloca [10000 x i32]
  %op4 = alloca [10000 x i32]
  %op5 = alloca [10000 x i32]
  br label %label_1
label_ret:                                                ; preds = %label_10
  ret i32 %op136
label_1:                                                ; preds = %label_entry, %label_2
  %op131 = phi i32 [ 0, %label_entry ], [ %op18, %label_2 ]
  %op9 = load i32, i32* @N
  %op10 = icmp slt i32 %op131, %op9
  br i1 %op10, label %label_2, label %label_3
label_2:                                                ; preds = %label_1
  %op13 = mul i32 %op131, %op131
  %op14 = srem i32 %op13, 10
  %op16 = getelementptr [10000 x i32], [10000 x i32]* %op3, i32 0, i32 %op131
  store i32 %op14, i32* %op16
  %op18 = add i32 %op131, 1
  br label %label_1
label_3:                                                ; preds = %label_1
  br label %label_4
label_4:                                                ; preds = %label_3, %label_5
  %op132 = phi i32 [ 0, %label_3 ], [ %op33, %label_5 ]
  %op20 = load i32, i32* @N
  %op21 = icmp slt i32 %op132, %op20
  br i1 %op21, label %label_5, label %label_6
label_5:                                                ; preds = %label_4
  %op23 = getelementptr [10000 x i32], [10000 x i32]* %op3, i32 0, i32 %op132
  %op24 = load i32, i32* %op23
  %op27 = load i32, i32* %op23
  %op28 = mul i32 %op24, %op27
  %op29 = srem i32 %op28, 10
  %op31 = getelementptr [10000 x i32], [10000 x i32]* %op4, i32 0, i32 %op132
  store i32 %op29, i32* %op31
  %op33 = add i32 %op132, 1
  br label %label_4
label_6:                                                ; preds = %label_4
  br label %label_7
label_7:                                                ; preds = %label_6, %label_8
  %op133 = phi i32 [ 0, %label_6 ], [ %op52, %label_8 ]
  %op35 = load i32, i32* @N
  %op36 = icmp slt i32 %op133, %op35
  br i1 %op36, label %label_8, label %label_9
label_8:                                                ; preds = %label_7
  %op38 = getelementptr [10000 x i32], [10000 x i32]* %op4, i32 0, i32 %op133
  %op39 = load i32, i32* %op38
  %op42 = load i32, i32* %op38
  %op43 = mul i32 %op39, %op42
  %op44 = srem i32 %op43, 100
  %op46 = getelementptr [10000 x i32], [10000 x i32]* %op3, i32 0, i32 %op133
  %op47 = load i32, i32* %op46
  %op48 = add i32 %op44, %op47
  %op50 = getelementptr [10000 x i32], [10000 x i32]* %op5, i32 0, i32 %op133
  store i32 %op48, i32* %op50
  %op52 = add i32 %op133, 1
  br label %label_7
label_9:                                                ; preds = %label_7
  br label %label_10
label_10:                                                ; preds = %label_9, %label_15
  %op136 = phi i32 [ 0, %label_9 ], [ %op140, %label_15 ]
  %op137 = phi i32 [ 0, %label_9 ], [ %op70, %label_15 ]
  %op55 = load i32, i32* @N
  %op56 = icmp slt i32 %op137, %op55
  br i1 %op56, label %label_11, label %label_ret
label_11:                                                ; preds = %label_10
  %op58 = icmp slt i32 %op137, 10
  br i1 %op58, label %label_13, label %label_14
label_13:                                                ; preds = %label_11
  %op62 = getelementptr [10000 x i32], [10000 x i32]* %op5, i32 0, i32 %op137
  %op63 = load i32, i32* %op62
  %op64 = add i32 %op136, %op63
  %op65 = srem i32 %op64, 1333
  call void @put_int(i32 %op65)
  br label %label_15
label_14:                                                ; preds = %label_11
  %op68 = icmp slt i32 %op137, 20
  br i1 %op68, label %label_16, label %label_17
label_15:                                                ; preds = %label_13, %label_18
  %op140 = phi i32 [ %op143, %label_18 ], [ %op65, %label_13 ]
  %op70 = add i32 %op137, 1
  br label %label_10
label_16:                                                ; preds = %label_14
  %op72 = load i32, i32* @N
  %op73 = sdiv i32 %op72, 2
  br label %label_19
label_17:                                                ; preds = %label_14
  %op75 = icmp slt i32 %op137, 30
  br i1 %op75, label %label_22, label %label_23
label_18:                                                ; preds = %label_21, %label_24
  %op143 = phi i32 [ %op147, %label_24 ], [ %op145, %label_21 ]
  br label %label_15
label_19:                                                ; preds = %label_16, %label_20
  %op144 = phi i32 [ %op73, %label_16 ], [ %op89, %label_20 ]
  %op145 = phi i32 [ %op136, %label_16 ], [ %op87, %label_20 ]
  %op77 = load i32, i32* @N
  %op78 = icmp slt i32 %op144, %op77
  br i1 %op78, label %label_20, label %label_21
label_20:                                                ; preds = %label_19
  %op81 = getelementptr [10000 x i32], [10000 x i32]* %op5, i32 0, i32 %op137
  %op82 = load i32, i32* %op81
  %op83 = add i32 %op145, %op82
  %op85 = getelementptr [10000 x i32], [10000 x i32]* %op3, i32 0, i32 %op144
  %op86 = load i32, i32* %op85
  %op87 = sub i32 %op83, %op86
  %op89 = add i32 %op144, 1
  br label %label_19
label_21:                                                ; preds = %label_19
  call void @put_int(i32 %op145)
  br label %label_18
label_22:                                                ; preds = %label_17
  %op92 = load i32, i32* @N
  %op93 = sdiv i32 %op92, 2
  br label %label_25
label_23:                                                ; preds = %label_17
  %op96 = getelementptr [10000 x i32], [10000 x i32]* %op5, i32 0, i32 %op137
  %op97 = load i32, i32* %op96
  %op99 = mul i32 %op97, %arg0
  %op100 = add i32 %op136, %op99
  %op101 = srem i32 %op100, 99988
  br label %label_24
label_24:                                                ; preds = %label_27, %label_23
  %op147 = phi i32 [ %op101, %label_23 ], [ %op149, %label_27 ]
  br label %label_18
label_25:                                                ; preds = %label_22, %label_30
  %op148 = phi i32 [ %op93, %label_22 ], [ %op150, %label_30 ]
  %op149 = phi i32 [ %op136, %label_22 ], [ %op151, %label_30 ]
  %op103 = load i32, i32* @N
  %op104 = icmp slt i32 %op148, %op103
  br i1 %op104, label %label_26, label %label_27
label_26:                                                ; preds = %label_25
  %op106 = icmp sgt i32 %op148, 2233
  br i1 %op106, label %label_28, label %label_29
label_27:                                                ; preds = %label_25
  call void @put_int(i32 %op149)
  br label %label_24
label_28:                                                ; preds = %label_26
  %op110 = getelementptr [10000 x i32], [10000 x i32]* %op4, i32 0, i32 %op137
  %op111 = load i32, i32* %op110
  %op112 = add i32 %op149, %op111
  %op114 = getelementptr [10000 x i32], [10000 x i32]* %op3, i32 0, i32 %op148
  %op115 = load i32, i32* %op114
  %op116 = sub i32 %op112, %op115
  %op118 = add i32 %op148, 1
  br label %label_30
label_29:                                                ; preds = %label_26
  %op121 = getelementptr [10000 x i32], [10000 x i32]* %op3, i32 0, i32 %op137
  %op122 = load i32, i32* %op121
  %op123 = add i32 %op149, %op122
  %op125 = getelementptr [10000 x i32], [10000 x i32]* %op5, i32 0, i32 %op148
  %op126 = load i32, i32* %op125
  %op127 = add i32 %op123, %op126
  %op128 = srem i32 %op127, 13333
  %op130 = add i32 %op148, 2
  br label %label_30
label_30:                                                ; preds = %label_28, %label_29
  %op150 = phi i32 [ %op130, %label_29 ], [ %op118, %label_28 ]
  %op151 = phi i32 [ %op128, %label_29 ], [ %op116, %label_28 ]
  br label %label_25
}
define i32 @main() {
label_entry:
  %op1 = call i32 @long_array(i32 9)
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op1
}
