@n = global i32 zeroinitializer
declare void @put_int(i32)

define i32 @bubblesort(i32* %arg0) {
label_entry:
  br label %label_1
label_ret:                                                ; preds = %label_1
  ret i32 0
label_1:                                                ; preds = %label_entry, %label_6
  %op49 = phi i32 [ 0, %label_entry ], [ %op27, %label_6 ]
  %op7 = load i32, i32* @n
  %op8 = sub i32 %op7, 1
  %op9 = icmp slt i32 %op49, %op8
  br i1 %op9, label %label_2, label %label_ret
label_2:                                                ; preds = %label_1
  br label %label_4
label_4:                                                ; preds = %label_2, %label_8
  %op50 = phi i32 [ 0, %label_2 ], [ %op21, %label_8 ]
  %op11 = load i32, i32* @n
  %op13 = sub i32 %op11, %op49
  %op14 = sub i32 %op13, 1
  %op15 = icmp slt i32 %op50, %op14
  br i1 %op15, label %label_5, label %label_6
label_5:                                                ; preds = %label_4
  %op18 = getelementptr i32, i32* %arg0, i32 %op50
  %op19 = load i32, i32* %op18
  %op21 = add i32 %op50, 1
  %op23 = getelementptr i32, i32* %arg0, i32 %op21
  %op24 = load i32, i32* %op23
  %op25 = icmp sgt i32 %op19, %op24
  br i1 %op25, label %label_7, label %label_8
label_6:                                                ; preds = %label_4
  %op27 = add i32 %op49, 1
  br label %label_1
label_7:                                                ; preds = %label_5
  %op33 = load i32, i32* %op23
  %op37 = load i32, i32* %op18
  store i32 %op37, i32* %op23
  store i32 %op33, i32* %op18
  br label %label_8
label_8:                                                ; preds = %label_5, %label_7
  br label %label_4
}
define i32 @insertsort(i32* %arg0) {
label_entry:
  br label %label_9
label_ret:                                                ; preds = %label_9
  ret i32 0
label_9:                                                ; preds = %label_entry, %label_14
  %op43 = phi i32 [ 1, %label_entry ], [ %op34, %label_14 ]
  %op6 = load i32, i32* @n
  %op7 = icmp slt i32 %op43, %op6
  br i1 %op7, label %label_10, label %label_ret
label_10:                                                ; preds = %label_9
  %op11 = getelementptr i32, i32* %arg0, i32 %op43
  %op12 = load i32, i32* %op11
  %op15 = sub i32 %op43, 1
  br label %label_12
label_12:                                                ; preds = %label_10, %label_13
  %op44 = phi i32 [ %op15, %label_10 ], [ %op27, %label_13 ]
  %op17 = icmp sgt i32 %op44, -1
  br i1 %op17, label %label_15, label %label_14
label_13:                                                ; preds = %label_15
  %op21 = load i32, i32* %op38
  %op23 = add i32 %op44, 1
  %op25 = getelementptr i32, i32* %arg0, i32 %op23
  store i32 %op21, i32* %op25
  %op27 = sub i32 %op44, 1
  br label %label_12
label_14:                                                ; preds = %label_12, %label_15
  %op30 = add i32 %op44, 1
  %op32 = getelementptr i32, i32* %arg0, i32 %op30
  store i32 %op12, i32* %op32
  %op34 = add i32 %op43, 1
  br label %label_9
label_15:                                                ; preds = %label_12
  %op38 = getelementptr i32, i32* %arg0, i32 %op44
  %op39 = load i32, i32* %op38
  %op40 = icmp slt i32 %op12, %op39
  br i1 %op40, label %label_13, label %label_14
}
define i32 @QuickSort(i32* %arg0, i32 %arg1, i32 %arg2) {
label_entry:
  %op9 = icmp slt i32 %arg1, %arg2
  br i1 %op9, label %label_16, label %label_17
label_ret:                                                ; preds = %label_17
  ret i32 0
label_16:                                                ; preds = %label_entry
  %op18 = getelementptr i32, i32* %arg0, i32 %arg1
  %op19 = load i32, i32* %op18
  br label %label_18
label_17:                                                ; preds = %label_entry, %label_20
  br label %label_ret
label_18:                                                ; preds = %label_16, %label_32
  %op90 = phi i32 [ %arg2, %label_16 ], [ %op95, %label_32 ]
  %op91 = phi i32 [ %arg1, %label_16 ], [ %op94, %label_32 ]
  %op22 = icmp slt i32 %op91, %op90
  br i1 %op22, label %label_19, label %label_20
label_19:                                                ; preds = %label_18
  br label %label_21
label_20:                                                ; preds = %label_18
  %op26 = getelementptr i32, i32* %arg0, i32 %op91
  store i32 %op19, i32* %op26
  %op29 = sub i32 %op91, 1
  %op33 = call i32 @QuickSort(i32* %arg0, i32 %arg1, i32 %op29)
  %op35 = add i32 %op91, 1
  %op39 = call i32 @QuickSort(i32* %arg0, i32 %op35, i32 %arg2)
  br label %label_17
label_21:                                                ; preds = %label_19, %label_22
  %op92 = phi i32 [ %op90, %label_19 ], [ %op44, %label_22 ]
  %op42 = icmp slt i32 %op91, %op92
  br i1 %op42, label %label_24, label %label_23
label_22:                                                ; preds = %label_24
  %op44 = sub i32 %op92, 1
  br label %label_21
label_23:                                                ; preds = %label_21, %label_24
  br i1 %op42, label %label_25, label %label_26
label_24:                                                ; preds = %label_21
  %op50 = getelementptr i32, i32* %arg0, i32 %op92
  %op51 = load i32, i32* %op50
  %op53 = sub i32 %op19, 1
  %op54 = icmp sgt i32 %op51, %op53
  br i1 %op54, label %label_22, label %label_23
label_25:                                                ; preds = %label_23
  %op57 = getelementptr i32, i32* %arg0, i32 %op92
  %op58 = load i32, i32* %op57
  %op61 = getelementptr i32, i32* %arg0, i32 %op91
  store i32 %op58, i32* %op61
  %op63 = add i32 %op91, 1
  br label %label_26
label_26:                                                ; preds = %label_23, %label_25
  %op93 = phi i32 [ %op91, %label_23 ], [ %op63, %label_25 ]
  br label %label_27
label_27:                                                ; preds = %label_26, %label_28
  %op94 = phi i32 [ %op93, %label_26 ], [ %op68, %label_28 ]
  %op66 = icmp slt i32 %op94, %op92
  br i1 %op66, label %label_30, label %label_29
label_28:                                                ; preds = %label_30
  %op68 = add i32 %op94, 1
  br label %label_27
label_29:                                                ; preds = %label_27, %label_30
  br i1 %op66, label %label_31, label %label_32
label_30:                                                ; preds = %label_27
  %op74 = getelementptr i32, i32* %arg0, i32 %op94
  %op75 = load i32, i32* %op74
  %op77 = icmp slt i32 %op75, %op19
  br i1 %op77, label %label_28, label %label_29
label_31:                                                ; preds = %label_29
  %op80 = getelementptr i32, i32* %arg0, i32 %op94
  %op81 = load i32, i32* %op80
  %op84 = getelementptr i32, i32* %arg0, i32 %op92
  store i32 %op81, i32* %op84
  %op86 = sub i32 %op92, 1
  br label %label_32
label_32:                                                ; preds = %label_29, %label_31
  %op95 = phi i32 [ %op92, %label_29 ], [ %op86, %label_31 ]
  br label %label_18
}
define i32 @getMid(i32* %arg0) {
label_entry:
  %op4 = load i32, i32* @n
  %op5 = srem i32 %op4, 2
  %op6 = icmp eq i32 %op5, 0
  br i1 %op6, label %label_33, label %label_34
label_ret:                                                ; preds = %label_33, %label_34
  %op27 = phi i32 [ %op26, %label_34 ], [ %op20, %label_33 ]
  ret i32 %op27
label_33:                                                ; preds = %label_entry
  %op8 = load i32, i32* @n
  %op9 = sdiv i32 %op8, 2
  %op12 = getelementptr i32, i32* %arg0, i32 %op9
  %op13 = load i32, i32* %op12
  %op15 = sub i32 %op9, 1
  %op17 = getelementptr i32, i32* %arg0, i32 %op15
  %op18 = load i32, i32* %op17
  %op19 = add i32 %op13, %op18
  %op20 = sdiv i32 %op19, 2
  br label %label_ret
label_34:                                                ; preds = %label_entry
  %op21 = load i32, i32* @n
  %op22 = sdiv i32 %op21, 2
  %op25 = getelementptr i32, i32* %arg0, i32 %op22
  %op26 = load i32, i32* %op25
  br label %label_ret
}
define i32 @getMost(i32* %arg0) {
label_entry:
  %op3 = alloca [1000 x i32]
  br label %label_36
label_ret:                                                ; preds = %label_39
  ret i32 %op42
label_36:                                                ; preds = %label_entry, %label_37
  %op40 = phi i32 [ 0, %label_entry ], [ %op11, %label_37 ]
  %op7 = icmp slt i32 %op40, 1000
  br i1 %op7, label %label_37, label %label_38
label_37:                                                ; preds = %label_36
  %op9 = getelementptr [1000 x i32], [1000 x i32]* %op3, i32 0, i32 %op40
  store i32 0, i32* %op9
  %op11 = add i32 %op40, 1
  br label %label_36
label_38:                                                ; preds = %label_36
  br label %label_39
label_39:                                                ; preds = %label_38, %label_43
  %op42 = phi i32 [ %op45, %label_43 ], [ undef, %label_38 ]
  %op43 = phi i32 [ 0, %label_38 ], [ %op46, %label_43 ]
  %op44 = phi i32 [ 0, %label_38 ], [ %op39, %label_43 ]
  %op15 = load i32, i32* @n
  %op16 = icmp slt i32 %op44, %op15
  br i1 %op16, label %label_40, label %label_ret
label_40:                                                ; preds = %label_39
  %op20 = getelementptr i32, i32* %arg0, i32 %op44
  %op21 = load i32, i32* %op20
  %op23 = getelementptr [1000 x i32], [1000 x i32]* %op3, i32 0, i32 %op21
  %op24 = load i32, i32* %op23
  %op25 = add i32 %op24, 1
  store i32 %op25, i32* %op23
  %op30 = load i32, i32* %op23
  %op32 = icmp sgt i32 %op30, %op43
  br i1 %op32, label %label_42, label %label_43
label_42:                                                ; preds = %label_40
  %op36 = load i32, i32* %op23
  br label %label_43
label_43:                                                ; preds = %label_40, %label_42
  %op45 = phi i32 [ %op42, %label_40 ], [ %op21, %label_42 ]
  %op46 = phi i32 [ %op43, %label_40 ], [ %op36, %label_42 ]
  %op39 = add i32 %op44, 1
  br label %label_39
}
define i32 @revert(i32* %arg0) {
label_entry:
  br label %label_44
label_ret:                                                ; preds = %label_44
  ret i32 0
label_44:                                                ; preds = %label_entry, %label_45
  %op29 = phi i32 [ 0, %label_entry ], [ %op28, %label_45 ]
  %op30 = phi i32 [ 0, %label_entry ], [ %op26, %label_45 ]
  %op9 = icmp slt i32 %op30, %op29
  br i1 %op9, label %label_45, label %label_ret
label_45:                                                ; preds = %label_44
  %op12 = getelementptr i32, i32* %arg0, i32 %op30
  %op13 = load i32, i32* %op12
  %op16 = getelementptr i32, i32* %arg0, i32 %op29
  %op17 = load i32, i32* %op16
  store i32 %op17, i32* %op12
  store i32 %op13, i32* %op16
  %op26 = add i32 %op30, 1
  %op28 = sub i32 %op29, 1
  br label %label_44
}
define i32 @arrCopy(i32* %arg0, i32* %arg1) {
label_entry:
  br label %label_47
label_ret:                                                ; preds = %label_47
  ret i32 0
label_47:                                                ; preds = %label_entry, %label_48
  %op19 = phi i32 [ 0, %label_entry ], [ %op18, %label_48 ]
  %op8 = load i32, i32* @n
  %op9 = icmp slt i32 %op19, %op8
  br i1 %op9, label %label_48, label %label_ret
label_48:                                                ; preds = %label_47
  %op12 = getelementptr i32, i32* %arg0, i32 %op19
  %op13 = load i32, i32* %op12
  %op16 = getelementptr i32, i32* %arg1, i32 %op19
  store i32 %op13, i32* %op16
  %op18 = add i32 %op19, 1
  br label %label_47
}
define i32 @calSum(i32* %arg0, i32 %arg1) {
label_entry:
  br label %label_50
label_ret:                                                ; preds = %label_50
  ret i32 0
label_50:                                                ; preds = %label_entry, %label_55
  %op32 = phi i32 [ 0, %label_entry ], [ %op31, %label_55 ]
  %op33 = phi i32 [ 0, %label_entry ], [ %op34, %label_55 ]
  %op9 = load i32, i32* @n
  %op10 = icmp slt i32 %op32, %op9
  br i1 %op10, label %label_51, label %label_ret
label_51:                                                ; preds = %label_50
  %op14 = getelementptr i32, i32* %arg0, i32 %op32
  %op15 = load i32, i32* %op14
  %op16 = add i32 %op33, %op15
  %op19 = srem i32 %op32, %arg1
  %op21 = sub i32 %arg1, 1
  %op22 = icmp ne i32 %op19, %op21
  br i1 %op22, label %label_53, label %label_54
label_53:                                                ; preds = %label_51
  store i32 0, i32* %op14
  br label %label_55
label_54:                                                ; preds = %label_51
  store i32 %op16, i32* %op14
  br label %label_55
label_55:                                                ; preds = %label_53, %label_54
  %op34 = phi i32 [ 0, %label_54 ], [ %op16, %label_53 ]
  %op31 = add i32 %op32, 1
  br label %label_50
}
define i32 @avgPooling(i32* %arg0, i32 %arg1) {
label_entry:
  br label %label_56
label_ret:                                                ; preds = %label_65
  ret i32 0
label_56:                                                ; preds = %label_entry, %label_61
  %op72 = phi i32 [ %op75, %label_61 ], [ undef, %label_entry ]
  %op73 = phi i32 [ 0, %label_entry ], [ %op31, %label_61 ]
  %op74 = phi i32 [ 0, %label_entry ], [ %op76, %label_61 ]
  %op10 = load i32, i32* @n
  %op11 = icmp slt i32 %op73, %op10
  br i1 %op11, label %label_57, label %label_58
label_57:                                                ; preds = %label_56
  %op14 = sub i32 %arg1, 1
  %op15 = icmp slt i32 %op73, %op14
  br i1 %op15, label %label_59, label %label_60
label_58:                                                ; preds = %label_56
  %op16 = load i32, i32* @n
  %op18 = sub i32 %op16, %arg1
  %op19 = add i32 %op18, 1
  br label %label_65
label_59:                                                ; preds = %label_57
  %op23 = getelementptr i32, i32* %arg0, i32 %op73
  %op24 = load i32, i32* %op23
  %op25 = add i32 %op74, %op24
  br label %label_61
label_60:                                                ; preds = %label_57
  %op29 = icmp eq i32 %op73, %op14
  br i1 %op29, label %label_62, label %label_63
label_61:                                                ; preds = %label_59, %label_64
  %op75 = phi i32 [ %op77, %label_64 ], [ %op72, %label_59 ]
  %op76 = phi i32 [ %op78, %label_64 ], [ %op25, %label_59 ]
  %op31 = add i32 %op73, 1
  br label %label_56
label_62:                                                ; preds = %label_60
  %op33 = getelementptr i32, i32* %arg0, i32 0
  %op34 = load i32, i32* %op33
  %op37 = sdiv i32 %op74, %arg1
  store i32 %op37, i32* %op33
  br label %label_64
label_63:                                                ; preds = %label_60
  %op43 = getelementptr i32, i32* %arg0, i32 %op73
  %op44 = load i32, i32* %op43
  %op45 = add i32 %op74, %op44
  %op47 = sub i32 %op45, %op72
  %op50 = sub i32 %op73, %arg1
  %op51 = add i32 %op50, 1
  %op53 = getelementptr i32, i32* %arg0, i32 %op51
  %op54 = load i32, i32* %op53
  %op57 = sdiv i32 %op47, %arg1
  store i32 %op57, i32* %op53
  br label %label_64
label_64:                                                ; preds = %label_62, %label_63
  %op77 = phi i32 [ %op54, %label_63 ], [ %op34, %label_62 ]
  %op78 = phi i32 [ %op47, %label_63 ], [ %op74, %label_62 ]
  br label %label_61
label_65:                                                ; preds = %label_58, %label_66
  %op79 = phi i32 [ %op19, %label_58 ], [ %op71, %label_66 ]
  %op65 = load i32, i32* @n
  %op66 = icmp slt i32 %op79, %op65
  br i1 %op66, label %label_66, label %label_ret
label_66:                                                ; preds = %label_65
  %op69 = getelementptr i32, i32* %arg0, i32 %op79
  store i32 0, i32* %op69
  %op71 = add i32 %op79, 1
  br label %label_65
}
define i32 @main() {
label_entry:
  store i32 32, i32* @n
  %op1 = alloca [32 x i32]
  %op2 = alloca [32 x i32]
  %op3 = getelementptr [32 x i32], [32 x i32]* %op1, i32 0, i32 0
  store i32 7, i32* %op3
  %op4 = getelementptr [32 x i32], [32 x i32]* %op1, i32 0, i32 1
  store i32 23, i32* %op4
  %op5 = getelementptr [32 x i32], [32 x i32]* %op1, i32 0, i32 2
  store i32 89, i32* %op5
  %op6 = getelementptr [32 x i32], [32 x i32]* %op1, i32 0, i32 3
  store i32 26, i32* %op6
  %op7 = getelementptr [32 x i32], [32 x i32]* %op1, i32 0, i32 4
  store i32 282, i32* %op7
  %op8 = getelementptr [32 x i32], [32 x i32]* %op1, i32 0, i32 5
  store i32 254, i32* %op8
  %op9 = getelementptr [32 x i32], [32 x i32]* %op1, i32 0, i32 6
  store i32 27, i32* %op9
  %op10 = getelementptr [32 x i32], [32 x i32]* %op1, i32 0, i32 7
  store i32 5, i32* %op10
  %op11 = getelementptr [32 x i32], [32 x i32]* %op1, i32 0, i32 8
  store i32 83, i32* %op11
  %op12 = getelementptr [32 x i32], [32 x i32]* %op1, i32 0, i32 9
  store i32 273, i32* %op12
  %op13 = getelementptr [32 x i32], [32 x i32]* %op1, i32 0, i32 10
  store i32 574, i32* %op13
  %op14 = getelementptr [32 x i32], [32 x i32]* %op1, i32 0, i32 11
  store i32 905, i32* %op14
  %op15 = getelementptr [32 x i32], [32 x i32]* %op1, i32 0, i32 12
  store i32 354, i32* %op15
  %op16 = getelementptr [32 x i32], [32 x i32]* %op1, i32 0, i32 13
  store i32 657, i32* %op16
  %op17 = getelementptr [32 x i32], [32 x i32]* %op1, i32 0, i32 14
  store i32 935, i32* %op17
  %op18 = getelementptr [32 x i32], [32 x i32]* %op1, i32 0, i32 15
  store i32 264, i32* %op18
  %op19 = getelementptr [32 x i32], [32 x i32]* %op1, i32 0, i32 16
  store i32 639, i32* %op19
  %op20 = getelementptr [32 x i32], [32 x i32]* %op1, i32 0, i32 17
  store i32 459, i32* %op20
  %op21 = getelementptr [32 x i32], [32 x i32]* %op1, i32 0, i32 18
  store i32 29, i32* %op21
  %op22 = getelementptr [32 x i32], [32 x i32]* %op1, i32 0, i32 19
  store i32 68, i32* %op22
  %op23 = getelementptr [32 x i32], [32 x i32]* %op1, i32 0, i32 20
  store i32 929, i32* %op23
  %op24 = getelementptr [32 x i32], [32 x i32]* %op1, i32 0, i32 21
  store i32 756, i32* %op24
  %op25 = getelementptr [32 x i32], [32 x i32]* %op1, i32 0, i32 22
  store i32 452, i32* %op25
  %op26 = getelementptr [32 x i32], [32 x i32]* %op1, i32 0, i32 23
  store i32 279, i32* %op26
  %op27 = getelementptr [32 x i32], [32 x i32]* %op1, i32 0, i32 24
  store i32 58, i32* %op27
  %op28 = getelementptr [32 x i32], [32 x i32]* %op1, i32 0, i32 25
  store i32 87, i32* %op28
  %op29 = getelementptr [32 x i32], [32 x i32]* %op1, i32 0, i32 26
  store i32 96, i32* %op29
  %op30 = getelementptr [32 x i32], [32 x i32]* %op1, i32 0, i32 27
  store i32 36, i32* %op30
  %op31 = getelementptr [32 x i32], [32 x i32]* %op1, i32 0, i32 28
  store i32 39, i32* %op31
  %op32 = getelementptr [32 x i32], [32 x i32]* %op1, i32 0, i32 29
  store i32 28, i32* %op32
  %op33 = getelementptr [32 x i32], [32 x i32]* %op1, i32 0, i32 30
  store i32 1, i32* %op33
  %op34 = getelementptr [32 x i32], [32 x i32]* %op1, i32 0, i32 31
  store i32 290, i32* %op34
  %op37 = getelementptr [32 x i32], [32 x i32]* %op2, i32 0, i32 0
  %op38 = call i32 @arrCopy(i32* %op3, i32* %op37)
  %op40 = call i32 @revert(i32* %op37)
  br label %label_68
label_ret:                                                ; preds = %label_86
  ret i32 0
label_68:                                                ; preds = %label_entry, %label_69
  %op134 = phi i32 [ 0, %label_entry ], [ %op50, %label_69 ]
  %op44 = icmp slt i32 %op134, 32
  br i1 %op44, label %label_69, label %label_70
label_69:                                                ; preds = %label_68
  %op46 = getelementptr [32 x i32], [32 x i32]* %op2, i32 0, i32 %op134
  %op47 = load i32, i32* %op46
  call void @put_int(i32 %op47)
  %op50 = add i32 %op134, 1
  br label %label_68
label_70:                                                ; preds = %label_68
  %op52 = call i32 @bubblesort(i32* %op37)
  br label %label_71
label_71:                                                ; preds = %label_70, %label_72
  %op135 = phi i32 [ 0, %label_70 ], [ %op60, %label_72 ]
  %op54 = icmp slt i32 %op135, 32
  br i1 %op54, label %label_72, label %label_73
label_72:                                                ; preds = %label_71
  %op56 = getelementptr [32 x i32], [32 x i32]* %op2, i32 0, i32 %op135
  %op57 = load i32, i32* %op56
  call void @put_int(i32 %op57)
  %op60 = add i32 %op135, 1
  br label %label_71
label_73:                                                ; preds = %label_71
  %op62 = call i32 @getMid(i32* %op37)
  call void @put_int(i32 %op62)
  %op65 = call i32 @getMost(i32* %op37)
  call void @put_int(i32 %op65)
  %op69 = call i32 @arrCopy(i32* %op3, i32* %op37)
  %op71 = call i32 @bubblesort(i32* %op37)
  br label %label_74
label_74:                                                ; preds = %label_73, %label_75
  %op136 = phi i32 [ 0, %label_73 ], [ %op79, %label_75 ]
  %op73 = icmp slt i32 %op136, 32
  br i1 %op73, label %label_75, label %label_76
label_75:                                                ; preds = %label_74
  %op75 = getelementptr [32 x i32], [32 x i32]* %op2, i32 0, i32 %op136
  %op76 = load i32, i32* %op75
  call void @put_int(i32 %op76)
  %op79 = add i32 %op136, 1
  br label %label_74
label_76:                                                ; preds = %label_74
  %op82 = call i32 @arrCopy(i32* %op3, i32* %op37)
  %op84 = call i32 @insertsort(i32* %op37)
  br label %label_77
label_77:                                                ; preds = %label_76, %label_78
  %op137 = phi i32 [ 0, %label_76 ], [ %op92, %label_78 ]
  %op86 = icmp slt i32 %op137, 32
  br i1 %op86, label %label_78, label %label_79
label_78:                                                ; preds = %label_77
  %op88 = getelementptr [32 x i32], [32 x i32]* %op2, i32 0, i32 %op137
  %op89 = load i32, i32* %op88
  call void @put_int(i32 %op89)
  %op92 = add i32 %op137, 1
  br label %label_77
label_79:                                                ; preds = %label_77
  %op95 = call i32 @arrCopy(i32* %op3, i32* %op37)
  %op99 = call i32 @QuickSort(i32* %op37, i32 0, i32 31)
  br label %label_80
label_80:                                                ; preds = %label_79, %label_81
  %op138 = phi i32 [ 0, %label_79 ], [ %op107, %label_81 ]
  %op101 = icmp slt i32 %op138, 32
  br i1 %op101, label %label_81, label %label_82
label_81:                                                ; preds = %label_80
  %op103 = getelementptr [32 x i32], [32 x i32]* %op2, i32 0, i32 %op138
  %op104 = load i32, i32* %op103
  call void @put_int(i32 %op104)
  %op107 = add i32 %op138, 1
  br label %label_80
label_82:                                                ; preds = %label_80
  %op110 = call i32 @arrCopy(i32* %op3, i32* %op37)
  %op112 = call i32 @calSum(i32* %op37, i32 4)
  br label %label_83
label_83:                                                ; preds = %label_82, %label_84
  %op139 = phi i32 [ 0, %label_82 ], [ %op120, %label_84 ]
  %op114 = icmp slt i32 %op139, 32
  br i1 %op114, label %label_84, label %label_85
label_84:                                                ; preds = %label_83
  %op116 = getelementptr [32 x i32], [32 x i32]* %op2, i32 0, i32 %op139
  %op117 = load i32, i32* %op116
  call void @put_int(i32 %op117)
  %op120 = add i32 %op139, 1
  br label %label_83
label_85:                                                ; preds = %label_83
  %op123 = call i32 @arrCopy(i32* %op3, i32* %op37)
  %op125 = call i32 @avgPooling(i32* %op37, i32 3)
  br label %label_86
label_86:                                                ; preds = %label_85, %label_87
  %op140 = phi i32 [ 0, %label_85 ], [ %op133, %label_87 ]
  %op127 = icmp slt i32 %op140, 32
  br i1 %op127, label %label_87, label %label_ret
label_87:                                                ; preds = %label_86
  %op129 = getelementptr [32 x i32], [32 x i32]* %op2, i32 0, i32 %op140
  %op130 = load i32, i32* %op129
  call void @put_int(i32 %op130)
  %op133 = add i32 %op140, 1
  br label %label_86
}
