@array = global [110 x i32] zeroinitializer
@n = global i32 zeroinitializer
declare i32 @get_int()

declare void @put_int(i32)

declare void @put_char(i32)

define void @init(i32 %arg0) {
label_entry:
  br label %label_1
label_ret:                                                ; preds = %label_1
  ret void
label_1:                                                ; preds = %label_entry, %label_2
  %op13 = phi i32 [ 1, %label_entry ], [ %op12, %label_2 ]
  %op6 = mul i32 %arg0, %arg0
  %op7 = add i32 %op6, 1
  %op8 = icmp sle i32 %op13, %op7
  br i1 %op8, label %label_2, label %label_ret
label_2:                                                ; preds = %label_1
  %op10 = getelementptr [110 x i32], [110 x i32]* @array, i32 0, i32 %op13
  store i32 -1, i32* %op10
  %op12 = add i32 %op13, 1
  br label %label_1
}
define i32 @findfa(i32 %arg0) {
label_entry:
  %op4 = getelementptr [110 x i32], [110 x i32]* @array, i32 0, i32 %arg0
  %op5 = load i32, i32* %op4
  %op7 = icmp eq i32 %op5, %arg0
  br i1 %op7, label %label_4, label %label_5
label_ret:                                                ; preds = %label_4, %label_5
  %op19 = phi i32 [ %op18, %label_5 ], [ %arg0, %label_4 ]
  ret i32 %op19
label_4:                                                ; preds = %label_entry
  br label %label_ret
label_5:                                                ; preds = %label_entry
  %op12 = load i32, i32* %op4
  %op13 = call i32 @findfa(i32 %op12)
  store i32 %op13, i32* %op4
  %op18 = load i32, i32* %op4
  br label %label_ret
}
define void @mmerge(i32 %arg0, i32 %arg1) {
label_entry:
  %op6 = call i32 @findfa(i32 %arg0)
  %op9 = call i32 @findfa(i32 %arg1)
  %op12 = icmp ne i32 %op6, %op9
  br i1 %op12, label %label_7, label %label_8
label_ret:                                                ; preds = %label_8
  ret void
label_7:                                                ; preds = %label_entry
  %op15 = getelementptr [110 x i32], [110 x i32]* @array, i32 0, i32 %op6
  store i32 %op9, i32* %op15
  br label %label_8
label_8:                                                ; preds = %label_entry, %label_7
  br label %label_ret
}
define i32 @main() {
label_entry:
  br label %label_9
label_ret:                                                ; preds = %label_9
  ret i32 0
label_9:                                                ; preds = %label_entry, %label_38
  %op119 = phi i32 [ 1, %label_entry ], [ %op9, %label_38 ]
  %op7 = icmp ne i32 %op119, 0
  br i1 %op7, label %label_10, label %label_ret
label_10:                                                ; preds = %label_9
  %op9 = sub i32 %op119, 1
  store i32 4, i32* @n
  call void @init(i32 4)
  %op14 = load i32, i32* @n
  %op15 = load i32, i32* @n
  %op16 = mul i32 %op14, %op15
  %op17 = add i32 %op16, 1
  br label %label_12
label_12:                                                ; preds = %label_10, %label_16
  %op121 = phi i32 [ 0, %label_10 ], [ %op126, %label_16 ]
  %op122 = phi i32 [ 0, %label_10 ], [ %op40, %label_16 ]
  %op20 = icmp slt i32 %op122, 10
  br i1 %op20, label %label_13, label %label_14
label_13:                                                ; preds = %label_12
  %op21 = call i32 @get_int()
  %op22 = call i32 @get_int()
  %op24 = icmp eq i32 %op121, 0
  br i1 %op24, label %label_15, label %label_16
label_14:                                                ; preds = %label_12
  %op26 = icmp eq i32 %op121, 0
  br i1 %op26, label %label_37, label %label_38
label_15:                                                ; preds = %label_13
  %op28 = load i32, i32* @n
  %op30 = sub i32 %op21, 1
  %op31 = mul i32 %op28, %op30
  %op33 = add i32 %op31, %op22
  %op36 = getelementptr [110 x i32], [110 x i32]* @array, i32 0, i32 %op33
  store i32 %op33, i32* %op36
  %op38 = icmp eq i32 %op21, 1
  br i1 %op38, label %label_17, label %label_18
label_16:                                                ; preds = %label_13, %label_34
  %op126 = phi i32 [ %op121, %label_13 ], [ %op127, %label_34 ]
  %op40 = add i32 %op122, 1
  br label %label_12
label_17:                                                ; preds = %label_15
  %op41 = getelementptr [110 x i32], [110 x i32]* @array, i32 0, i32 0
  store i32 0, i32* %op41
  call void @mmerge(i32 %op33, i32 0)
  br label %label_18
label_18:                                                ; preds = %label_15, %label_17
  %op44 = load i32, i32* @n
  %op45 = icmp eq i32 %op21, %op44
  br i1 %op45, label %label_19, label %label_20
label_19:                                                ; preds = %label_18
  %op48 = getelementptr [110 x i32], [110 x i32]* @array, i32 0, i32 %op17
  store i32 %op17, i32* %op48
  call void @mmerge(i32 %op33, i32 %op17)
  br label %label_20
label_20:                                                ; preds = %label_18, %label_19
  %op52 = load i32, i32* @n
  %op53 = icmp slt i32 %op22, %op52
  br i1 %op53, label %label_23, label %label_22
label_21:                                                ; preds = %label_23
  call void @mmerge(i32 %op33, i32 %op60)
  br label %label_22
label_22:                                                ; preds = %label_20, %label_23, %label_21
  %op58 = icmp sgt i32 %op22, 1
  br i1 %op58, label %label_26, label %label_25
label_23:                                                ; preds = %label_20
  %op60 = add i32 %op33, 1
  %op61 = getelementptr [110 x i32], [110 x i32]* @array, i32 0, i32 %op60
  %op62 = load i32, i32* %op61
  %op63 = icmp ne i32 %op62, -1
  br i1 %op63, label %label_21, label %label_22
label_24:                                                ; preds = %label_26
  call void @mmerge(i32 %op33, i32 %op71)
  br label %label_25
label_25:                                                ; preds = %label_22, %label_26, %label_24
  %op68 = load i32, i32* @n
  %op69 = icmp slt i32 %op21, %op68
  br i1 %op69, label %label_29, label %label_28
label_26:                                                ; preds = %label_22
  %op71 = sub i32 %op33, 1
  %op72 = getelementptr [110 x i32], [110 x i32]* @array, i32 0, i32 %op71
  %op73 = load i32, i32* %op72
  %op74 = icmp ne i32 %op73, -1
  br i1 %op74, label %label_24, label %label_25
label_27:                                                ; preds = %label_29
  %op77 = load i32, i32* @n
  %op78 = add i32 %op33, %op77
  call void @mmerge(i32 %op33, i32 %op78)
  br label %label_28
label_28:                                                ; preds = %label_25, %label_29, %label_27
  %op80 = icmp sgt i32 %op21, 1
  br i1 %op80, label %label_32, label %label_31
label_29:                                                ; preds = %label_25
  %op82 = load i32, i32* @n
  %op83 = add i32 %op33, %op82
  %op84 = getelementptr [110 x i32], [110 x i32]* @array, i32 0, i32 %op83
  %op85 = load i32, i32* %op84
  %op86 = icmp ne i32 %op85, -1
  br i1 %op86, label %label_27, label %label_28
label_30:                                                ; preds = %label_32
  %op89 = load i32, i32* @n
  %op90 = sub i32 %op33, %op89
  call void @mmerge(i32 %op33, i32 %op90)
  br label %label_31
label_31:                                                ; preds = %label_28, %label_32, %label_30
  %op91 = getelementptr [110 x i32], [110 x i32]* @array, i32 0, i32 0
  %op92 = load i32, i32* %op91
  %op93 = icmp ne i32 %op92, -1
  br i1 %op93, label %label_36, label %label_34
label_32:                                                ; preds = %label_28
  %op95 = load i32, i32* @n
  %op96 = sub i32 %op33, %op95
  %op97 = getelementptr [110 x i32], [110 x i32]* @array, i32 0, i32 %op96
  %op98 = load i32, i32* %op97
  %op99 = icmp ne i32 %op98, -1
  br i1 %op99, label %label_30, label %label_31
label_33:                                                ; preds = %label_35
  %op102 = add i32 %op122, 1
  call void @put_int(i32 %op102)
  call void @put_char(i32 10)
  br label %label_34
label_34:                                                ; preds = %label_31, %label_36, %label_35, %label_33
  %op127 = phi i32 [ %op121, %label_31 ], [ %op121, %label_36 ], [ %op121, %label_35 ], [ 1, %label_33 ]
  br label %label_16
label_35:                                                ; preds = %label_36
  %op104 = call i32 @findfa(i32 0)
  %op106 = call i32 @findfa(i32 %op17)
  %op107 = icmp eq i32 %op104, %op106
  br i1 %op107, label %label_33, label %label_34
label_36:                                                ; preds = %label_31
  %op109 = getelementptr [110 x i32], [110 x i32]* @array, i32 0, i32 %op17
  %op110 = load i32, i32* %op109
  %op111 = icmp ne i32 %op110, -1
  br i1 %op111, label %label_35, label %label_34
label_37:                                                ; preds = %label_14
  call void @put_int(i32 -1)
  call void @put_char(i32 10)
  br label %label_38
label_38:                                                ; preds = %label_14, %label_37
  br label %label_9
}
