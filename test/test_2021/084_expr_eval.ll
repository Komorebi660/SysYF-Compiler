@TOKEN_NUM = constant i32 0
@TOKEN_OTHER = constant i32 1
@last_char = global i32 32
@num = global i32 zeroinitializer
@other = global i32 zeroinitializer
@cur_token = global i32 zeroinitializer
declare i32 @get_int()

declare i32 @get_char()

declare void @put_int(i32)

declare void @put_char(i32)

define i32 @next_char() {
label_entry:
  %op1 = call i32 @get_char()
  store i32 %op1, i32* @last_char
  %op2 = load i32, i32* @last_char
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op2
}
define i32 @is_space(i32 %arg0) {
label_entry:
  %op4 = icmp eq i32 %arg0, 32
  br i1 %op4, label %label_1, label %label_4
label_ret:                                                ; preds = %label_1, %label_2
  %op8 = phi i32 [ 0, %label_2 ], [ 1, %label_1 ]
  ret i32 %op8
label_1:                                                ; preds = %label_entry, %label_4
  br label %label_ret
label_2:                                                ; preds = %label_4
  br label %label_ret
label_4:                                                ; preds = %label_entry
  %op7 = icmp eq i32 %arg0, 10
  br i1 %op7, label %label_1, label %label_2
}
define i32 @is_num(i32 %arg0) {
label_entry:
  %op4 = icmp sge i32 %arg0, 48
  br i1 %op4, label %label_8, label %label_6
label_ret:                                                ; preds = %label_5, %label_6
  %op8 = phi i32 [ 0, %label_6 ], [ 1, %label_5 ]
  ret i32 %op8
label_5:                                                ; preds = %label_8
  br label %label_ret
label_6:                                                ; preds = %label_entry, %label_8
  br label %label_ret
label_8:                                                ; preds = %label_entry
  %op7 = icmp sle i32 %arg0, 57
  br i1 %op7, label %label_5, label %label_6
}
define i32 @next_token() {
label_entry:
  br label %label_9
label_ret:                                                ; preds = %label_14
  ret i32 %op14
label_9:                                                ; preds = %label_entry, %label_10
  %op2 = load i32, i32* @last_char
  %op3 = call i32 @is_space(i32 %op2)
  %op4 = icmp ne i32 %op3, 0
  br i1 %op4, label %label_10, label %label_11
label_10:                                                ; preds = %label_9
  %op5 = call i32 @next_char()
  br label %label_9
label_11:                                                ; preds = %label_9
  %op6 = load i32, i32* @last_char
  %op7 = call i32 @is_num(i32 %op6)
  %op8 = icmp ne i32 %op7, 0
  br i1 %op8, label %label_12, label %label_13
label_12:                                                ; preds = %label_11
  %op9 = load i32, i32* @last_char
  %op10 = sub i32 %op9, 48
  store i32 %op10, i32* @num
  br label %label_15
label_13:                                                ; preds = %label_11
  %op11 = load i32, i32* @last_char
  store i32 %op11, i32* @other
  %op12 = call i32 @next_char()
  %op13 = load i32, i32* @TOKEN_OTHER
  store i32 %op13, i32* @cur_token
  br label %label_14
label_14:                                                ; preds = %label_17, %label_13
  %op14 = load i32, i32* @cur_token
  br label %label_ret
label_15:                                                ; preds = %label_12, %label_16
  %op15 = call i32 @next_char()
  %op16 = call i32 @is_num(i32 %op15)
  %op17 = icmp ne i32 %op16, 0
  br i1 %op17, label %label_16, label %label_17
label_16:                                                ; preds = %label_15
  %op18 = load i32, i32* @num
  %op19 = mul i32 %op18, 10
  %op20 = load i32, i32* @last_char
  %op21 = add i32 %op19, %op20
  %op22 = sub i32 %op21, 48
  store i32 %op22, i32* @num
  br label %label_15
label_17:                                                ; preds = %label_15
  %op23 = load i32, i32* @TOKEN_NUM
  store i32 %op23, i32* @cur_token
  br label %label_14
}
define i32 @panic() {
label_entry:
  call void @put_char(i32 112)
  call void @put_char(i32 97)
  call void @put_char(i32 110)
  call void @put_char(i32 105)
  call void @put_char(i32 99)
  call void @put_char(i32 33)
  call void @put_char(i32 10)
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 -1
}
define i32 @get_op_prec(i32 %arg0) {
label_entry:
  %op4 = icmp eq i32 %arg0, 43
  br i1 %op4, label %label_18, label %label_20
label_ret:                                                ; preds = %label_18, %label_21, %label_22
  %op14 = phi i32 [ 0, %label_22 ], [ 20, %label_21 ], [ 10, %label_18 ]
  ret i32 %op14
label_18:                                                ; preds = %label_entry, %label_20
  br label %label_ret
label_19:                                                ; preds = %label_20
  %op7 = icmp eq i32 %arg0, 42
  br i1 %op7, label %label_21, label %label_24
label_20:                                                ; preds = %label_entry
  %op9 = icmp eq i32 %arg0, 45
  br i1 %op9, label %label_18, label %label_19
label_21:                                                ; preds = %label_19, %label_24, %label_23
  br label %label_ret
label_22:                                                ; preds = %label_23
  br label %label_ret
label_23:                                                ; preds = %label_24
  %op11 = icmp eq i32 %arg0, 37
  br i1 %op11, label %label_21, label %label_22
label_24:                                                ; preds = %label_19
  %op13 = icmp eq i32 %arg0, 47
  br i1 %op13, label %label_21, label %label_23
}
define void @stack_push(i32* %arg0, i32 %arg1) {
label_entry:
  %op5 = getelementptr i32, i32* %arg0, i32 0
  %op6 = load i32, i32* %op5
  %op7 = add i32 %op6, 1
  store i32 %op7, i32* %op5
  %op13 = load i32, i32* %op5
  %op15 = getelementptr i32, i32* %arg0, i32 %op13
  store i32 %arg1, i32* %op15
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret void
}
define i32 @stack_pop(i32* %arg0) {
label_entry:
  %op5 = getelementptr i32, i32* %arg0, i32 0
  %op6 = load i32, i32* %op5
  %op8 = getelementptr i32, i32* %arg0, i32 %op6
  %op9 = load i32, i32* %op8
  %op12 = load i32, i32* %op5
  %op13 = sub i32 %op12, 1
  store i32 %op13, i32* %op5
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op9
}
define i32 @stack_peek(i32* %arg0) {
label_entry:
  %op4 = getelementptr i32, i32* %arg0, i32 0
  %op5 = load i32, i32* %op4
  %op7 = getelementptr i32, i32* %arg0, i32 %op5
  %op8 = load i32, i32* %op7
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op8
}
define i32 @stack_size(i32* %arg0) {
label_entry:
  %op4 = getelementptr i32, i32* %arg0, i32 0
  %op5 = load i32, i32* %op4
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op5
}
define i32 @eval_op(i32 %arg0, i32 %arg1, i32 %arg2) {
label_entry:
  %op8 = icmp eq i32 %arg0, 43
  br i1 %op8, label %label_25, label %label_26
label_ret:                                                ; preds = %label_25, %label_27, %label_29, %label_31, %label_33, %label_34
  %op33 = phi i32 [ 0, %label_34 ], [ %op32, %label_33 ], [ %op27, %label_31 ], [ %op22, %label_29 ], [ %op17, %label_27 ], [ %op12, %label_25 ]
  ret i32 %op33
label_25:                                                ; preds = %label_entry
  %op12 = add i32 %arg1, %arg2
  br label %label_ret
label_26:                                                ; preds = %label_entry
  %op14 = icmp eq i32 %arg0, 45
  br i1 %op14, label %label_27, label %label_28
label_27:                                                ; preds = %label_26
  %op17 = sub i32 %arg1, %arg2
  br label %label_ret
label_28:                                                ; preds = %label_26
  %op19 = icmp eq i32 %arg0, 42
  br i1 %op19, label %label_29, label %label_30
label_29:                                                ; preds = %label_28
  %op22 = mul i32 %arg1, %arg2
  br label %label_ret
label_30:                                                ; preds = %label_28
  %op24 = icmp eq i32 %arg0, 47
  br i1 %op24, label %label_31, label %label_32
label_31:                                                ; preds = %label_30
  %op27 = sdiv i32 %arg1, %arg2
  br label %label_ret
label_32:                                                ; preds = %label_30
  %op29 = icmp eq i32 %arg0, 37
  br i1 %op29, label %label_33, label %label_34
label_33:                                                ; preds = %label_32
  %op32 = srem i32 %arg1, %arg2
  br label %label_ret
label_34:                                                ; preds = %label_32
  br label %label_ret
}
define i32 @eval() {
label_entry:
  %op1 = alloca [256 x i32]
  %op2 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 0
  store i32 0, i32* %op2
  %op3 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 1
  store i32 0, i32* %op3
  %op4 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 2
  store i32 0, i32* %op4
  %op5 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 3
  store i32 0, i32* %op5
  %op6 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 4
  store i32 0, i32* %op6
  %op7 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 5
  store i32 0, i32* %op7
  %op8 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 6
  store i32 0, i32* %op8
  %op9 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 7
  store i32 0, i32* %op9
  %op10 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 8
  store i32 0, i32* %op10
  %op11 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 9
  store i32 0, i32* %op11
  %op12 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 10
  store i32 0, i32* %op12
  %op13 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 11
  store i32 0, i32* %op13
  %op14 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 12
  store i32 0, i32* %op14
  %op15 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 13
  store i32 0, i32* %op15
  %op16 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 14
  store i32 0, i32* %op16
  %op17 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 15
  store i32 0, i32* %op17
  %op18 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 16
  store i32 0, i32* %op18
  %op19 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 17
  store i32 0, i32* %op19
  %op20 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 18
  store i32 0, i32* %op20
  %op21 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 19
  store i32 0, i32* %op21
  %op22 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 20
  store i32 0, i32* %op22
  %op23 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 21
  store i32 0, i32* %op23
  %op24 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 22
  store i32 0, i32* %op24
  %op25 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 23
  store i32 0, i32* %op25
  %op26 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 24
  store i32 0, i32* %op26
  %op27 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 25
  store i32 0, i32* %op27
  %op28 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 26
  store i32 0, i32* %op28
  %op29 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 27
  store i32 0, i32* %op29
  %op30 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 28
  store i32 0, i32* %op30
  %op31 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 29
  store i32 0, i32* %op31
  %op32 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 30
  store i32 0, i32* %op32
  %op33 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 31
  store i32 0, i32* %op33
  %op34 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 32
  store i32 0, i32* %op34
  %op35 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 33
  store i32 0, i32* %op35
  %op36 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 34
  store i32 0, i32* %op36
  %op37 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 35
  store i32 0, i32* %op37
  %op38 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 36
  store i32 0, i32* %op38
  %op39 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 37
  store i32 0, i32* %op39
  %op40 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 38
  store i32 0, i32* %op40
  %op41 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 39
  store i32 0, i32* %op41
  %op42 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 40
  store i32 0, i32* %op42
  %op43 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 41
  store i32 0, i32* %op43
  %op44 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 42
  store i32 0, i32* %op44
  %op45 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 43
  store i32 0, i32* %op45
  %op46 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 44
  store i32 0, i32* %op46
  %op47 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 45
  store i32 0, i32* %op47
  %op48 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 46
  store i32 0, i32* %op48
  %op49 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 47
  store i32 0, i32* %op49
  %op50 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 48
  store i32 0, i32* %op50
  %op51 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 49
  store i32 0, i32* %op51
  %op52 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 50
  store i32 0, i32* %op52
  %op53 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 51
  store i32 0, i32* %op53
  %op54 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 52
  store i32 0, i32* %op54
  %op55 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 53
  store i32 0, i32* %op55
  %op56 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 54
  store i32 0, i32* %op56
  %op57 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 55
  store i32 0, i32* %op57
  %op58 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 56
  store i32 0, i32* %op58
  %op59 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 57
  store i32 0, i32* %op59
  %op60 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 58
  store i32 0, i32* %op60
  %op61 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 59
  store i32 0, i32* %op61
  %op62 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 60
  store i32 0, i32* %op62
  %op63 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 61
  store i32 0, i32* %op63
  %op64 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 62
  store i32 0, i32* %op64
  %op65 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 63
  store i32 0, i32* %op65
  %op66 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 64
  store i32 0, i32* %op66
  %op67 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 65
  store i32 0, i32* %op67
  %op68 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 66
  store i32 0, i32* %op68
  %op69 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 67
  store i32 0, i32* %op69
  %op70 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 68
  store i32 0, i32* %op70
  %op71 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 69
  store i32 0, i32* %op71
  %op72 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 70
  store i32 0, i32* %op72
  %op73 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 71
  store i32 0, i32* %op73
  %op74 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 72
  store i32 0, i32* %op74
  %op75 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 73
  store i32 0, i32* %op75
  %op76 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 74
  store i32 0, i32* %op76
  %op77 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 75
  store i32 0, i32* %op77
  %op78 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 76
  store i32 0, i32* %op78
  %op79 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 77
  store i32 0, i32* %op79
  %op80 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 78
  store i32 0, i32* %op80
  %op81 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 79
  store i32 0, i32* %op81
  %op82 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 80
  store i32 0, i32* %op82
  %op83 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 81
  store i32 0, i32* %op83
  %op84 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 82
  store i32 0, i32* %op84
  %op85 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 83
  store i32 0, i32* %op85
  %op86 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 84
  store i32 0, i32* %op86
  %op87 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 85
  store i32 0, i32* %op87
  %op88 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 86
  store i32 0, i32* %op88
  %op89 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 87
  store i32 0, i32* %op89
  %op90 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 88
  store i32 0, i32* %op90
  %op91 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 89
  store i32 0, i32* %op91
  %op92 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 90
  store i32 0, i32* %op92
  %op93 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 91
  store i32 0, i32* %op93
  %op94 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 92
  store i32 0, i32* %op94
  %op95 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 93
  store i32 0, i32* %op95
  %op96 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 94
  store i32 0, i32* %op96
  %op97 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 95
  store i32 0, i32* %op97
  %op98 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 96
  store i32 0, i32* %op98
  %op99 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 97
  store i32 0, i32* %op99
  %op100 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 98
  store i32 0, i32* %op100
  %op101 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 99
  store i32 0, i32* %op101
  %op102 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 100
  store i32 0, i32* %op102
  %op103 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 101
  store i32 0, i32* %op103
  %op104 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 102
  store i32 0, i32* %op104
  %op105 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 103
  store i32 0, i32* %op105
  %op106 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 104
  store i32 0, i32* %op106
  %op107 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 105
  store i32 0, i32* %op107
  %op108 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 106
  store i32 0, i32* %op108
  %op109 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 107
  store i32 0, i32* %op109
  %op110 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 108
  store i32 0, i32* %op110
  %op111 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 109
  store i32 0, i32* %op111
  %op112 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 110
  store i32 0, i32* %op112
  %op113 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 111
  store i32 0, i32* %op113
  %op114 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 112
  store i32 0, i32* %op114
  %op115 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 113
  store i32 0, i32* %op115
  %op116 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 114
  store i32 0, i32* %op116
  %op117 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 115
  store i32 0, i32* %op117
  %op118 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 116
  store i32 0, i32* %op118
  %op119 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 117
  store i32 0, i32* %op119
  %op120 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 118
  store i32 0, i32* %op120
  %op121 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 119
  store i32 0, i32* %op121
  %op122 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 120
  store i32 0, i32* %op122
  %op123 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 121
  store i32 0, i32* %op123
  %op124 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 122
  store i32 0, i32* %op124
  %op125 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 123
  store i32 0, i32* %op125
  %op126 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 124
  store i32 0, i32* %op126
  %op127 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 125
  store i32 0, i32* %op127
  %op128 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 126
  store i32 0, i32* %op128
  %op129 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 127
  store i32 0, i32* %op129
  %op130 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 128
  store i32 0, i32* %op130
  %op131 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 129
  store i32 0, i32* %op131
  %op132 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 130
  store i32 0, i32* %op132
  %op133 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 131
  store i32 0, i32* %op133
  %op134 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 132
  store i32 0, i32* %op134
  %op135 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 133
  store i32 0, i32* %op135
  %op136 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 134
  store i32 0, i32* %op136
  %op137 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 135
  store i32 0, i32* %op137
  %op138 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 136
  store i32 0, i32* %op138
  %op139 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 137
  store i32 0, i32* %op139
  %op140 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 138
  store i32 0, i32* %op140
  %op141 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 139
  store i32 0, i32* %op141
  %op142 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 140
  store i32 0, i32* %op142
  %op143 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 141
  store i32 0, i32* %op143
  %op144 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 142
  store i32 0, i32* %op144
  %op145 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 143
  store i32 0, i32* %op145
  %op146 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 144
  store i32 0, i32* %op146
  %op147 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 145
  store i32 0, i32* %op147
  %op148 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 146
  store i32 0, i32* %op148
  %op149 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 147
  store i32 0, i32* %op149
  %op150 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 148
  store i32 0, i32* %op150
  %op151 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 149
  store i32 0, i32* %op151
  %op152 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 150
  store i32 0, i32* %op152
  %op153 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 151
  store i32 0, i32* %op153
  %op154 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 152
  store i32 0, i32* %op154
  %op155 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 153
  store i32 0, i32* %op155
  %op156 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 154
  store i32 0, i32* %op156
  %op157 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 155
  store i32 0, i32* %op157
  %op158 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 156
  store i32 0, i32* %op158
  %op159 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 157
  store i32 0, i32* %op159
  %op160 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 158
  store i32 0, i32* %op160
  %op161 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 159
  store i32 0, i32* %op161
  %op162 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 160
  store i32 0, i32* %op162
  %op163 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 161
  store i32 0, i32* %op163
  %op164 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 162
  store i32 0, i32* %op164
  %op165 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 163
  store i32 0, i32* %op165
  %op166 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 164
  store i32 0, i32* %op166
  %op167 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 165
  store i32 0, i32* %op167
  %op168 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 166
  store i32 0, i32* %op168
  %op169 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 167
  store i32 0, i32* %op169
  %op170 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 168
  store i32 0, i32* %op170
  %op171 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 169
  store i32 0, i32* %op171
  %op172 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 170
  store i32 0, i32* %op172
  %op173 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 171
  store i32 0, i32* %op173
  %op174 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 172
  store i32 0, i32* %op174
  %op175 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 173
  store i32 0, i32* %op175
  %op176 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 174
  store i32 0, i32* %op176
  %op177 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 175
  store i32 0, i32* %op177
  %op178 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 176
  store i32 0, i32* %op178
  %op179 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 177
  store i32 0, i32* %op179
  %op180 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 178
  store i32 0, i32* %op180
  %op181 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 179
  store i32 0, i32* %op181
  %op182 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 180
  store i32 0, i32* %op182
  %op183 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 181
  store i32 0, i32* %op183
  %op184 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 182
  store i32 0, i32* %op184
  %op185 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 183
  store i32 0, i32* %op185
  %op186 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 184
  store i32 0, i32* %op186
  %op187 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 185
  store i32 0, i32* %op187
  %op188 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 186
  store i32 0, i32* %op188
  %op189 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 187
  store i32 0, i32* %op189
  %op190 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 188
  store i32 0, i32* %op190
  %op191 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 189
  store i32 0, i32* %op191
  %op192 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 190
  store i32 0, i32* %op192
  %op193 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 191
  store i32 0, i32* %op193
  %op194 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 192
  store i32 0, i32* %op194
  %op195 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 193
  store i32 0, i32* %op195
  %op196 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 194
  store i32 0, i32* %op196
  %op197 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 195
  store i32 0, i32* %op197
  %op198 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 196
  store i32 0, i32* %op198
  %op199 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 197
  store i32 0, i32* %op199
  %op200 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 198
  store i32 0, i32* %op200
  %op201 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 199
  store i32 0, i32* %op201
  %op202 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 200
  store i32 0, i32* %op202
  %op203 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 201
  store i32 0, i32* %op203
  %op204 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 202
  store i32 0, i32* %op204
  %op205 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 203
  store i32 0, i32* %op205
  %op206 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 204
  store i32 0, i32* %op206
  %op207 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 205
  store i32 0, i32* %op207
  %op208 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 206
  store i32 0, i32* %op208
  %op209 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 207
  store i32 0, i32* %op209
  %op210 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 208
  store i32 0, i32* %op210
  %op211 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 209
  store i32 0, i32* %op211
  %op212 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 210
  store i32 0, i32* %op212
  %op213 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 211
  store i32 0, i32* %op213
  %op214 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 212
  store i32 0, i32* %op214
  %op215 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 213
  store i32 0, i32* %op215
  %op216 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 214
  store i32 0, i32* %op216
  %op217 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 215
  store i32 0, i32* %op217
  %op218 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 216
  store i32 0, i32* %op218
  %op219 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 217
  store i32 0, i32* %op219
  %op220 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 218
  store i32 0, i32* %op220
  %op221 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 219
  store i32 0, i32* %op221
  %op222 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 220
  store i32 0, i32* %op222
  %op223 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 221
  store i32 0, i32* %op223
  %op224 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 222
  store i32 0, i32* %op224
  %op225 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 223
  store i32 0, i32* %op225
  %op226 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 224
  store i32 0, i32* %op226
  %op227 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 225
  store i32 0, i32* %op227
  %op228 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 226
  store i32 0, i32* %op228
  %op229 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 227
  store i32 0, i32* %op229
  %op230 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 228
  store i32 0, i32* %op230
  %op231 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 229
  store i32 0, i32* %op231
  %op232 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 230
  store i32 0, i32* %op232
  %op233 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 231
  store i32 0, i32* %op233
  %op234 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 232
  store i32 0, i32* %op234
  %op235 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 233
  store i32 0, i32* %op235
  %op236 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 234
  store i32 0, i32* %op236
  %op237 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 235
  store i32 0, i32* %op237
  %op238 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 236
  store i32 0, i32* %op238
  %op239 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 237
  store i32 0, i32* %op239
  %op240 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 238
  store i32 0, i32* %op240
  %op241 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 239
  store i32 0, i32* %op241
  %op242 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 240
  store i32 0, i32* %op242
  %op243 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 241
  store i32 0, i32* %op243
  %op244 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 242
  store i32 0, i32* %op244
  %op245 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 243
  store i32 0, i32* %op245
  %op246 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 244
  store i32 0, i32* %op246
  %op247 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 245
  store i32 0, i32* %op247
  %op248 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 246
  store i32 0, i32* %op248
  %op249 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 247
  store i32 0, i32* %op249
  %op250 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 248
  store i32 0, i32* %op250
  %op251 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 249
  store i32 0, i32* %op251
  %op252 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 250
  store i32 0, i32* %op252
  %op253 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 251
  store i32 0, i32* %op253
  %op254 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 252
  store i32 0, i32* %op254
  %op255 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 253
  store i32 0, i32* %op255
  %op256 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 254
  store i32 0, i32* %op256
  %op257 = getelementptr [256 x i32], [256 x i32]* %op1, i32 0, i32 255
  store i32 0, i32* %op257
  %op258 = alloca [256 x i32]
  %op259 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 0
  store i32 0, i32* %op259
  %op260 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 1
  store i32 0, i32* %op260
  %op261 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 2
  store i32 0, i32* %op261
  %op262 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 3
  store i32 0, i32* %op262
  %op263 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 4
  store i32 0, i32* %op263
  %op264 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 5
  store i32 0, i32* %op264
  %op265 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 6
  store i32 0, i32* %op265
  %op266 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 7
  store i32 0, i32* %op266
  %op267 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 8
  store i32 0, i32* %op267
  %op268 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 9
  store i32 0, i32* %op268
  %op269 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 10
  store i32 0, i32* %op269
  %op270 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 11
  store i32 0, i32* %op270
  %op271 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 12
  store i32 0, i32* %op271
  %op272 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 13
  store i32 0, i32* %op272
  %op273 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 14
  store i32 0, i32* %op273
  %op274 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 15
  store i32 0, i32* %op274
  %op275 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 16
  store i32 0, i32* %op275
  %op276 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 17
  store i32 0, i32* %op276
  %op277 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 18
  store i32 0, i32* %op277
  %op278 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 19
  store i32 0, i32* %op278
  %op279 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 20
  store i32 0, i32* %op279
  %op280 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 21
  store i32 0, i32* %op280
  %op281 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 22
  store i32 0, i32* %op281
  %op282 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 23
  store i32 0, i32* %op282
  %op283 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 24
  store i32 0, i32* %op283
  %op284 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 25
  store i32 0, i32* %op284
  %op285 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 26
  store i32 0, i32* %op285
  %op286 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 27
  store i32 0, i32* %op286
  %op287 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 28
  store i32 0, i32* %op287
  %op288 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 29
  store i32 0, i32* %op288
  %op289 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 30
  store i32 0, i32* %op289
  %op290 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 31
  store i32 0, i32* %op290
  %op291 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 32
  store i32 0, i32* %op291
  %op292 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 33
  store i32 0, i32* %op292
  %op293 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 34
  store i32 0, i32* %op293
  %op294 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 35
  store i32 0, i32* %op294
  %op295 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 36
  store i32 0, i32* %op295
  %op296 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 37
  store i32 0, i32* %op296
  %op297 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 38
  store i32 0, i32* %op297
  %op298 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 39
  store i32 0, i32* %op298
  %op299 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 40
  store i32 0, i32* %op299
  %op300 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 41
  store i32 0, i32* %op300
  %op301 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 42
  store i32 0, i32* %op301
  %op302 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 43
  store i32 0, i32* %op302
  %op303 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 44
  store i32 0, i32* %op303
  %op304 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 45
  store i32 0, i32* %op304
  %op305 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 46
  store i32 0, i32* %op305
  %op306 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 47
  store i32 0, i32* %op306
  %op307 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 48
  store i32 0, i32* %op307
  %op308 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 49
  store i32 0, i32* %op308
  %op309 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 50
  store i32 0, i32* %op309
  %op310 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 51
  store i32 0, i32* %op310
  %op311 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 52
  store i32 0, i32* %op311
  %op312 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 53
  store i32 0, i32* %op312
  %op313 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 54
  store i32 0, i32* %op313
  %op314 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 55
  store i32 0, i32* %op314
  %op315 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 56
  store i32 0, i32* %op315
  %op316 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 57
  store i32 0, i32* %op316
  %op317 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 58
  store i32 0, i32* %op317
  %op318 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 59
  store i32 0, i32* %op318
  %op319 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 60
  store i32 0, i32* %op319
  %op320 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 61
  store i32 0, i32* %op320
  %op321 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 62
  store i32 0, i32* %op321
  %op322 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 63
  store i32 0, i32* %op322
  %op323 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 64
  store i32 0, i32* %op323
  %op324 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 65
  store i32 0, i32* %op324
  %op325 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 66
  store i32 0, i32* %op325
  %op326 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 67
  store i32 0, i32* %op326
  %op327 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 68
  store i32 0, i32* %op327
  %op328 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 69
  store i32 0, i32* %op328
  %op329 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 70
  store i32 0, i32* %op329
  %op330 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 71
  store i32 0, i32* %op330
  %op331 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 72
  store i32 0, i32* %op331
  %op332 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 73
  store i32 0, i32* %op332
  %op333 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 74
  store i32 0, i32* %op333
  %op334 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 75
  store i32 0, i32* %op334
  %op335 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 76
  store i32 0, i32* %op335
  %op336 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 77
  store i32 0, i32* %op336
  %op337 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 78
  store i32 0, i32* %op337
  %op338 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 79
  store i32 0, i32* %op338
  %op339 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 80
  store i32 0, i32* %op339
  %op340 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 81
  store i32 0, i32* %op340
  %op341 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 82
  store i32 0, i32* %op341
  %op342 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 83
  store i32 0, i32* %op342
  %op343 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 84
  store i32 0, i32* %op343
  %op344 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 85
  store i32 0, i32* %op344
  %op345 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 86
  store i32 0, i32* %op345
  %op346 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 87
  store i32 0, i32* %op346
  %op347 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 88
  store i32 0, i32* %op347
  %op348 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 89
  store i32 0, i32* %op348
  %op349 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 90
  store i32 0, i32* %op349
  %op350 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 91
  store i32 0, i32* %op350
  %op351 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 92
  store i32 0, i32* %op351
  %op352 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 93
  store i32 0, i32* %op352
  %op353 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 94
  store i32 0, i32* %op353
  %op354 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 95
  store i32 0, i32* %op354
  %op355 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 96
  store i32 0, i32* %op355
  %op356 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 97
  store i32 0, i32* %op356
  %op357 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 98
  store i32 0, i32* %op357
  %op358 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 99
  store i32 0, i32* %op358
  %op359 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 100
  store i32 0, i32* %op359
  %op360 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 101
  store i32 0, i32* %op360
  %op361 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 102
  store i32 0, i32* %op361
  %op362 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 103
  store i32 0, i32* %op362
  %op363 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 104
  store i32 0, i32* %op363
  %op364 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 105
  store i32 0, i32* %op364
  %op365 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 106
  store i32 0, i32* %op365
  %op366 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 107
  store i32 0, i32* %op366
  %op367 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 108
  store i32 0, i32* %op367
  %op368 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 109
  store i32 0, i32* %op368
  %op369 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 110
  store i32 0, i32* %op369
  %op370 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 111
  store i32 0, i32* %op370
  %op371 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 112
  store i32 0, i32* %op371
  %op372 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 113
  store i32 0, i32* %op372
  %op373 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 114
  store i32 0, i32* %op373
  %op374 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 115
  store i32 0, i32* %op374
  %op375 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 116
  store i32 0, i32* %op375
  %op376 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 117
  store i32 0, i32* %op376
  %op377 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 118
  store i32 0, i32* %op377
  %op378 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 119
  store i32 0, i32* %op378
  %op379 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 120
  store i32 0, i32* %op379
  %op380 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 121
  store i32 0, i32* %op380
  %op381 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 122
  store i32 0, i32* %op381
  %op382 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 123
  store i32 0, i32* %op382
  %op383 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 124
  store i32 0, i32* %op383
  %op384 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 125
  store i32 0, i32* %op384
  %op385 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 126
  store i32 0, i32* %op385
  %op386 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 127
  store i32 0, i32* %op386
  %op387 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 128
  store i32 0, i32* %op387
  %op388 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 129
  store i32 0, i32* %op388
  %op389 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 130
  store i32 0, i32* %op389
  %op390 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 131
  store i32 0, i32* %op390
  %op391 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 132
  store i32 0, i32* %op391
  %op392 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 133
  store i32 0, i32* %op392
  %op393 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 134
  store i32 0, i32* %op393
  %op394 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 135
  store i32 0, i32* %op394
  %op395 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 136
  store i32 0, i32* %op395
  %op396 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 137
  store i32 0, i32* %op396
  %op397 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 138
  store i32 0, i32* %op397
  %op398 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 139
  store i32 0, i32* %op398
  %op399 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 140
  store i32 0, i32* %op399
  %op400 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 141
  store i32 0, i32* %op400
  %op401 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 142
  store i32 0, i32* %op401
  %op402 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 143
  store i32 0, i32* %op402
  %op403 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 144
  store i32 0, i32* %op403
  %op404 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 145
  store i32 0, i32* %op404
  %op405 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 146
  store i32 0, i32* %op405
  %op406 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 147
  store i32 0, i32* %op406
  %op407 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 148
  store i32 0, i32* %op407
  %op408 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 149
  store i32 0, i32* %op408
  %op409 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 150
  store i32 0, i32* %op409
  %op410 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 151
  store i32 0, i32* %op410
  %op411 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 152
  store i32 0, i32* %op411
  %op412 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 153
  store i32 0, i32* %op412
  %op413 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 154
  store i32 0, i32* %op413
  %op414 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 155
  store i32 0, i32* %op414
  %op415 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 156
  store i32 0, i32* %op415
  %op416 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 157
  store i32 0, i32* %op416
  %op417 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 158
  store i32 0, i32* %op417
  %op418 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 159
  store i32 0, i32* %op418
  %op419 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 160
  store i32 0, i32* %op419
  %op420 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 161
  store i32 0, i32* %op420
  %op421 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 162
  store i32 0, i32* %op421
  %op422 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 163
  store i32 0, i32* %op422
  %op423 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 164
  store i32 0, i32* %op423
  %op424 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 165
  store i32 0, i32* %op424
  %op425 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 166
  store i32 0, i32* %op425
  %op426 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 167
  store i32 0, i32* %op426
  %op427 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 168
  store i32 0, i32* %op427
  %op428 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 169
  store i32 0, i32* %op428
  %op429 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 170
  store i32 0, i32* %op429
  %op430 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 171
  store i32 0, i32* %op430
  %op431 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 172
  store i32 0, i32* %op431
  %op432 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 173
  store i32 0, i32* %op432
  %op433 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 174
  store i32 0, i32* %op433
  %op434 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 175
  store i32 0, i32* %op434
  %op435 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 176
  store i32 0, i32* %op435
  %op436 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 177
  store i32 0, i32* %op436
  %op437 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 178
  store i32 0, i32* %op437
  %op438 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 179
  store i32 0, i32* %op438
  %op439 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 180
  store i32 0, i32* %op439
  %op440 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 181
  store i32 0, i32* %op440
  %op441 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 182
  store i32 0, i32* %op441
  %op442 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 183
  store i32 0, i32* %op442
  %op443 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 184
  store i32 0, i32* %op443
  %op444 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 185
  store i32 0, i32* %op444
  %op445 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 186
  store i32 0, i32* %op445
  %op446 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 187
  store i32 0, i32* %op446
  %op447 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 188
  store i32 0, i32* %op447
  %op448 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 189
  store i32 0, i32* %op448
  %op449 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 190
  store i32 0, i32* %op449
  %op450 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 191
  store i32 0, i32* %op450
  %op451 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 192
  store i32 0, i32* %op451
  %op452 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 193
  store i32 0, i32* %op452
  %op453 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 194
  store i32 0, i32* %op453
  %op454 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 195
  store i32 0, i32* %op454
  %op455 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 196
  store i32 0, i32* %op455
  %op456 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 197
  store i32 0, i32* %op456
  %op457 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 198
  store i32 0, i32* %op457
  %op458 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 199
  store i32 0, i32* %op458
  %op459 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 200
  store i32 0, i32* %op459
  %op460 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 201
  store i32 0, i32* %op460
  %op461 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 202
  store i32 0, i32* %op461
  %op462 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 203
  store i32 0, i32* %op462
  %op463 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 204
  store i32 0, i32* %op463
  %op464 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 205
  store i32 0, i32* %op464
  %op465 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 206
  store i32 0, i32* %op465
  %op466 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 207
  store i32 0, i32* %op466
  %op467 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 208
  store i32 0, i32* %op467
  %op468 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 209
  store i32 0, i32* %op468
  %op469 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 210
  store i32 0, i32* %op469
  %op470 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 211
  store i32 0, i32* %op470
  %op471 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 212
  store i32 0, i32* %op471
  %op472 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 213
  store i32 0, i32* %op472
  %op473 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 214
  store i32 0, i32* %op473
  %op474 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 215
  store i32 0, i32* %op474
  %op475 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 216
  store i32 0, i32* %op475
  %op476 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 217
  store i32 0, i32* %op476
  %op477 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 218
  store i32 0, i32* %op477
  %op478 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 219
  store i32 0, i32* %op478
  %op479 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 220
  store i32 0, i32* %op479
  %op480 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 221
  store i32 0, i32* %op480
  %op481 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 222
  store i32 0, i32* %op481
  %op482 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 223
  store i32 0, i32* %op482
  %op483 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 224
  store i32 0, i32* %op483
  %op484 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 225
  store i32 0, i32* %op484
  %op485 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 226
  store i32 0, i32* %op485
  %op486 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 227
  store i32 0, i32* %op486
  %op487 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 228
  store i32 0, i32* %op487
  %op488 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 229
  store i32 0, i32* %op488
  %op489 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 230
  store i32 0, i32* %op489
  %op490 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 231
  store i32 0, i32* %op490
  %op491 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 232
  store i32 0, i32* %op491
  %op492 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 233
  store i32 0, i32* %op492
  %op493 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 234
  store i32 0, i32* %op493
  %op494 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 235
  store i32 0, i32* %op494
  %op495 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 236
  store i32 0, i32* %op495
  %op496 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 237
  store i32 0, i32* %op496
  %op497 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 238
  store i32 0, i32* %op497
  %op498 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 239
  store i32 0, i32* %op498
  %op499 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 240
  store i32 0, i32* %op499
  %op500 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 241
  store i32 0, i32* %op500
  %op501 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 242
  store i32 0, i32* %op501
  %op502 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 243
  store i32 0, i32* %op502
  %op503 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 244
  store i32 0, i32* %op503
  %op504 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 245
  store i32 0, i32* %op504
  %op505 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 246
  store i32 0, i32* %op505
  %op506 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 247
  store i32 0, i32* %op506
  %op507 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 248
  store i32 0, i32* %op507
  %op508 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 249
  store i32 0, i32* %op508
  %op509 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 250
  store i32 0, i32* %op509
  %op510 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 251
  store i32 0, i32* %op510
  %op511 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 252
  store i32 0, i32* %op511
  %op512 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 253
  store i32 0, i32* %op512
  %op513 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 254
  store i32 0, i32* %op513
  %op514 = getelementptr [256 x i32], [256 x i32]* %op258, i32 0, i32 255
  store i32 0, i32* %op514
  %op515 = load i32, i32* @cur_token
  %op516 = load i32, i32* @TOKEN_NUM
  %op517 = icmp ne i32 %op515, %op516
  br i1 %op517, label %label_35, label %label_36
label_ret:                                                ; preds = %label_35, %label_46, %label_50
  %op585 = phi i32 [ %op583, %label_50 ], [ %op561, %label_46 ], [ %op519, %label_35 ]
  ret i32 %op585
label_35:                                                ; preds = %label_entry
  %op519 = call i32 @panic()
  br label %label_ret
label_36:                                                ; preds = %label_entry
  %op521 = load i32, i32* @num
  call void @stack_push(i32* %op2, i32 %op521)
  %op522 = call i32 @next_token()
  br label %label_37
label_37:                                                ; preds = %label_36, %label_47
  %op523 = load i32, i32* @cur_token
  %op524 = load i32, i32* @TOKEN_OTHER
  %op525 = icmp eq i32 %op523, %op524
  br i1 %op525, label %label_38, label %label_39
label_38:                                                ; preds = %label_37
  %op527 = load i32, i32* @other
  %op529 = call i32 @get_op_prec(i32 %op527)
  %op530 = icmp eq i32 %op529, 0
  br i1 %op530, label %label_40, label %label_41
label_39:                                                ; preds = %label_37, %label_40
  %op531 = call i32 @next_token()
  br label %label_48
label_40:                                                ; preds = %label_38
  br label %label_39
label_41:                                                ; preds = %label_38
  %op532 = call i32 @next_token()
  br label %label_42
label_42:                                                ; preds = %label_41, %label_43
  %op534 = call i32 @stack_size(i32* %op259)
  %op535 = icmp ne i32 %op534, 0
  br i1 %op535, label %label_45, label %label_44
label_43:                                                ; preds = %label_45
  %op538 = call i32 @stack_pop(i32* %op259)
  %op541 = call i32 @stack_pop(i32* %op2)
  %op544 = call i32 @stack_pop(i32* %op2)
  %op549 = call i32 @eval_op(i32 %op538, i32 %op544, i32 %op541)
  call void @stack_push(i32* %op2, i32 %op549)
  br label %label_42
label_44:                                                ; preds = %label_42, %label_45
  call void @stack_push(i32* %op259, i32 %op527)
  %op552 = load i32, i32* @cur_token
  %op553 = load i32, i32* @TOKEN_NUM
  %op554 = icmp ne i32 %op552, %op553
  br i1 %op554, label %label_46, label %label_47
label_45:                                                ; preds = %label_42
  %op556 = call i32 @stack_peek(i32* %op259)
  %op557 = call i32 @get_op_prec(i32 %op556)
  %op559 = call i32 @get_op_prec(i32 %op527)
  %op560 = icmp sge i32 %op557, %op559
  br i1 %op560, label %label_43, label %label_44
label_46:                                                ; preds = %label_44
  %op561 = call i32 @panic()
  br label %label_ret
label_47:                                                ; preds = %label_44
  %op563 = load i32, i32* @num
  call void @stack_push(i32* %op2, i32 %op563)
  %op564 = call i32 @next_token()
  br label %label_37
label_48:                                                ; preds = %label_39, %label_49
  %op566 = call i32 @stack_size(i32* %op259)
  %op567 = icmp ne i32 %op566, 0
  br i1 %op567, label %label_49, label %label_50
label_49:                                                ; preds = %label_48
  %op570 = call i32 @stack_pop(i32* %op259)
  %op573 = call i32 @stack_pop(i32* %op2)
  %op576 = call i32 @stack_pop(i32* %op2)
  %op581 = call i32 @eval_op(i32 %op570, i32 %op576, i32 %op573)
  call void @stack_push(i32* %op2, i32 %op581)
  br label %label_48
label_50:                                                ; preds = %label_48
  %op583 = call i32 @stack_peek(i32* %op2)
  br label %label_ret
}
define i32 @main() {
label_entry:
  %op2 = call i32 @get_int()
  %op3 = call i32 @get_char()
  %op4 = call i32 @next_token()
  br label %label_51
label_ret:                                                ; preds = %label_51
  ret i32 0
label_51:                                                ; preds = %label_entry, %label_52
  %op11 = phi i32 [ %op2, %label_entry ], [ %op10, %label_52 ]
  %op7 = icmp ne i32 %op11, 0
  br i1 %op7, label %label_52, label %label_ret
label_52:                                                ; preds = %label_51
  %op8 = call i32 @eval()
  call void @put_int(i32 %op8)
  call void @put_char(i32 10)
  %op10 = sub i32 %op11, 1
  br label %label_51
}
