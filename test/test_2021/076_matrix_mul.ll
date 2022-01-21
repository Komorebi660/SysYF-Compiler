@M = global i32 zeroinitializer
@L = global i32 zeroinitializer
@N = global i32 zeroinitializer
declare void @put_int(i32)

declare void @put_char(i32)

define i32 @mul(i32* %arg0, i32* %arg1, i32* %arg2, i32* %arg3, i32* %arg4, i32* %arg5, i32* %arg6, i32* %arg7, i32* %arg8) {
label_entry:
  %op21 = getelementptr i32, i32* %arg0, i32 0
  %op22 = load i32, i32* %op21
  %op24 = getelementptr i32, i32* %arg3, i32 0
  %op25 = load i32, i32* %op24
  %op26 = mul i32 %op22, %op25
  %op28 = getelementptr i32, i32* %arg0, i32 1
  %op29 = load i32, i32* %op28
  %op31 = getelementptr i32, i32* %arg4, i32 0
  %op32 = load i32, i32* %op31
  %op33 = mul i32 %op29, %op32
  %op34 = add i32 %op26, %op33
  %op36 = getelementptr i32, i32* %arg0, i32 2
  %op37 = load i32, i32* %op36
  %op39 = getelementptr i32, i32* %arg5, i32 0
  %op40 = load i32, i32* %op39
  %op41 = mul i32 %op37, %op40
  %op42 = add i32 %op34, %op41
  %op44 = getelementptr i32, i32* %arg6, i32 0
  store i32 %op42, i32* %op44
  %op47 = load i32, i32* %op21
  %op49 = getelementptr i32, i32* %arg3, i32 1
  %op50 = load i32, i32* %op49
  %op51 = mul i32 %op47, %op50
  %op54 = load i32, i32* %op28
  %op56 = getelementptr i32, i32* %arg4, i32 1
  %op57 = load i32, i32* %op56
  %op58 = mul i32 %op54, %op57
  %op59 = add i32 %op51, %op58
  %op62 = load i32, i32* %op36
  %op64 = getelementptr i32, i32* %arg5, i32 1
  %op65 = load i32, i32* %op64
  %op66 = mul i32 %op62, %op65
  %op67 = add i32 %op59, %op66
  %op69 = getelementptr i32, i32* %arg6, i32 1
  store i32 %op67, i32* %op69
  %op72 = load i32, i32* %op21
  %op74 = getelementptr i32, i32* %arg3, i32 2
  %op75 = load i32, i32* %op74
  %op76 = mul i32 %op72, %op75
  %op79 = load i32, i32* %op28
  %op81 = getelementptr i32, i32* %arg4, i32 2
  %op82 = load i32, i32* %op81
  %op83 = mul i32 %op79, %op82
  %op84 = add i32 %op76, %op83
  %op87 = load i32, i32* %op36
  %op89 = getelementptr i32, i32* %arg5, i32 2
  %op90 = load i32, i32* %op89
  %op91 = mul i32 %op87, %op90
  %op92 = add i32 %op84, %op91
  %op94 = getelementptr i32, i32* %arg6, i32 2
  store i32 %op92, i32* %op94
  %op96 = getelementptr i32, i32* %arg1, i32 0
  %op97 = load i32, i32* %op96
  %op100 = load i32, i32* %op24
  %op101 = mul i32 %op97, %op100
  %op103 = getelementptr i32, i32* %arg1, i32 1
  %op104 = load i32, i32* %op103
  %op107 = load i32, i32* %op31
  %op108 = mul i32 %op104, %op107
  %op109 = add i32 %op101, %op108
  %op111 = getelementptr i32, i32* %arg1, i32 2
  %op112 = load i32, i32* %op111
  %op115 = load i32, i32* %op39
  %op116 = mul i32 %op112, %op115
  %op117 = add i32 %op109, %op116
  %op119 = getelementptr i32, i32* %arg7, i32 0
  store i32 %op117, i32* %op119
  %op122 = load i32, i32* %op96
  %op125 = load i32, i32* %op49
  %op126 = mul i32 %op122, %op125
  %op129 = load i32, i32* %op103
  %op132 = load i32, i32* %op56
  %op133 = mul i32 %op129, %op132
  %op134 = add i32 %op126, %op133
  %op137 = load i32, i32* %op111
  %op140 = load i32, i32* %op64
  %op141 = mul i32 %op137, %op140
  %op142 = add i32 %op134, %op141
  %op144 = getelementptr i32, i32* %arg7, i32 1
  store i32 %op142, i32* %op144
  %op147 = load i32, i32* %op96
  %op150 = load i32, i32* %op74
  %op151 = mul i32 %op147, %op150
  %op154 = load i32, i32* %op103
  %op157 = load i32, i32* %op81
  %op158 = mul i32 %op154, %op157
  %op159 = add i32 %op151, %op158
  %op162 = load i32, i32* %op111
  %op165 = load i32, i32* %op89
  %op166 = mul i32 %op162, %op165
  %op167 = add i32 %op159, %op166
  %op169 = getelementptr i32, i32* %arg7, i32 2
  store i32 %op167, i32* %op169
  %op171 = getelementptr i32, i32* %arg2, i32 0
  %op172 = load i32, i32* %op171
  %op175 = load i32, i32* %op24
  %op176 = mul i32 %op172, %op175
  %op178 = getelementptr i32, i32* %arg2, i32 1
  %op179 = load i32, i32* %op178
  %op182 = load i32, i32* %op31
  %op183 = mul i32 %op179, %op182
  %op184 = add i32 %op176, %op183
  %op186 = getelementptr i32, i32* %arg2, i32 2
  %op187 = load i32, i32* %op186
  %op190 = load i32, i32* %op39
  %op191 = mul i32 %op187, %op190
  %op192 = add i32 %op184, %op191
  %op194 = getelementptr i32, i32* %arg8, i32 0
  store i32 %op192, i32* %op194
  %op197 = load i32, i32* %op171
  %op200 = load i32, i32* %op49
  %op201 = mul i32 %op197, %op200
  %op204 = load i32, i32* %op178
  %op207 = load i32, i32* %op56
  %op208 = mul i32 %op204, %op207
  %op209 = add i32 %op201, %op208
  %op212 = load i32, i32* %op186
  %op215 = load i32, i32* %op64
  %op216 = mul i32 %op212, %op215
  %op217 = add i32 %op209, %op216
  %op219 = getelementptr i32, i32* %arg8, i32 1
  store i32 %op217, i32* %op219
  %op222 = load i32, i32* %op171
  %op225 = load i32, i32* %op74
  %op226 = mul i32 %op222, %op225
  %op229 = load i32, i32* %op178
  %op232 = load i32, i32* %op81
  %op233 = mul i32 %op229, %op232
  %op234 = add i32 %op226, %op233
  %op237 = load i32, i32* %op186
  %op240 = load i32, i32* %op89
  %op241 = mul i32 %op237, %op240
  %op242 = add i32 %op234, %op241
  %op244 = getelementptr i32, i32* %arg8, i32 2
  store i32 %op242, i32* %op244
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 0
}
define i32 @main() {
label_entry:
  store i32 3, i32* @N
  store i32 3, i32* @M
  store i32 3, i32* @L
  %op1 = alloca [3 x i32]
  %op2 = alloca [3 x i32]
  %op3 = alloca [3 x i32]
  %op4 = alloca [3 x i32]
  %op5 = alloca [3 x i32]
  %op6 = alloca [3 x i32]
  %op7 = alloca [6 x i32]
  %op8 = alloca [3 x i32]
  %op9 = alloca [3 x i32]
  br label %label_1
label_ret:                                                ; preds = %label_12
  ret i32 0
label_1:                                                ; preds = %label_entry, %label_2
  %op76 = phi i32 [ 0, %label_entry ], [ %op34, %label_2 ]
  %op13 = load i32, i32* @M
  %op14 = icmp slt i32 %op76, %op13
  br i1 %op14, label %label_2, label %label_3
label_2:                                                ; preds = %label_1
  %op17 = getelementptr [3 x i32], [3 x i32]* %op1, i32 0, i32 %op76
  store i32 %op76, i32* %op17
  %op20 = getelementptr [3 x i32], [3 x i32]* %op2, i32 0, i32 %op76
  store i32 %op76, i32* %op20
  %op23 = getelementptr [3 x i32], [3 x i32]* %op3, i32 0, i32 %op76
  store i32 %op76, i32* %op23
  %op26 = getelementptr [3 x i32], [3 x i32]* %op4, i32 0, i32 %op76
  store i32 %op76, i32* %op26
  %op29 = getelementptr [3 x i32], [3 x i32]* %op5, i32 0, i32 %op76
  store i32 %op76, i32* %op29
  %op32 = getelementptr [3 x i32], [3 x i32]* %op6, i32 0, i32 %op76
  store i32 %op76, i32* %op32
  %op34 = add i32 %op76, 1
  br label %label_1
label_3:                                                ; preds = %label_1
  %op35 = getelementptr [3 x i32], [3 x i32]* %op1, i32 0, i32 0
  %op36 = getelementptr [3 x i32], [3 x i32]* %op2, i32 0, i32 0
  %op37 = getelementptr [3 x i32], [3 x i32]* %op3, i32 0, i32 0
  %op38 = getelementptr [3 x i32], [3 x i32]* %op4, i32 0, i32 0
  %op39 = getelementptr [3 x i32], [3 x i32]* %op5, i32 0, i32 0
  %op40 = getelementptr [3 x i32], [3 x i32]* %op6, i32 0, i32 0
  %op41 = getelementptr [6 x i32], [6 x i32]* %op7, i32 0, i32 0
  %op42 = getelementptr [3 x i32], [3 x i32]* %op8, i32 0, i32 0
  %op43 = getelementptr [3 x i32], [3 x i32]* %op9, i32 0, i32 0
  %op44 = call i32 @mul(i32* %op35, i32* %op36, i32* %op37, i32* %op38, i32* %op39, i32* %op40, i32* %op41, i32* %op42, i32* %op43)
  br label %label_4
label_4:                                                ; preds = %label_3, %label_5
  %op77 = phi i32 [ %op44, %label_3 ], [ %op54, %label_5 ]
  %op47 = load i32, i32* @N
  %op48 = icmp slt i32 %op77, %op47
  br i1 %op48, label %label_5, label %label_6
label_5:                                                ; preds = %label_4
  %op50 = getelementptr [6 x i32], [6 x i32]* %op7, i32 0, i32 %op77
  %op51 = load i32, i32* %op50
  call void @put_int(i32 %op51)
  %op54 = add i32 %op77, 1
  br label %label_4
label_6:                                                ; preds = %label_4
  call void @put_char(i32 10)
  br label %label_7
label_7:                                                ; preds = %label_6, %label_8
  %op78 = phi i32 [ 0, %label_6 ], [ %op64, %label_8 ]
  %op57 = load i32, i32* @N
  %op58 = icmp slt i32 %op78, %op57
  br i1 %op58, label %label_8, label %label_9
label_8:                                                ; preds = %label_7
  %op60 = getelementptr [3 x i32], [3 x i32]* %op8, i32 0, i32 %op78
  %op61 = load i32, i32* %op60
  call void @put_int(i32 %op61)
  %op64 = add i32 %op78, 1
  br label %label_7
label_9:                                                ; preds = %label_7
  call void @put_char(i32 10)
  br label %label_10
label_10:                                                ; preds = %label_9, %label_11
  %op79 = phi i32 [ 0, %label_9 ], [ %op74, %label_11 ]
  %op67 = load i32, i32* @N
  %op68 = icmp slt i32 %op79, %op67
  br i1 %op68, label %label_11, label %label_12
label_11:                                                ; preds = %label_10
  %op70 = getelementptr [3 x i32], [3 x i32]* %op9, i32 0, i32 %op79
  %op71 = load i32, i32* %op70
  call void @put_int(i32 %op71)
  %op74 = add i32 %op79, 1
  br label %label_10
label_12:                                                ; preds = %label_10
  call void @put_char(i32 10)
  br label %label_ret
}
