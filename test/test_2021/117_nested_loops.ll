@arr1 = global [10 x [2 x [3 x [4 x [5 x [6 x [2 x i32]]]]]]] zeroinitializer
@arr2 = global [10 x [2 x [3 x [2 x [4 x [8 x [7 x i32]]]]]]] zeroinitializer
declare i32 @get_int()

define void @loop1(i32 %arg0, i32 %arg1) {
label_entry:
  br label %label_1
label_ret:                                                ; preds = %label_3
  ret void
label_1:                                                ; preds = %label_entry, %label_7
  %op80 = phi i32 [ 0, %label_entry ], [ %op20, %label_7 ]
  %op13 = icmp slt i32 %op80, %arg0
  br i1 %op13, label %label_4, label %label_3
label_2:                                                ; preds = %label_4
  br label %label_5
label_3:                                                ; preds = %label_1, %label_4
  br label %label_ret
label_4:                                                ; preds = %label_1
  %op16 = icmp slt i32 %op80, %arg1
  br i1 %op16, label %label_2, label %label_3
label_5:                                                ; preds = %label_2, %label_10
  %op86 = phi i32 [ 0, %label_2 ], [ %op24, %label_10 ]
  %op18 = icmp slt i32 %op86, 2
  br i1 %op18, label %label_6, label %label_7
label_6:                                                ; preds = %label_5
  br label %label_8
label_7:                                                ; preds = %label_5
  %op20 = add i32 %op80, 1
  br label %label_1
label_8:                                                ; preds = %label_6, %label_13
  %op91 = phi i32 [ 0, %label_6 ], [ %op28, %label_13 ]
  %op22 = icmp slt i32 %op91, 3
  br i1 %op22, label %label_9, label %label_10
label_9:                                                ; preds = %label_8
  br label %label_11
label_10:                                                ; preds = %label_8
  %op24 = add i32 %op86, 1
  br label %label_5
label_11:                                                ; preds = %label_9, %label_16
  %op95 = phi i32 [ 0, %label_9 ], [ %op32, %label_16 ]
  %op26 = icmp slt i32 %op95, 4
  br i1 %op26, label %label_12, label %label_13
label_12:                                                ; preds = %label_11
  br label %label_14
label_13:                                                ; preds = %label_11
  %op28 = add i32 %op91, 1
  br label %label_8
label_14:                                                ; preds = %label_12, %label_19
  %op98 = phi i32 [ 0, %label_12 ], [ %op36, %label_19 ]
  %op30 = icmp slt i32 %op98, 5
  br i1 %op30, label %label_15, label %label_16
label_15:                                                ; preds = %label_14
  br label %label_17
label_16:                                                ; preds = %label_14
  %op32 = add i32 %op95, 1
  br label %label_11
label_17:                                                ; preds = %label_15, %label_22
  %op100 = phi i32 [ 0, %label_15 ], [ %op73, %label_22 ]
  %op34 = icmp slt i32 %op100, 6
  br i1 %op34, label %label_18, label %label_19
label_18:                                                ; preds = %label_17
  br label %label_20
label_19:                                                ; preds = %label_17
  %op36 = add i32 %op98, 1
  br label %label_14
label_20:                                                ; preds = %label_18, %label_21
  %op101 = phi i32 [ 0, %label_18 ], [ %op71, %label_21 ]
  %op38 = icmp slt i32 %op101, 2
  br i1 %op38, label %label_21, label %label_22
label_21:                                                ; preds = %label_20
  %op41 = add i32 %op80, %op86
  %op43 = add i32 %op41, %op91
  %op45 = add i32 %op43, %op95
  %op47 = add i32 %op45, %op98
  %op49 = add i32 %op47, %op100
  %op51 = add i32 %op49, %op101
  %op53 = add i32 %op51, %arg0
  %op55 = add i32 %op53, %arg1
  %op57 = getelementptr [10 x [2 x [3 x [4 x [5 x [6 x [2 x i32]]]]]]], [10 x [2 x [3 x [4 x [5 x [6 x [2 x i32]]]]]]]* @arr1, i32 0, i32 %op80
  %op59 = getelementptr [2 x [3 x [4 x [5 x [6 x [2 x i32]]]]]], [2 x [3 x [4 x [5 x [6 x [2 x i32]]]]]]* %op57, i32 0, i32 %op86
  %op61 = getelementptr [3 x [4 x [5 x [6 x [2 x i32]]]]], [3 x [4 x [5 x [6 x [2 x i32]]]]]* %op59, i32 0, i32 %op91
  %op63 = getelementptr [4 x [5 x [6 x [2 x i32]]]], [4 x [5 x [6 x [2 x i32]]]]* %op61, i32 0, i32 %op95
  %op65 = getelementptr [5 x [6 x [2 x i32]]], [5 x [6 x [2 x i32]]]* %op63, i32 0, i32 %op98
  %op67 = getelementptr [6 x [2 x i32]], [6 x [2 x i32]]* %op65, i32 0, i32 %op100
  %op69 = getelementptr [2 x i32], [2 x i32]* %op67, i32 0, i32 %op101
  store i32 %op55, i32* %op69
  %op71 = add i32 %op101, 1
  br label %label_20
label_22:                                                ; preds = %label_20
  %op73 = add i32 %op100, 1
  br label %label_17
}
define void @loop2() {
label_entry:
  br label %label_23
label_ret:                                                ; preds = %label_23
  ret void
label_23:                                                ; preds = %label_entry, %label_28
  %op62 = phi i32 [ 0, %label_entry ], [ %op12, %label_28 ]
  %op8 = icmp slt i32 %op62, 10
  br i1 %op8, label %label_24, label %label_ret
label_24:                                                ; preds = %label_23
  br label %label_26
label_26:                                                ; preds = %label_24, %label_31
  %op68 = phi i32 [ 0, %label_24 ], [ %op16, %label_31 ]
  %op10 = icmp slt i32 %op68, 2
  br i1 %op10, label %label_27, label %label_28
label_27:                                                ; preds = %label_26
  br label %label_29
label_28:                                                ; preds = %label_26
  %op12 = add i32 %op62, 1
  br label %label_23
label_29:                                                ; preds = %label_27, %label_34
  %op73 = phi i32 [ 0, %label_27 ], [ %op20, %label_34 ]
  %op14 = icmp slt i32 %op73, 3
  br i1 %op14, label %label_30, label %label_31
label_30:                                                ; preds = %label_29
  br label %label_32
label_31:                                                ; preds = %label_29
  %op16 = add i32 %op68, 1
  br label %label_26
label_32:                                                ; preds = %label_30, %label_37
  %op77 = phi i32 [ 0, %label_30 ], [ %op24, %label_37 ]
  %op18 = icmp slt i32 %op77, 2
  br i1 %op18, label %label_33, label %label_34
label_33:                                                ; preds = %label_32
  br label %label_35
label_34:                                                ; preds = %label_32
  %op20 = add i32 %op73, 1
  br label %label_29
label_35:                                                ; preds = %label_33, %label_40
  %op80 = phi i32 [ 0, %label_33 ], [ %op28, %label_40 ]
  %op22 = icmp slt i32 %op80, 4
  br i1 %op22, label %label_36, label %label_37
label_36:                                                ; preds = %label_35
  br label %label_38
label_37:                                                ; preds = %label_35
  %op24 = add i32 %op77, 1
  br label %label_32
label_38:                                                ; preds = %label_36, %label_43
  %op82 = phi i32 [ 0, %label_36 ], [ %op55, %label_43 ]
  %op26 = icmp slt i32 %op82, 8
  br i1 %op26, label %label_39, label %label_40
label_39:                                                ; preds = %label_38
  br label %label_41
label_40:                                                ; preds = %label_38
  %op28 = add i32 %op80, 1
  br label %label_35
label_41:                                                ; preds = %label_39, %label_42
  %op83 = phi i32 [ 0, %label_39 ], [ %op53, %label_42 ]
  %op30 = icmp slt i32 %op83, 7
  br i1 %op30, label %label_42, label %label_43
label_42:                                                ; preds = %label_41
  %op33 = add i32 %op62, %op68
  %op35 = add i32 %op33, %op77
  %op37 = add i32 %op35, %op83
  %op39 = getelementptr [10 x [2 x [3 x [2 x [4 x [8 x [7 x i32]]]]]]], [10 x [2 x [3 x [2 x [4 x [8 x [7 x i32]]]]]]]* @arr2, i32 0, i32 %op62
  %op41 = getelementptr [2 x [3 x [2 x [4 x [8 x [7 x i32]]]]]], [2 x [3 x [2 x [4 x [8 x [7 x i32]]]]]]* %op39, i32 0, i32 %op68
  %op43 = getelementptr [3 x [2 x [4 x [8 x [7 x i32]]]]], [3 x [2 x [4 x [8 x [7 x i32]]]]]* %op41, i32 0, i32 %op73
  %op45 = getelementptr [2 x [4 x [8 x [7 x i32]]]], [2 x [4 x [8 x [7 x i32]]]]* %op43, i32 0, i32 %op77
  %op47 = getelementptr [4 x [8 x [7 x i32]]], [4 x [8 x [7 x i32]]]* %op45, i32 0, i32 %op80
  %op49 = getelementptr [8 x [7 x i32]], [8 x [7 x i32]]* %op47, i32 0, i32 %op82
  %op51 = getelementptr [7 x i32], [7 x i32]* %op49, i32 0, i32 %op83
  store i32 %op37, i32* %op51
  %op53 = add i32 %op83, 1
  br label %label_41
label_43:                                                ; preds = %label_41
  %op55 = add i32 %op82, 1
  br label %label_38
}
define i32 @loop3(i32 %arg0, i32 %arg1, i32 %arg2, i32 %arg3, i32 %arg4, i32 %arg5, i32 %arg6) {
label_entry:
  br label %label_44
label_ret:                                                ; preds = %label_46
  ret i32 %op116
label_44:                                                ; preds = %label_entry, %label_78
  %op108 = phi i32 [ 0, %label_entry ], [ %op131, %label_78 ]
  %op115 = phi i32 [ 0, %label_entry ], [ %op30, %label_78 ]
  %op25 = icmp slt i32 %op115, 10
  br i1 %op25, label %label_45, label %label_46
label_45:                                                ; preds = %label_44
  br label %label_47
label_46:                                                ; preds = %label_44, %label_77
  %op116 = phi i32 [ %op108, %label_44 ], [ %op131, %label_77 ]
  br label %label_ret
label_47:                                                ; preds = %label_45, %label_76
  %op124 = phi i32 [ %op108, %label_45 ], [ %op144, %label_76 ]
  %op130 = phi i32 [ 0, %label_45 ], [ %op37, %label_76 ]
  %op28 = icmp slt i32 %op130, 100
  br i1 %op28, label %label_48, label %label_49
label_48:                                                ; preds = %label_47
  br label %label_50
label_49:                                                ; preds = %label_47, %label_75
  %op131 = phi i32 [ %op124, %label_47 ], [ %op144, %label_75 ]
  %op30 = add i32 %op115, 1
  %op33 = icmp sge i32 %op30, %arg0
  br i1 %op33, label %label_77, label %label_78
label_50:                                                ; preds = %label_48, %label_74
  %op138 = phi i32 [ %op124, %label_48 ], [ %op155, %label_74 ]
  %op143 = phi i32 [ 0, %label_48 ], [ %op44, %label_74 ]
  %op35 = icmp slt i32 %op143, 1000
  br i1 %op35, label %label_51, label %label_52
label_51:                                                ; preds = %label_50
  br label %label_53
label_52:                                                ; preds = %label_50, %label_73
  %op144 = phi i32 [ %op138, %label_50 ], [ %op155, %label_73 ]
  %op37 = add i32 %op130, 1
  %op40 = icmp sge i32 %op37, %arg1
  br i1 %op40, label %label_75, label %label_76
label_53:                                                ; preds = %label_51, %label_72
  %op150 = phi i32 [ %op138, %label_51 ], [ %op164, %label_72 ]
  %op154 = phi i32 [ 0, %label_51 ], [ %op51, %label_72 ]
  %op42 = icmp slt i32 %op154, 10000
  br i1 %op42, label %label_54, label %label_55
label_54:                                                ; preds = %label_53
  br label %label_56
label_55:                                                ; preds = %label_53, %label_71
  %op155 = phi i32 [ %op150, %label_53 ], [ %op164, %label_71 ]
  %op44 = add i32 %op143, 1
  %op47 = icmp sge i32 %op44, %arg2
  br i1 %op47, label %label_73, label %label_74
label_56:                                                ; preds = %label_54, %label_70
  %op160 = phi i32 [ %op150, %label_54 ], [ %op171, %label_70 ]
  %op163 = phi i32 [ 0, %label_54 ], [ %op58, %label_70 ]
  %op49 = icmp slt i32 %op163, 100000
  br i1 %op49, label %label_57, label %label_58
label_57:                                                ; preds = %label_56
  br label %label_59
label_58:                                                ; preds = %label_56, %label_69
  %op164 = phi i32 [ %op160, %label_56 ], [ %op171, %label_69 ]
  %op51 = add i32 %op154, 1
  %op54 = icmp sge i32 %op51, %arg3
  br i1 %op54, label %label_71, label %label_72
label_59:                                                ; preds = %label_57, %label_68
  %op168 = phi i32 [ %op160, %label_57 ], [ %op176, %label_68 ]
  %op170 = phi i32 [ 0, %label_57 ], [ %op104, %label_68 ]
  %op56 = icmp slt i32 %op170, 1000000
  br i1 %op56, label %label_60, label %label_61
label_60:                                                ; preds = %label_59
  br label %label_62
label_61:                                                ; preds = %label_59, %label_67
  %op171 = phi i32 [ %op168, %label_59 ], [ %op176, %label_67 ]
  %op58 = add i32 %op163, 1
  %op61 = icmp sge i32 %op58, %arg4
  br i1 %op61, label %label_69, label %label_70
label_62:                                                ; preds = %label_60, %label_66
  %op174 = phi i32 [ %op168, %label_60 ], [ %op97, %label_66 ]
  %op175 = phi i32 [ 0, %label_60 ], [ %op99, %label_66 ]
  %op63 = icmp slt i32 %op175, 10000000
  br i1 %op63, label %label_63, label %label_64
label_63:                                                ; preds = %label_62
  %op65 = srem i32 %op174, 817
  %op67 = getelementptr [10 x [2 x [3 x [4 x [5 x [6 x [2 x i32]]]]]]], [10 x [2 x [3 x [4 x [5 x [6 x [2 x i32]]]]]]]* @arr1, i32 0, i32 %op115
  %op69 = getelementptr [2 x [3 x [4 x [5 x [6 x [2 x i32]]]]]], [2 x [3 x [4 x [5 x [6 x [2 x i32]]]]]]* %op67, i32 0, i32 %op130
  %op71 = getelementptr [3 x [4 x [5 x [6 x [2 x i32]]]]], [3 x [4 x [5 x [6 x [2 x i32]]]]]* %op69, i32 0, i32 %op143
  %op73 = getelementptr [4 x [5 x [6 x [2 x i32]]]], [4 x [5 x [6 x [2 x i32]]]]* %op71, i32 0, i32 %op154
  %op75 = getelementptr [5 x [6 x [2 x i32]]], [5 x [6 x [2 x i32]]]* %op73, i32 0, i32 %op163
  %op77 = getelementptr [6 x [2 x i32]], [6 x [2 x i32]]* %op75, i32 0, i32 %op170
  %op79 = getelementptr [2 x i32], [2 x i32]* %op77, i32 0, i32 %op175
  %op80 = load i32, i32* %op79
  %op81 = add i32 %op65, %op80
  %op83 = getelementptr [10 x [2 x [3 x [2 x [4 x [8 x [7 x i32]]]]]]], [10 x [2 x [3 x [2 x [4 x [8 x [7 x i32]]]]]]]* @arr2, i32 0, i32 %op115
  %op85 = getelementptr [2 x [3 x [2 x [4 x [8 x [7 x i32]]]]]], [2 x [3 x [2 x [4 x [8 x [7 x i32]]]]]]* %op83, i32 0, i32 %op130
  %op87 = getelementptr [3 x [2 x [4 x [8 x [7 x i32]]]]], [3 x [2 x [4 x [8 x [7 x i32]]]]]* %op85, i32 0, i32 %op143
  %op89 = getelementptr [2 x [4 x [8 x [7 x i32]]]], [2 x [4 x [8 x [7 x i32]]]]* %op87, i32 0, i32 %op154
  %op91 = getelementptr [4 x [8 x [7 x i32]]], [4 x [8 x [7 x i32]]]* %op89, i32 0, i32 %op163
  %op93 = getelementptr [8 x [7 x i32]], [8 x [7 x i32]]* %op91, i32 0, i32 %op170
  %op95 = getelementptr [7 x i32], [7 x i32]* %op93, i32 0, i32 %op175
  %op96 = load i32, i32* %op95
  %op97 = add i32 %op81, %op96
  %op99 = add i32 %op175, 1
  %op102 = icmp sge i32 %op99, %arg6
  br i1 %op102, label %label_65, label %label_66
label_64:                                                ; preds = %label_62, %label_65
  %op176 = phi i32 [ %op174, %label_62 ], [ %op97, %label_65 ]
  %op104 = add i32 %op170, 1
  %op107 = icmp sge i32 %op104, %arg5
  br i1 %op107, label %label_67, label %label_68
label_65:                                                ; preds = %label_63
  br label %label_64
label_66:                                                ; preds = %label_63
  br label %label_62
label_67:                                                ; preds = %label_64
  br label %label_61
label_68:                                                ; preds = %label_64
  br label %label_59
label_69:                                                ; preds = %label_61
  br label %label_58
label_70:                                                ; preds = %label_61
  br label %label_56
label_71:                                                ; preds = %label_58
  br label %label_55
label_72:                                                ; preds = %label_58
  br label %label_53
label_73:                                                ; preds = %label_55
  br label %label_52
label_74:                                                ; preds = %label_55
  br label %label_50
label_75:                                                ; preds = %label_52
  br label %label_49
label_76:                                                ; preds = %label_52
  br label %label_47
label_77:                                                ; preds = %label_49
  br label %label_46
label_78:                                                ; preds = %label_49
  br label %label_44
}
define i32 @main() {
label_entry:
  %op2 = call i32 @get_int()
  %op4 = call i32 @get_int()
  %op6 = call i32 @get_int()
  %op8 = call i32 @get_int()
  %op10 = call i32 @get_int()
  %op12 = call i32 @get_int()
  %op14 = call i32 @get_int()
  %op16 = call i32 @get_int()
  %op18 = call i32 @get_int()
  call void @loop1(i32 %op2, i32 %op4)
  call void @loop2()
  %op28 = call i32 @loop3(i32 %op6, i32 %op8, i32 %op10, i32 %op12, i32 %op14, i32 %op16, i32 %op18)
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op28
}
