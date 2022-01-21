@TAPE_LEN = constant i32 65536
@BUFFER_LEN = constant i32 32768
@tape = global [65536 x i32] zeroinitializer
@program = global [32768 x i32] zeroinitializer
@ptr = global i32 0
declare i32 @get_int()

declare i32 @get_char()

declare void @put_char(i32)

define void @read_program() {
label_entry:
  %op2 = call i32 @get_int()
  br label %label_1
label_ret:                                                ; preds = %label_3
  ret void
label_1:                                                ; preds = %label_entry, %label_2
  %op13 = phi i32 [ 0, %label_entry ], [ %op10, %label_2 ]
  %op5 = icmp slt i32 %op13, %op2
  br i1 %op5, label %label_2, label %label_3
label_2:                                                ; preds = %label_1
  %op6 = call i32 @get_char()
  %op8 = getelementptr [32768 x i32], [32768 x i32]* @program, i32 0, i32 %op13
  store i32 %op6, i32* %op8
  %op10 = add i32 %op13, 1
  br label %label_1
label_3:                                                ; preds = %label_1
  %op12 = getelementptr [32768 x i32], [32768 x i32]* @program, i32 0, i32 %op13
  store i32 0, i32* %op12
  br label %label_ret
}
define void @interpret(i32* %arg0) {
label_entry:
  br label %label_4
label_ret:                                                ; preds = %label_4
  ret void
label_4:                                                ; preds = %label_entry, %label_9
  %op72 = phi i32 [ 0, %label_entry ], [ %op21, %label_9 ]
  %op7 = getelementptr i32, i32* %arg0, i32 %op72
  %op8 = load i32, i32* %op7
  %op9 = icmp ne i32 %op8, 0
  br i1 %op9, label %label_5, label %label_ret
label_5:                                                ; preds = %label_4
  %op13 = load i32, i32* %op7
  %op15 = icmp eq i32 %op13, 62
  br i1 %op15, label %label_7, label %label_8
label_7:                                                ; preds = %label_5
  %op16 = load i32, i32* @ptr
  %op17 = add i32 %op16, 1
  store i32 %op17, i32* @ptr
  br label %label_9
label_8:                                                ; preds = %label_5
  %op19 = icmp eq i32 %op13, 60
  br i1 %op19, label %label_10, label %label_11
label_9:                                                ; preds = %label_7, %label_12
  %op75 = phi i32 [ %op78, %label_12 ], [ %op72, %label_7 ]
  %op21 = add i32 %op75, 1
  br label %label_4
label_10:                                                ; preds = %label_8
  %op22 = load i32, i32* @ptr
  %op23 = sub i32 %op22, 1
  store i32 %op23, i32* @ptr
  br label %label_12
label_11:                                                ; preds = %label_8
  %op25 = icmp eq i32 %op13, 43
  br i1 %op25, label %label_13, label %label_14
label_12:                                                ; preds = %label_10, %label_15
  %op78 = phi i32 [ %op81, %label_15 ], [ %op72, %label_10 ]
  br label %label_9
label_13:                                                ; preds = %label_11
  %op26 = load i32, i32* @ptr
  %op27 = getelementptr [65536 x i32], [65536 x i32]* @tape, i32 0, i32 %op26
  %op28 = load i32, i32* %op27
  %op29 = add i32 %op28, 1
  %op30 = load i32, i32* @ptr
  %op31 = getelementptr [65536 x i32], [65536 x i32]* @tape, i32 0, i32 %op30
  store i32 %op29, i32* %op31
  br label %label_15
label_14:                                                ; preds = %label_11
  %op33 = icmp eq i32 %op13, 45
  br i1 %op33, label %label_16, label %label_17
label_15:                                                ; preds = %label_13, %label_18
  %op81 = phi i32 [ %op84, %label_18 ], [ %op72, %label_13 ]
  br label %label_12
label_16:                                                ; preds = %label_14
  %op34 = load i32, i32* @ptr
  %op35 = getelementptr [65536 x i32], [65536 x i32]* @tape, i32 0, i32 %op34
  %op36 = load i32, i32* %op35
  %op37 = sub i32 %op36, 1
  %op38 = load i32, i32* @ptr
  %op39 = getelementptr [65536 x i32], [65536 x i32]* @tape, i32 0, i32 %op38
  store i32 %op37, i32* %op39
  br label %label_18
label_17:                                                ; preds = %label_14
  %op41 = icmp eq i32 %op13, 46
  br i1 %op41, label %label_19, label %label_20
label_18:                                                ; preds = %label_16, %label_21
  %op84 = phi i32 [ %op87, %label_21 ], [ %op72, %label_16 ]
  br label %label_15
label_19:                                                ; preds = %label_17
  %op42 = load i32, i32* @ptr
  %op43 = getelementptr [65536 x i32], [65536 x i32]* @tape, i32 0, i32 %op42
  %op44 = load i32, i32* %op43
  call void @put_char(i32 %op44)
  br label %label_21
label_20:                                                ; preds = %label_17
  %op46 = icmp eq i32 %op13, 44
  br i1 %op46, label %label_22, label %label_23
label_21:                                                ; preds = %label_19, %label_24
  %op87 = phi i32 [ %op90, %label_24 ], [ %op72, %label_19 ]
  br label %label_18
label_22:                                                ; preds = %label_20
  %op47 = call i32 @get_char()
  %op48 = load i32, i32* @ptr
  %op49 = getelementptr [65536 x i32], [65536 x i32]* @tape, i32 0, i32 %op48
  store i32 %op47, i32* %op49
  br label %label_24
label_23:                                                ; preds = %label_20
  %op51 = icmp eq i32 %op13, 93
  br i1 %op51, label %label_27, label %label_26
label_24:                                                ; preds = %label_22, %label_26
  %op90 = phi i32 [ %op93, %label_26 ], [ %op72, %label_22 ]
  br label %label_21
label_25:                                                ; preds = %label_27
  br label %label_28
label_26:                                                ; preds = %label_23, %label_27, %label_30
  %op93 = phi i32 [ %op72, %label_23 ], [ %op72, %label_27 ], [ %op96, %label_30 ]
  br label %label_24
label_27:                                                ; preds = %label_23
  %op52 = load i32, i32* @ptr
  %op53 = getelementptr [65536 x i32], [65536 x i32]* @tape, i32 0, i32 %op52
  %op54 = load i32, i32* %op53
  %op55 = icmp ne i32 %op54, 0
  br i1 %op55, label %label_25, label %label_26
label_28:                                                ; preds = %label_25, %label_33
  %op96 = phi i32 [ %op72, %label_25 ], [ %op59, %label_33 ]
  %op97 = phi i32 [ 1, %label_25 ], [ %op99, %label_33 ]
  %op57 = icmp sgt i32 %op97, 0
  br i1 %op57, label %label_29, label %label_30
label_29:                                                ; preds = %label_28
  %op59 = sub i32 %op96, 1
  %op62 = getelementptr i32, i32* %arg0, i32 %op59
  %op63 = load i32, i32* %op62
  %op65 = icmp eq i32 %op63, 91
  br i1 %op65, label %label_31, label %label_32
label_30:                                                ; preds = %label_28
  br label %label_26
label_31:                                                ; preds = %label_29
  %op67 = sub i32 %op97, 1
  br label %label_33
label_32:                                                ; preds = %label_29
  %op69 = icmp eq i32 %op63, 93
  br i1 %op69, label %label_34, label %label_35
label_33:                                                ; preds = %label_31, %label_35
  %op99 = phi i32 [ %op100, %label_35 ], [ %op67, %label_31 ]
  br label %label_28
label_34:                                                ; preds = %label_32
  %op71 = add i32 %op97, 1
  br label %label_35
label_35:                                                ; preds = %label_32, %label_34
  %op100 = phi i32 [ %op97, %label_32 ], [ %op71, %label_34 ]
  br label %label_33
}
define i32 @main() {
label_entry:
  call void @read_program()
  %op1 = getelementptr [32768 x i32], [32768 x i32]* @program, i32 0, i32 0
  call void @interpret(i32* %op1)
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 0
}
