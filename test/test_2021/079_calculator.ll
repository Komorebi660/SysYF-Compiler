@ints = global [10000 x i32] zeroinitializer
@intt = global i32 zeroinitializer
@chas = global [10000 x i32] zeroinitializer
@chat = global i32 zeroinitializer
@i = global i32 0
@ii = global i32 1
@c = global i32 zeroinitializer
@get = global [10000 x i32] zeroinitializer
@get2 = global [10000 x i32] zeroinitializer
declare i32 @get_char()

declare void @put_int(i32)

define i32 @isdigit(i32 %arg0) {
label_entry:
  %op4 = icmp sge i32 %arg0, 48
  br i1 %op4, label %label_3, label %label_2
label_ret:                                                ; preds = %label_1, %label_2
  %op8 = phi i32 [ 0, %label_2 ], [ 1, %label_1 ]
  ret i32 %op8
label_1:                                                ; preds = %label_3
  br label %label_ret
label_2:                                                ; preds = %label_entry, %label_3
  br label %label_ret
label_3:                                                ; preds = %label_entry
  %op7 = icmp sle i32 %arg0, 57
  br i1 %op7, label %label_1, label %label_2
}
define i32 @power(i32 %arg0, i32 %arg1) {
label_entry:
  br label %label_4
label_ret:                                                ; preds = %label_4
  ret i32 %op15
label_4:                                                ; preds = %label_entry, %label_5
  %op15 = phi i32 [ 1, %label_entry ], [ %op11, %label_5 ]
  %op16 = phi i32 [ %arg1, %label_entry ], [ %op13, %label_5 ]
  %op8 = icmp ne i32 %op16, 0
  br i1 %op8, label %label_5, label %label_ret
label_5:                                                ; preds = %label_4
  %op11 = mul i32 %op15, %arg0
  %op13 = sub i32 %op16, 1
  br label %label_4
}
define i32 @getstr(i32* %arg0) {
label_entry:
  %op4 = call i32 @get_char()
  br label %label_7
label_ret:                                                ; preds = %label_9
  ret i32 %op19
label_7:                                                ; preds = %label_entry, %label_8
  %op19 = phi i32 [ 0, %label_entry ], [ %op14, %label_8 ]
  %op20 = phi i32 [ %op4, %label_entry ], [ %op15, %label_8 ]
  %op8 = icmp ne i32 %op20, 13
  br i1 %op8, label %label_10, label %label_9
label_8:                                                ; preds = %label_10
  %op12 = getelementptr i32, i32* %arg0, i32 %op19
  store i32 %op20, i32* %op12
  %op14 = add i32 %op19, 1
  %op15 = call i32 @get_char()
  br label %label_7
label_9:                                                ; preds = %label_7, %label_10
  br label %label_ret
label_10:                                                ; preds = %label_7
  %op18 = icmp ne i32 %op20, 10
  br i1 %op18, label %label_8, label %label_9
}
define void @intpush(i32 %arg0) {
label_entry:
  %op2 = load i32, i32* @intt
  %op3 = add i32 %op2, 1
  store i32 %op3, i32* @intt
  %op5 = load i32, i32* @intt
  %op6 = getelementptr [10000 x i32], [10000 x i32]* @ints, i32 0, i32 %op5
  store i32 %arg0, i32* %op6
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret void
}
define void @chapush(i32 %arg0) {
label_entry:
  %op2 = load i32, i32* @chat
  %op3 = add i32 %op2, 1
  store i32 %op3, i32* @chat
  %op5 = load i32, i32* @chat
  %op6 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %op5
  store i32 %arg0, i32* %op6
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret void
}
define i32 @intpop() {
label_entry:
  %op1 = load i32, i32* @intt
  %op2 = sub i32 %op1, 1
  store i32 %op2, i32* @intt
  %op3 = load i32, i32* @intt
  %op4 = add i32 %op3, 1
  %op5 = getelementptr [10000 x i32], [10000 x i32]* @ints, i32 0, i32 %op4
  %op6 = load i32, i32* %op5
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op6
}
define i32 @chapop() {
label_entry:
  %op1 = load i32, i32* @chat
  %op2 = sub i32 %op1, 1
  store i32 %op2, i32* @chat
  %op3 = load i32, i32* @chat
  %op4 = add i32 %op3, 1
  %op5 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %op4
  %op6 = load i32, i32* %op5
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op6
}
define void @intadd(i32 %arg0) {
label_entry:
  %op2 = load i32, i32* @intt
  %op3 = getelementptr [10000 x i32], [10000 x i32]* @ints, i32 0, i32 %op2
  %op4 = load i32, i32* %op3
  %op5 = mul i32 %op4, 10
  %op6 = load i32, i32* @intt
  %op7 = getelementptr [10000 x i32], [10000 x i32]* @ints, i32 0, i32 %op6
  store i32 %op5, i32* %op7
  %op8 = load i32, i32* @intt
  %op9 = getelementptr [10000 x i32], [10000 x i32]* @ints, i32 0, i32 %op8
  %op10 = load i32, i32* %op9
  %op12 = add i32 %op10, %arg0
  %op13 = load i32, i32* @intt
  %op14 = getelementptr [10000 x i32], [10000 x i32]* @ints, i32 0, i32 %op13
  store i32 %op12, i32* %op14
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret void
}
define i32 @find() {
label_entry:
  %op1 = call i32 @chapop()
  store i32 %op1, i32* @c
  %op2 = load i32, i32* @ii
  %op3 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %op2
  store i32 32, i32* %op3
  %op4 = load i32, i32* @c
  %op5 = load i32, i32* @ii
  %op6 = add i32 %op5, 1
  %op7 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %op6
  store i32 %op4, i32* %op7
  %op8 = load i32, i32* @ii
  %op9 = add i32 %op8, 2
  store i32 %op9, i32* @ii
  %op10 = load i32, i32* @chat
  %op11 = icmp eq i32 %op10, 0
  br i1 %op11, label %label_11, label %label_12
label_ret:                                                ; preds = %label_11, %label_12
  %op13 = phi i32 [ 1, %label_12 ], [ 0, %label_11 ]
  ret i32 %op13
label_11:                                                ; preds = %label_entry
  br label %label_ret
label_12:                                                ; preds = %label_entry
  br label %label_ret
}
define i32 @main() {
label_entry:
  store i32 0, i32* @intt
  store i32 0, i32* @chat
  %op2 = getelementptr [10000 x i32], [10000 x i32]* @get, i32 0, i32 0
  %op3 = call i32 @getstr(i32* %op2)
  br label %label_13
label_ret:                                                ; preds = %label_87
  ret i32 0
label_13:                                                ; preds = %label_entry, %label_18
  %op5 = load i32, i32* @i
  %op7 = icmp slt i32 %op5, %op3
  br i1 %op7, label %label_14, label %label_15
label_14:                                                ; preds = %label_13
  %op8 = load i32, i32* @i
  %op9 = getelementptr [10000 x i32], [10000 x i32]* @get, i32 0, i32 %op8
  %op10 = load i32, i32* %op9
  %op11 = call i32 @isdigit(i32 %op10)
  %op12 = icmp eq i32 %op11, 1
  br i1 %op12, label %label_16, label %label_17
label_15:                                                ; preds = %label_13
  br label %label_82
label_16:                                                ; preds = %label_14
  %op13 = load i32, i32* @i
  %op14 = getelementptr [10000 x i32], [10000 x i32]* @get, i32 0, i32 %op13
  %op15 = load i32, i32* %op14
  %op16 = load i32, i32* @ii
  %op17 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %op16
  store i32 %op15, i32* %op17
  %op18 = load i32, i32* @ii
  %op19 = add i32 %op18, 1
  store i32 %op19, i32* @ii
  br label %label_18
label_17:                                                ; preds = %label_14
  %op20 = load i32, i32* @i
  %op21 = getelementptr [10000 x i32], [10000 x i32]* @get, i32 0, i32 %op20
  %op22 = load i32, i32* %op21
  %op23 = icmp eq i32 %op22, 40
  br i1 %op23, label %label_19, label %label_20
label_18:                                                ; preds = %label_16, %label_73
  %op24 = load i32, i32* @i
  %op25 = add i32 %op24, 1
  store i32 %op25, i32* @i
  br label %label_13
label_19:                                                ; preds = %label_17
  call void @chapush(i32 40)
  br label %label_20
label_20:                                                ; preds = %label_17, %label_19
  %op26 = load i32, i32* @i
  %op27 = getelementptr [10000 x i32], [10000 x i32]* @get, i32 0, i32 %op26
  %op28 = load i32, i32* %op27
  %op29 = icmp eq i32 %op28, 94
  br i1 %op29, label %label_21, label %label_22
label_21:                                                ; preds = %label_20
  call void @chapush(i32 94)
  br label %label_22
label_22:                                                ; preds = %label_20, %label_21
  %op30 = load i32, i32* @i
  %op31 = getelementptr [10000 x i32], [10000 x i32]* @get, i32 0, i32 %op30
  %op32 = load i32, i32* %op31
  %op33 = icmp eq i32 %op32, 41
  br i1 %op33, label %label_23, label %label_24
label_23:                                                ; preds = %label_22
  %op34 = call i32 @chapop()
  store i32 %op34, i32* @c
  br label %label_25
label_24:                                                ; preds = %label_22, %label_27
  %op35 = load i32, i32* @i
  %op36 = getelementptr [10000 x i32], [10000 x i32]* @get, i32 0, i32 %op35
  %op37 = load i32, i32* %op36
  %op38 = icmp eq i32 %op37, 43
  br i1 %op38, label %label_28, label %label_29
label_25:                                                ; preds = %label_23, %label_26
  %op39 = load i32, i32* @c
  %op40 = icmp ne i32 %op39, 40
  br i1 %op40, label %label_26, label %label_27
label_26:                                                ; preds = %label_25
  %op41 = load i32, i32* @ii
  %op42 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %op41
  store i32 32, i32* %op42
  %op43 = load i32, i32* @c
  %op44 = load i32, i32* @ii
  %op45 = add i32 %op44, 1
  %op46 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %op45
  store i32 %op43, i32* %op46
  %op47 = load i32, i32* @ii
  %op48 = add i32 %op47, 2
  store i32 %op48, i32* @ii
  %op49 = call i32 @chapop()
  store i32 %op49, i32* @c
  br label %label_25
label_27:                                                ; preds = %label_25
  br label %label_24
label_28:                                                ; preds = %label_24
  br label %label_30
label_29:                                                ; preds = %label_24, %label_32
  %op50 = load i32, i32* @i
  %op51 = getelementptr [10000 x i32], [10000 x i32]* @get, i32 0, i32 %op50
  %op52 = load i32, i32* %op51
  %op53 = icmp eq i32 %op52, 45
  br i1 %op53, label %label_40, label %label_41
label_30:                                                ; preds = %label_28, %label_39
  %op54 = load i32, i32* @chat
  %op55 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %op54
  %op56 = load i32, i32* %op55
  %op57 = icmp eq i32 %op56, 43
  br i1 %op57, label %label_31, label %label_37
label_31:                                                ; preds = %label_30, %label_37, %label_36, %label_35, %label_34, %label_33
  %op58 = call i32 @find()
  %op59 = icmp eq i32 %op58, 0
  br i1 %op59, label %label_38, label %label_39
label_32:                                                ; preds = %label_33, %label_38
  call void @chapush(i32 43)
  br label %label_29
label_33:                                                ; preds = %label_34
  %op60 = load i32, i32* @chat
  %op61 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %op60
  %op62 = load i32, i32* %op61
  %op63 = icmp eq i32 %op62, 94
  br i1 %op63, label %label_31, label %label_32
label_34:                                                ; preds = %label_35
  %op64 = load i32, i32* @chat
  %op65 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %op64
  %op66 = load i32, i32* %op65
  %op67 = icmp eq i32 %op66, 37
  br i1 %op67, label %label_31, label %label_33
label_35:                                                ; preds = %label_36
  %op68 = load i32, i32* @chat
  %op69 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %op68
  %op70 = load i32, i32* %op69
  %op71 = icmp eq i32 %op70, 47
  br i1 %op71, label %label_31, label %label_34
label_36:                                                ; preds = %label_37
  %op72 = load i32, i32* @chat
  %op73 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %op72
  %op74 = load i32, i32* %op73
  %op75 = icmp eq i32 %op74, 42
  br i1 %op75, label %label_31, label %label_35
label_37:                                                ; preds = %label_30
  %op76 = load i32, i32* @chat
  %op77 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %op76
  %op78 = load i32, i32* %op77
  %op79 = icmp eq i32 %op78, 45
  br i1 %op79, label %label_31, label %label_36
label_38:                                                ; preds = %label_31
  br label %label_32
label_39:                                                ; preds = %label_31
  br label %label_30
label_40:                                                ; preds = %label_29
  br label %label_42
label_41:                                                ; preds = %label_29, %label_44
  %op80 = load i32, i32* @i
  %op81 = getelementptr [10000 x i32], [10000 x i32]* @get, i32 0, i32 %op80
  %op82 = load i32, i32* %op81
  %op83 = icmp eq i32 %op82, 42
  br i1 %op83, label %label_52, label %label_53
label_42:                                                ; preds = %label_40, %label_51
  %op84 = load i32, i32* @chat
  %op85 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %op84
  %op86 = load i32, i32* %op85
  %op87 = icmp eq i32 %op86, 43
  br i1 %op87, label %label_43, label %label_49
label_43:                                                ; preds = %label_42, %label_49, %label_48, %label_47, %label_46, %label_45
  %op88 = call i32 @find()
  %op89 = icmp eq i32 %op88, 0
  br i1 %op89, label %label_50, label %label_51
label_44:                                                ; preds = %label_45, %label_50
  call void @chapush(i32 45)
  br label %label_41
label_45:                                                ; preds = %label_46
  %op90 = load i32, i32* @chat
  %op91 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %op90
  %op92 = load i32, i32* %op91
  %op93 = icmp eq i32 %op92, 94
  br i1 %op93, label %label_43, label %label_44
label_46:                                                ; preds = %label_47
  %op94 = load i32, i32* @chat
  %op95 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %op94
  %op96 = load i32, i32* %op95
  %op97 = icmp eq i32 %op96, 37
  br i1 %op97, label %label_43, label %label_45
label_47:                                                ; preds = %label_48
  %op98 = load i32, i32* @chat
  %op99 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %op98
  %op100 = load i32, i32* %op99
  %op101 = icmp eq i32 %op100, 47
  br i1 %op101, label %label_43, label %label_46
label_48:                                                ; preds = %label_49
  %op102 = load i32, i32* @chat
  %op103 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %op102
  %op104 = load i32, i32* %op103
  %op105 = icmp eq i32 %op104, 42
  br i1 %op105, label %label_43, label %label_47
label_49:                                                ; preds = %label_42
  %op106 = load i32, i32* @chat
  %op107 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %op106
  %op108 = load i32, i32* %op107
  %op109 = icmp eq i32 %op108, 45
  br i1 %op109, label %label_43, label %label_48
label_50:                                                ; preds = %label_43
  br label %label_44
label_51:                                                ; preds = %label_43
  br label %label_42
label_52:                                                ; preds = %label_41
  br label %label_54
label_53:                                                ; preds = %label_41, %label_56
  %op110 = load i32, i32* @i
  %op111 = getelementptr [10000 x i32], [10000 x i32]* @get, i32 0, i32 %op110
  %op112 = load i32, i32* %op111
  %op113 = icmp eq i32 %op112, 47
  br i1 %op113, label %label_62, label %label_63
label_54:                                                ; preds = %label_52, %label_61
  %op114 = load i32, i32* @chat
  %op115 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %op114
  %op116 = load i32, i32* %op115
  %op117 = icmp eq i32 %op116, 42
  br i1 %op117, label %label_55, label %label_59
label_55:                                                ; preds = %label_54, %label_59, %label_58, %label_57
  %op118 = call i32 @find()
  %op119 = icmp eq i32 %op118, 0
  br i1 %op119, label %label_60, label %label_61
label_56:                                                ; preds = %label_57, %label_60
  call void @chapush(i32 42)
  br label %label_53
label_57:                                                ; preds = %label_58
  %op120 = load i32, i32* @chat
  %op121 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %op120
  %op122 = load i32, i32* %op121
  %op123 = icmp eq i32 %op122, 94
  br i1 %op123, label %label_55, label %label_56
label_58:                                                ; preds = %label_59
  %op124 = load i32, i32* @chat
  %op125 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %op124
  %op126 = load i32, i32* %op125
  %op127 = icmp eq i32 %op126, 37
  br i1 %op127, label %label_55, label %label_57
label_59:                                                ; preds = %label_54
  %op128 = load i32, i32* @chat
  %op129 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %op128
  %op130 = load i32, i32* %op129
  %op131 = icmp eq i32 %op130, 47
  br i1 %op131, label %label_55, label %label_58
label_60:                                                ; preds = %label_55
  br label %label_56
label_61:                                                ; preds = %label_55
  br label %label_54
label_62:                                                ; preds = %label_53
  br label %label_64
label_63:                                                ; preds = %label_53, %label_66
  %op132 = load i32, i32* @i
  %op133 = getelementptr [10000 x i32], [10000 x i32]* @get, i32 0, i32 %op132
  %op134 = load i32, i32* %op133
  %op135 = icmp eq i32 %op134, 37
  br i1 %op135, label %label_72, label %label_73
label_64:                                                ; preds = %label_62, %label_71
  %op136 = load i32, i32* @chat
  %op137 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %op136
  %op138 = load i32, i32* %op137
  %op139 = icmp eq i32 %op138, 42
  br i1 %op139, label %label_65, label %label_69
label_65:                                                ; preds = %label_64, %label_69, %label_68, %label_67
  %op140 = call i32 @find()
  %op141 = icmp eq i32 %op140, 0
  br i1 %op141, label %label_70, label %label_71
label_66:                                                ; preds = %label_67, %label_70
  call void @chapush(i32 47)
  br label %label_63
label_67:                                                ; preds = %label_68
  %op142 = load i32, i32* @chat
  %op143 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %op142
  %op144 = load i32, i32* %op143
  %op145 = icmp eq i32 %op144, 94
  br i1 %op145, label %label_65, label %label_66
label_68:                                                ; preds = %label_69
  %op146 = load i32, i32* @chat
  %op147 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %op146
  %op148 = load i32, i32* %op147
  %op149 = icmp eq i32 %op148, 37
  br i1 %op149, label %label_65, label %label_67
label_69:                                                ; preds = %label_64
  %op150 = load i32, i32* @chat
  %op151 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %op150
  %op152 = load i32, i32* %op151
  %op153 = icmp eq i32 %op152, 47
  br i1 %op153, label %label_65, label %label_68
label_70:                                                ; preds = %label_65
  br label %label_66
label_71:                                                ; preds = %label_65
  br label %label_64
label_72:                                                ; preds = %label_63
  br label %label_74
label_73:                                                ; preds = %label_63, %label_76
  %op154 = load i32, i32* @ii
  %op155 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %op154
  store i32 32, i32* %op155
  %op156 = load i32, i32* @ii
  %op157 = add i32 %op156, 1
  store i32 %op157, i32* @ii
  br label %label_18
label_74:                                                ; preds = %label_72, %label_81
  %op158 = load i32, i32* @chat
  %op159 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %op158
  %op160 = load i32, i32* %op159
  %op161 = icmp eq i32 %op160, 42
  br i1 %op161, label %label_75, label %label_79
label_75:                                                ; preds = %label_74, %label_79, %label_78, %label_77
  %op162 = call i32 @find()
  %op163 = icmp eq i32 %op162, 0
  br i1 %op163, label %label_80, label %label_81
label_76:                                                ; preds = %label_77, %label_80
  call void @chapush(i32 37)
  br label %label_73
label_77:                                                ; preds = %label_78
  %op164 = load i32, i32* @chat
  %op165 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %op164
  %op166 = load i32, i32* %op165
  %op167 = icmp eq i32 %op166, 94
  br i1 %op167, label %label_75, label %label_76
label_78:                                                ; preds = %label_79
  %op168 = load i32, i32* @chat
  %op169 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %op168
  %op170 = load i32, i32* %op169
  %op171 = icmp eq i32 %op170, 37
  br i1 %op171, label %label_75, label %label_77
label_79:                                                ; preds = %label_74
  %op172 = load i32, i32* @chat
  %op173 = getelementptr [10000 x i32], [10000 x i32]* @chas, i32 0, i32 %op172
  %op174 = load i32, i32* %op173
  %op175 = icmp eq i32 %op174, 47
  br i1 %op175, label %label_75, label %label_78
label_80:                                                ; preds = %label_75
  br label %label_76
label_81:                                                ; preds = %label_75
  br label %label_74
label_82:                                                ; preds = %label_15, %label_83
  %op176 = load i32, i32* @chat
  %op177 = icmp sgt i32 %op176, 0
  br i1 %op177, label %label_83, label %label_84
label_83:                                                ; preds = %label_82
  %op179 = call i32 @chapop()
  %op180 = load i32, i32* @ii
  %op181 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %op180
  store i32 32, i32* %op181
  %op183 = load i32, i32* @ii
  %op184 = add i32 %op183, 1
  %op185 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %op184
  store i32 %op179, i32* %op185
  %op186 = load i32, i32* @ii
  %op187 = add i32 %op186, 2
  store i32 %op187, i32* @ii
  br label %label_82
label_84:                                                ; preds = %label_82
  %op188 = load i32, i32* @ii
  %op189 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %op188
  store i32 64, i32* %op189
  store i32 1, i32* @i
  br label %label_85
label_85:                                                ; preds = %label_84, %label_90
  %op296 = phi i32 [ %op299, %label_90 ], [ undef, %label_84 ]
  %op190 = load i32, i32* @i
  %op191 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %op190
  %op192 = load i32, i32* %op191
  %op193 = icmp ne i32 %op192, 64
  br i1 %op193, label %label_86, label %label_87
label_86:                                                ; preds = %label_85
  %op194 = load i32, i32* @i
  %op195 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %op194
  %op196 = load i32, i32* %op195
  %op197 = icmp eq i32 %op196, 43
  br i1 %op197, label %label_88, label %label_95
label_87:                                                ; preds = %label_85
  %op198 = getelementptr [10000 x i32], [10000 x i32]* @ints, i32 0, i32 1
  %op199 = load i32, i32* %op198
  call void @put_int(i32 %op199)
  br label %label_ret
label_88:                                                ; preds = %label_86, %label_95, %label_94, %label_93, %label_92, %label_91
  %op201 = call i32 @intpop()
  %op203 = call i32 @intpop()
  %op205 = load i32, i32* @i
  %op206 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %op205
  %op207 = load i32, i32* %op206
  %op208 = icmp eq i32 %op207, 43
  br i1 %op208, label %label_96, label %label_97
label_89:                                                ; preds = %label_91
  %op209 = load i32, i32* @i
  %op210 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %op209
  %op211 = load i32, i32* %op210
  %op212 = icmp ne i32 %op211, 32
  br i1 %op212, label %label_108, label %label_109
label_90:                                                ; preds = %label_107, %label_109
  %op299 = phi i32 [ %op296, %label_109 ], [ %op307, %label_107 ]
  %op213 = load i32, i32* @i
  %op214 = add i32 %op213, 1
  store i32 %op214, i32* @i
  br label %label_85
label_91:                                                ; preds = %label_92
  %op215 = load i32, i32* @i
  %op216 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %op215
  %op217 = load i32, i32* %op216
  %op218 = icmp eq i32 %op217, 94
  br i1 %op218, label %label_88, label %label_89
label_92:                                                ; preds = %label_93
  %op219 = load i32, i32* @i
  %op220 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %op219
  %op221 = load i32, i32* %op220
  %op222 = icmp eq i32 %op221, 37
  br i1 %op222, label %label_88, label %label_91
label_93:                                                ; preds = %label_94
  %op223 = load i32, i32* @i
  %op224 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %op223
  %op225 = load i32, i32* %op224
  %op226 = icmp eq i32 %op225, 47
  br i1 %op226, label %label_88, label %label_92
label_94:                                                ; preds = %label_95
  %op227 = load i32, i32* @i
  %op228 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %op227
  %op229 = load i32, i32* %op228
  %op230 = icmp eq i32 %op229, 42
  br i1 %op230, label %label_88, label %label_93
label_95:                                                ; preds = %label_86
  %op231 = load i32, i32* @i
  %op232 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %op231
  %op233 = load i32, i32* %op232
  %op234 = icmp eq i32 %op233, 45
  br i1 %op234, label %label_88, label %label_94
label_96:                                                ; preds = %label_88
  %op237 = add i32 %op201, %op203
  br label %label_97
label_97:                                                ; preds = %label_88, %label_96
  %op302 = phi i32 [ %op296, %label_88 ], [ %op237, %label_96 ]
  %op238 = load i32, i32* @i
  %op239 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %op238
  %op240 = load i32, i32* %op239
  %op241 = icmp eq i32 %op240, 45
  br i1 %op241, label %label_98, label %label_99
label_98:                                                ; preds = %label_97
  %op244 = sub i32 %op203, %op201
  br label %label_99
label_99:                                                ; preds = %label_97, %label_98
  %op303 = phi i32 [ %op302, %label_97 ], [ %op244, %label_98 ]
  %op245 = load i32, i32* @i
  %op246 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %op245
  %op247 = load i32, i32* %op246
  %op248 = icmp eq i32 %op247, 42
  br i1 %op248, label %label_100, label %label_101
label_100:                                                ; preds = %label_99
  %op251 = mul i32 %op201, %op203
  br label %label_101
label_101:                                                ; preds = %label_99, %label_100
  %op304 = phi i32 [ %op303, %label_99 ], [ %op251, %label_100 ]
  %op252 = load i32, i32* @i
  %op253 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %op252
  %op254 = load i32, i32* %op253
  %op255 = icmp eq i32 %op254, 47
  br i1 %op255, label %label_102, label %label_103
label_102:                                                ; preds = %label_101
  %op258 = sdiv i32 %op203, %op201
  br label %label_103
label_103:                                                ; preds = %label_101, %label_102
  %op305 = phi i32 [ %op304, %label_101 ], [ %op258, %label_102 ]
  %op259 = load i32, i32* @i
  %op260 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %op259
  %op261 = load i32, i32* %op260
  %op262 = icmp eq i32 %op261, 37
  br i1 %op262, label %label_104, label %label_105
label_104:                                                ; preds = %label_103
  %op265 = srem i32 %op203, %op201
  br label %label_105
label_105:                                                ; preds = %label_103, %label_104
  %op306 = phi i32 [ %op305, %label_103 ], [ %op265, %label_104 ]
  %op266 = load i32, i32* @i
  %op267 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %op266
  %op268 = load i32, i32* %op267
  %op269 = icmp eq i32 %op268, 94
  br i1 %op269, label %label_106, label %label_107
label_106:                                                ; preds = %label_105
  %op272 = call i32 @power(i32 %op203, i32 %op201)
  br label %label_107
label_107:                                                ; preds = %label_105, %label_106
  %op307 = phi i32 [ %op306, %label_105 ], [ %op272, %label_106 ]
  call void @intpush(i32 %op307)
  br label %label_90
label_108:                                                ; preds = %label_89
  %op274 = load i32, i32* @i
  %op275 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %op274
  %op276 = load i32, i32* %op275
  %op277 = sub i32 %op276, 48
  call void @intpush(i32 %op277)
  store i32 1, i32* @ii
  br label %label_110
label_109:                                                ; preds = %label_89, %label_112
  br label %label_90
label_110:                                                ; preds = %label_108, %label_111
  %op278 = load i32, i32* @i
  %op279 = load i32, i32* @ii
  %op280 = add i32 %op278, %op279
  %op281 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %op280
  %op282 = load i32, i32* %op281
  %op283 = icmp ne i32 %op282, 32
  br i1 %op283, label %label_111, label %label_112
label_111:                                                ; preds = %label_110
  %op284 = load i32, i32* @i
  %op285 = load i32, i32* @ii
  %op286 = add i32 %op284, %op285
  %op287 = getelementptr [10000 x i32], [10000 x i32]* @get2, i32 0, i32 %op286
  %op288 = load i32, i32* %op287
  %op289 = sub i32 %op288, 48
  call void @intadd(i32 %op289)
  %op290 = load i32, i32* @ii
  %op291 = add i32 %op290, 1
  store i32 %op291, i32* @ii
  br label %label_110
label_112:                                                ; preds = %label_110
  %op292 = load i32, i32* @i
  %op293 = load i32, i32* @ii
  %op294 = add i32 %op292, %op293
  %op295 = sub i32 %op294, 1
  store i32 %op295, i32* @i
  br label %label_109
}
