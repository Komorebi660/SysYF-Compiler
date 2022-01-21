declare i32 @get_int()

declare void @put_int(i32)

declare void @put_char(i32)

define void @sort(i32* %arg0, i32 %arg1) {
label_entry:
  br label %label_1
label_ret:                                                ; preds = %label_1
  ret void
label_1:                                                ; preds = %label_entry, %label_6
  %op45 = phi i32 [ 0, %label_entry ], [ %op11, %label_6 ]
  %op7 = sub i32 %arg1, 1
  %op8 = icmp slt i32 %op45, %op7
  br i1 %op8, label %label_2, label %label_ret
label_2:                                                ; preds = %label_1
  %op11 = add i32 %op45, 1
  br label %label_4
label_4:                                                ; preds = %label_2, %label_8
  %op46 = phi i32 [ %op11, %label_2 ], [ %op43, %label_8 ]
  %op14 = icmp slt i32 %op46, %arg1
  br i1 %op14, label %label_5, label %label_6
label_5:                                                ; preds = %label_4
  %op17 = getelementptr i32, i32* %arg0, i32 %op45
  %op18 = load i32, i32* %op17
  %op21 = getelementptr i32, i32* %arg0, i32 %op46
  %op22 = load i32, i32* %op21
  %op23 = icmp slt i32 %op18, %op22
  br i1 %op23, label %label_7, label %label_8
label_6:                                                ; preds = %label_4
  br label %label_1
label_7:                                                ; preds = %label_5
  %op30 = load i32, i32* %op17
  %op34 = load i32, i32* %op21
  store i32 %op34, i32* %op17
  store i32 %op30, i32* %op21
  br label %label_8
label_8:                                                ; preds = %label_5, %label_7
  %op43 = add i32 %op46, 1
  br label %label_4
}
define i32 @param32_rec(i32 %arg0, i32 %arg1, i32 %arg2, i32 %arg3, i32 %arg4, i32 %arg5, i32 %arg6, i32 %arg7, i32 %arg8, i32 %arg9, i32 %arg10, i32 %arg11, i32 %arg12, i32 %arg13, i32 %arg14, i32 %arg15, i32 %arg16, i32 %arg17, i32 %arg18, i32 %arg19, i32 %arg20, i32 %arg21, i32 %arg22, i32 %arg23, i32 %arg24, i32 %arg25, i32 %arg26, i32 %arg27, i32 %arg28, i32 %arg29, i32 %arg30, i32 %arg31) {
label_entry:
  %op66 = icmp eq i32 %arg0, 0
  br i1 %op66, label %label_9, label %label_10
label_ret:                                                ; preds = %label_9, %label_10
  %op105 = phi i32 [ %op104, %label_10 ], [ %arg1, %label_9 ]
  ret i32 %op105
label_9:                                                ; preds = %label_entry
  br label %label_ret
label_10:                                                ; preds = %label_entry
  %op70 = sub i32 %arg0, 1
  %op73 = add i32 %arg1, %arg2
  %op74 = srem i32 %op73, 998244353
  %op104 = call i32 @param32_rec(i32 %op70, i32 %op74, i32 %arg3, i32 %arg4, i32 %arg5, i32 %arg6, i32 %arg7, i32 %arg8, i32 %arg9, i32 %arg10, i32 %arg11, i32 %arg12, i32 %arg13, i32 %arg14, i32 %arg15, i32 %arg16, i32 %arg17, i32 %arg18, i32 %arg19, i32 %arg20, i32 %arg21, i32 %arg22, i32 %arg23, i32 %arg24, i32 %arg25, i32 %arg26, i32 %arg27, i32 %arg28, i32 %arg29, i32 %arg30, i32 %arg31, i32 0)
  br label %label_ret
}
define i32 @param32_arr(i32* %arg0, i32* %arg1, i32* %arg2, i32* %arg3, i32* %arg4, i32* %arg5, i32* %arg6, i32* %arg7, i32* %arg8, i32* %arg9, i32* %arg10, i32* %arg11, i32* %arg12, i32* %arg13, i32* %arg14, i32* %arg15, i32* %arg16, i32* %arg17, i32* %arg18, i32* %arg19, i32* %arg20, i32* %arg21, i32* %arg22, i32* %arg23, i32* %arg24, i32* %arg25, i32* %arg26, i32* %arg27, i32* %arg28, i32* %arg29, i32* %arg30, i32* %arg31) {
label_entry:
  %op67 = getelementptr i32, i32* %arg0, i32 0
  %op68 = load i32, i32* %op67
  %op70 = getelementptr i32, i32* %arg0, i32 1
  %op71 = load i32, i32* %op70
  %op72 = add i32 %op68, %op71
  %op75 = getelementptr i32, i32* %arg1, i32 0
  %op76 = load i32, i32* %op75
  %op77 = add i32 %op72, %op76
  %op79 = getelementptr i32, i32* %arg1, i32 1
  %op80 = load i32, i32* %op79
  %op81 = add i32 %op77, %op80
  %op84 = getelementptr i32, i32* %arg2, i32 0
  %op85 = load i32, i32* %op84
  %op86 = add i32 %op81, %op85
  %op88 = getelementptr i32, i32* %arg2, i32 1
  %op89 = load i32, i32* %op88
  %op90 = add i32 %op86, %op89
  %op93 = getelementptr i32, i32* %arg3, i32 0
  %op94 = load i32, i32* %op93
  %op95 = add i32 %op90, %op94
  %op97 = getelementptr i32, i32* %arg3, i32 1
  %op98 = load i32, i32* %op97
  %op99 = add i32 %op95, %op98
  %op102 = getelementptr i32, i32* %arg4, i32 0
  %op103 = load i32, i32* %op102
  %op104 = add i32 %op99, %op103
  %op106 = getelementptr i32, i32* %arg4, i32 1
  %op107 = load i32, i32* %op106
  %op108 = add i32 %op104, %op107
  %op111 = getelementptr i32, i32* %arg5, i32 0
  %op112 = load i32, i32* %op111
  %op113 = add i32 %op108, %op112
  %op115 = getelementptr i32, i32* %arg5, i32 1
  %op116 = load i32, i32* %op115
  %op117 = add i32 %op113, %op116
  %op120 = getelementptr i32, i32* %arg6, i32 0
  %op121 = load i32, i32* %op120
  %op122 = add i32 %op117, %op121
  %op124 = getelementptr i32, i32* %arg6, i32 1
  %op125 = load i32, i32* %op124
  %op126 = add i32 %op122, %op125
  %op129 = getelementptr i32, i32* %arg7, i32 0
  %op130 = load i32, i32* %op129
  %op131 = add i32 %op126, %op130
  %op133 = getelementptr i32, i32* %arg7, i32 1
  %op134 = load i32, i32* %op133
  %op135 = add i32 %op131, %op134
  %op138 = getelementptr i32, i32* %arg8, i32 0
  %op139 = load i32, i32* %op138
  %op140 = add i32 %op135, %op139
  %op142 = getelementptr i32, i32* %arg8, i32 1
  %op143 = load i32, i32* %op142
  %op144 = add i32 %op140, %op143
  %op147 = getelementptr i32, i32* %arg9, i32 0
  %op148 = load i32, i32* %op147
  %op149 = add i32 %op144, %op148
  %op151 = getelementptr i32, i32* %arg9, i32 1
  %op152 = load i32, i32* %op151
  %op153 = add i32 %op149, %op152
  %op156 = getelementptr i32, i32* %arg10, i32 0
  %op157 = load i32, i32* %op156
  %op158 = add i32 %op153, %op157
  %op160 = getelementptr i32, i32* %arg10, i32 1
  %op161 = load i32, i32* %op160
  %op162 = add i32 %op158, %op161
  %op165 = getelementptr i32, i32* %arg11, i32 0
  %op166 = load i32, i32* %op165
  %op167 = add i32 %op162, %op166
  %op169 = getelementptr i32, i32* %arg11, i32 1
  %op170 = load i32, i32* %op169
  %op171 = add i32 %op167, %op170
  %op174 = getelementptr i32, i32* %arg12, i32 0
  %op175 = load i32, i32* %op174
  %op176 = add i32 %op171, %op175
  %op178 = getelementptr i32, i32* %arg12, i32 1
  %op179 = load i32, i32* %op178
  %op180 = add i32 %op176, %op179
  %op183 = getelementptr i32, i32* %arg13, i32 0
  %op184 = load i32, i32* %op183
  %op185 = add i32 %op180, %op184
  %op187 = getelementptr i32, i32* %arg13, i32 1
  %op188 = load i32, i32* %op187
  %op189 = add i32 %op185, %op188
  %op192 = getelementptr i32, i32* %arg14, i32 0
  %op193 = load i32, i32* %op192
  %op194 = add i32 %op189, %op193
  %op196 = getelementptr i32, i32* %arg14, i32 1
  %op197 = load i32, i32* %op196
  %op198 = add i32 %op194, %op197
  %op201 = getelementptr i32, i32* %arg15, i32 0
  %op202 = load i32, i32* %op201
  %op203 = add i32 %op198, %op202
  %op205 = getelementptr i32, i32* %arg15, i32 1
  %op206 = load i32, i32* %op205
  %op207 = add i32 %op203, %op206
  %op210 = getelementptr i32, i32* %arg16, i32 0
  %op211 = load i32, i32* %op210
  %op212 = add i32 %op207, %op211
  %op214 = getelementptr i32, i32* %arg16, i32 1
  %op215 = load i32, i32* %op214
  %op216 = add i32 %op212, %op215
  %op219 = getelementptr i32, i32* %arg17, i32 0
  %op220 = load i32, i32* %op219
  %op221 = add i32 %op216, %op220
  %op223 = getelementptr i32, i32* %arg17, i32 1
  %op224 = load i32, i32* %op223
  %op225 = add i32 %op221, %op224
  %op228 = getelementptr i32, i32* %arg18, i32 0
  %op229 = load i32, i32* %op228
  %op230 = add i32 %op225, %op229
  %op232 = getelementptr i32, i32* %arg18, i32 1
  %op233 = load i32, i32* %op232
  %op234 = add i32 %op230, %op233
  %op237 = getelementptr i32, i32* %arg19, i32 0
  %op238 = load i32, i32* %op237
  %op239 = add i32 %op234, %op238
  %op241 = getelementptr i32, i32* %arg19, i32 1
  %op242 = load i32, i32* %op241
  %op243 = add i32 %op239, %op242
  %op246 = getelementptr i32, i32* %arg20, i32 0
  %op247 = load i32, i32* %op246
  %op248 = add i32 %op243, %op247
  %op250 = getelementptr i32, i32* %arg20, i32 1
  %op251 = load i32, i32* %op250
  %op252 = add i32 %op248, %op251
  %op255 = getelementptr i32, i32* %arg21, i32 0
  %op256 = load i32, i32* %op255
  %op257 = add i32 %op252, %op256
  %op259 = getelementptr i32, i32* %arg21, i32 1
  %op260 = load i32, i32* %op259
  %op261 = add i32 %op257, %op260
  %op264 = getelementptr i32, i32* %arg22, i32 0
  %op265 = load i32, i32* %op264
  %op266 = add i32 %op261, %op265
  %op268 = getelementptr i32, i32* %arg22, i32 1
  %op269 = load i32, i32* %op268
  %op270 = add i32 %op266, %op269
  %op273 = getelementptr i32, i32* %arg23, i32 0
  %op274 = load i32, i32* %op273
  %op275 = add i32 %op270, %op274
  %op277 = getelementptr i32, i32* %arg23, i32 1
  %op278 = load i32, i32* %op277
  %op279 = add i32 %op275, %op278
  %op282 = getelementptr i32, i32* %arg24, i32 0
  %op283 = load i32, i32* %op282
  %op284 = add i32 %op279, %op283
  %op286 = getelementptr i32, i32* %arg24, i32 1
  %op287 = load i32, i32* %op286
  %op288 = add i32 %op284, %op287
  %op291 = getelementptr i32, i32* %arg25, i32 0
  %op292 = load i32, i32* %op291
  %op293 = add i32 %op288, %op292
  %op295 = getelementptr i32, i32* %arg25, i32 1
  %op296 = load i32, i32* %op295
  %op297 = add i32 %op293, %op296
  %op300 = getelementptr i32, i32* %arg26, i32 0
  %op301 = load i32, i32* %op300
  %op302 = add i32 %op297, %op301
  %op304 = getelementptr i32, i32* %arg26, i32 1
  %op305 = load i32, i32* %op304
  %op306 = add i32 %op302, %op305
  %op309 = getelementptr i32, i32* %arg27, i32 0
  %op310 = load i32, i32* %op309
  %op311 = add i32 %op306, %op310
  %op313 = getelementptr i32, i32* %arg27, i32 1
  %op314 = load i32, i32* %op313
  %op315 = add i32 %op311, %op314
  %op318 = getelementptr i32, i32* %arg28, i32 0
  %op319 = load i32, i32* %op318
  %op320 = add i32 %op315, %op319
  %op322 = getelementptr i32, i32* %arg28, i32 1
  %op323 = load i32, i32* %op322
  %op324 = add i32 %op320, %op323
  %op327 = getelementptr i32, i32* %arg29, i32 0
  %op328 = load i32, i32* %op327
  %op329 = add i32 %op324, %op328
  %op331 = getelementptr i32, i32* %arg29, i32 1
  %op332 = load i32, i32* %op331
  %op333 = add i32 %op329, %op332
  %op336 = getelementptr i32, i32* %arg30, i32 0
  %op337 = load i32, i32* %op336
  %op338 = add i32 %op333, %op337
  %op340 = getelementptr i32, i32* %arg30, i32 1
  %op341 = load i32, i32* %op340
  %op342 = add i32 %op338, %op341
  %op345 = getelementptr i32, i32* %arg31, i32 0
  %op346 = load i32, i32* %op345
  %op347 = add i32 %op342, %op346
  %op349 = getelementptr i32, i32* %arg31, i32 1
  %op350 = load i32, i32* %op349
  %op351 = add i32 %op347, %op350
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op351
}
define i32 @param16(i32 %arg0, i32 %arg1, i32 %arg2, i32 %arg3, i32 %arg4, i32 %arg5, i32 %arg6, i32 %arg7, i32 %arg8, i32 %arg9, i32 %arg10, i32 %arg11, i32 %arg12, i32 %arg13, i32 %arg14, i32 %arg15) {
label_entry:
  %op33 = alloca [16 x i32]
  %op50 = getelementptr [16 x i32], [16 x i32]* %op33, i32 0, i32 0
  store i32 0, i32* %op50
  %op51 = getelementptr [16 x i32], [16 x i32]* %op33, i32 0, i32 1
  store i32 0, i32* %op51
  %op52 = getelementptr [16 x i32], [16 x i32]* %op33, i32 0, i32 2
  store i32 0, i32* %op52
  %op53 = getelementptr [16 x i32], [16 x i32]* %op33, i32 0, i32 3
  store i32 0, i32* %op53
  %op54 = getelementptr [16 x i32], [16 x i32]* %op33, i32 0, i32 4
  store i32 0, i32* %op54
  %op55 = getelementptr [16 x i32], [16 x i32]* %op33, i32 0, i32 5
  store i32 0, i32* %op55
  %op56 = getelementptr [16 x i32], [16 x i32]* %op33, i32 0, i32 6
  store i32 0, i32* %op56
  %op57 = getelementptr [16 x i32], [16 x i32]* %op33, i32 0, i32 7
  store i32 0, i32* %op57
  %op58 = getelementptr [16 x i32], [16 x i32]* %op33, i32 0, i32 8
  store i32 0, i32* %op58
  %op59 = getelementptr [16 x i32], [16 x i32]* %op33, i32 0, i32 9
  store i32 0, i32* %op59
  %op60 = getelementptr [16 x i32], [16 x i32]* %op33, i32 0, i32 10
  store i32 0, i32* %op60
  %op61 = getelementptr [16 x i32], [16 x i32]* %op33, i32 0, i32 11
  store i32 0, i32* %op61
  %op62 = getelementptr [16 x i32], [16 x i32]* %op33, i32 0, i32 12
  store i32 0, i32* %op62
  %op63 = getelementptr [16 x i32], [16 x i32]* %op33, i32 0, i32 13
  store i32 0, i32* %op63
  %op64 = getelementptr [16 x i32], [16 x i32]* %op33, i32 0, i32 14
  store i32 0, i32* %op64
  %op65 = getelementptr [16 x i32], [16 x i32]* %op33, i32 0, i32 15
  store i32 0, i32* %op65
  store i32 %arg0, i32* %op50
  store i32 %arg1, i32* %op51
  store i32 %arg2, i32* %op52
  store i32 %arg3, i32* %op53
  store i32 %arg4, i32* %op54
  store i32 %arg5, i32* %op55
  store i32 %arg6, i32* %op56
  store i32 %arg7, i32* %op57
  store i32 %arg8, i32* %op58
  store i32 %arg9, i32* %op59
  store i32 %arg10, i32* %op60
  store i32 %arg11, i32* %op61
  store i32 %arg12, i32* %op62
  store i32 %arg13, i32* %op63
  store i32 %arg14, i32* %op64
  store i32 %arg15, i32* %op65
  call void @sort(i32* %op50, i32 16)
  %op84 = load i32, i32* %op50
  %op86 = load i32, i32* %op51
  %op88 = load i32, i32* %op52
  %op90 = load i32, i32* %op53
  %op92 = load i32, i32* %op54
  %op94 = load i32, i32* %op55
  %op96 = load i32, i32* %op56
  %op98 = load i32, i32* %op57
  %op100 = load i32, i32* %op58
  %op102 = load i32, i32* %op59
  %op104 = load i32, i32* %op60
  %op106 = load i32, i32* %op61
  %op108 = load i32, i32* %op62
  %op110 = load i32, i32* %op63
  %op112 = load i32, i32* %op64
  %op114 = load i32, i32* %op65
  %op131 = call i32 @param32_rec(i32 %op84, i32 %op86, i32 %op88, i32 %op90, i32 %op92, i32 %op94, i32 %op96, i32 %op98, i32 %op100, i32 %op102, i32 %op104, i32 %op106, i32 %op108, i32 %op110, i32 %op112, i32 %op114, i32 %arg0, i32 %arg1, i32 %arg2, i32 %arg3, i32 %arg4, i32 %arg5, i32 %arg6, i32 %arg7, i32 %arg8, i32 %arg9, i32 %arg10, i32 %arg11, i32 %arg12, i32 %arg13, i32 %arg14, i32 %arg15)
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op131
}
define i32 @main() {
label_entry:
  %op1 = alloca [32 x [2 x i32]]
  %op2 = call i32 @get_int()
  %op3 = call i32 @get_int()
  %op4 = call i32 @get_int()
  %op5 = call i32 @get_int()
  %op6 = call i32 @get_int()
  %op7 = call i32 @get_int()
  %op8 = call i32 @get_int()
  %op9 = call i32 @get_int()
  %op10 = call i32 @get_int()
  %op11 = call i32 @get_int()
  %op12 = call i32 @get_int()
  %op13 = call i32 @get_int()
  %op14 = call i32 @get_int()
  %op15 = call i32 @get_int()
  %op16 = call i32 @get_int()
  %op17 = call i32 @get_int()
  %op18 = call i32 @param16(i32 %op2, i32 %op3, i32 %op4, i32 %op5, i32 %op6, i32 %op7, i32 %op8, i32 %op9, i32 %op10, i32 %op11, i32 %op12, i32 %op13, i32 %op14, i32 %op15, i32 %op16, i32 %op17)
  %op19 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 0, i32 0
  store i32 0, i32* %op19
  %op20 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 0, i32 1
  store i32 0, i32* %op20
  %op21 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 1, i32 0
  store i32 0, i32* %op21
  %op22 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 1, i32 1
  store i32 0, i32* %op22
  %op23 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 2, i32 0
  store i32 0, i32* %op23
  %op24 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 2, i32 1
  store i32 0, i32* %op24
  %op25 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 3, i32 0
  store i32 0, i32* %op25
  %op26 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 3, i32 1
  store i32 0, i32* %op26
  %op27 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 4, i32 0
  store i32 0, i32* %op27
  %op28 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 4, i32 1
  store i32 0, i32* %op28
  %op29 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 5, i32 0
  store i32 0, i32* %op29
  %op30 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 5, i32 1
  store i32 0, i32* %op30
  %op31 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 6, i32 0
  store i32 0, i32* %op31
  %op32 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 6, i32 1
  store i32 0, i32* %op32
  %op33 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 7, i32 0
  store i32 0, i32* %op33
  %op34 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 7, i32 1
  store i32 0, i32* %op34
  %op35 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 8, i32 0
  store i32 0, i32* %op35
  %op36 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 8, i32 1
  store i32 0, i32* %op36
  %op37 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 9, i32 0
  store i32 0, i32* %op37
  %op38 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 9, i32 1
  store i32 0, i32* %op38
  %op39 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 10, i32 0
  store i32 0, i32* %op39
  %op40 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 10, i32 1
  store i32 0, i32* %op40
  %op41 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 11, i32 0
  store i32 0, i32* %op41
  %op42 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 11, i32 1
  store i32 0, i32* %op42
  %op43 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 12, i32 0
  store i32 0, i32* %op43
  %op44 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 12, i32 1
  store i32 0, i32* %op44
  %op45 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 13, i32 0
  store i32 0, i32* %op45
  %op46 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 13, i32 1
  store i32 0, i32* %op46
  %op47 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 14, i32 0
  store i32 0, i32* %op47
  %op48 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 14, i32 1
  store i32 0, i32* %op48
  %op49 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 15, i32 0
  store i32 0, i32* %op49
  %op50 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 15, i32 1
  store i32 0, i32* %op50
  %op51 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 16, i32 0
  store i32 0, i32* %op51
  %op52 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 16, i32 1
  store i32 0, i32* %op52
  %op53 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 17, i32 0
  store i32 0, i32* %op53
  %op54 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 17, i32 1
  store i32 0, i32* %op54
  %op55 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 18, i32 0
  store i32 0, i32* %op55
  %op56 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 18, i32 1
  store i32 0, i32* %op56
  %op57 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 19, i32 0
  store i32 0, i32* %op57
  %op58 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 19, i32 1
  store i32 0, i32* %op58
  %op59 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 20, i32 0
  store i32 0, i32* %op59
  %op60 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 20, i32 1
  store i32 0, i32* %op60
  %op61 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 21, i32 0
  store i32 0, i32* %op61
  %op62 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 21, i32 1
  store i32 0, i32* %op62
  %op63 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 22, i32 0
  store i32 0, i32* %op63
  %op64 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 22, i32 1
  store i32 0, i32* %op64
  %op65 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 23, i32 0
  store i32 0, i32* %op65
  %op66 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 23, i32 1
  store i32 0, i32* %op66
  %op67 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 24, i32 0
  store i32 0, i32* %op67
  %op68 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 24, i32 1
  store i32 0, i32* %op68
  %op69 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 25, i32 0
  store i32 0, i32* %op69
  %op70 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 25, i32 1
  store i32 0, i32* %op70
  %op71 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 26, i32 0
  store i32 0, i32* %op71
  %op72 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 26, i32 1
  store i32 0, i32* %op72
  %op73 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 27, i32 0
  store i32 0, i32* %op73
  %op74 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 27, i32 1
  store i32 0, i32* %op74
  %op75 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 28, i32 0
  store i32 0, i32* %op75
  %op76 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 28, i32 1
  store i32 0, i32* %op76
  %op77 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 29, i32 0
  store i32 0, i32* %op77
  %op78 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 29, i32 1
  store i32 0, i32* %op78
  %op79 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 30, i32 0
  store i32 0, i32* %op79
  %op80 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 30, i32 1
  store i32 0, i32* %op80
  %op81 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 31, i32 0
  store i32 0, i32* %op81
  %op82 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 31, i32 1
  store i32 0, i32* %op82
  store i32 %op18, i32* %op19
  store i32 8848, i32* %op20
  br label %label_12
label_ret:                                                ; preds = %label_14
  ret i32 0
label_12:                                                ; preds = %label_entry, %label_13
  %op174 = phi i32 [ 1, %label_entry ], [ %op108, %label_13 ]
  %op88 = icmp slt i32 %op174, 32
  br i1 %op88, label %label_13, label %label_14
label_13:                                                ; preds = %label_12
  %op90 = sub i32 %op174, 1
  %op91 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 %op90
  %op92 = getelementptr [2 x i32], [2 x i32]* %op91, i32 0, i32 1
  %op93 = load i32, i32* %op92
  %op94 = sub i32 %op93, 1
  %op96 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 %op174
  %op97 = getelementptr [2 x i32], [2 x i32]* %op96, i32 0, i32 0
  store i32 %op94, i32* %op97
  %op101 = getelementptr [2 x i32], [2 x i32]* %op91, i32 0, i32 0
  %op102 = load i32, i32* %op101
  %op103 = sub i32 %op102, 2
  %op106 = getelementptr [2 x i32], [2 x i32]* %op96, i32 0, i32 1
  store i32 %op103, i32* %op106
  %op108 = add i32 %op174, 1
  br label %label_12
label_14:                                                ; preds = %label_12
  %op109 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 0
  %op110 = getelementptr [2 x i32], [2 x i32]* %op109, i32 0, i32 0
  %op111 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 1
  %op112 = getelementptr [2 x i32], [2 x i32]* %op111, i32 0, i32 0
  %op113 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 2
  %op114 = getelementptr [2 x i32], [2 x i32]* %op113, i32 0, i32 0
  %op115 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 3
  %op116 = getelementptr [2 x i32], [2 x i32]* %op115, i32 0, i32 0
  %op117 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 4
  %op118 = getelementptr [2 x i32], [2 x i32]* %op117, i32 0, i32 0
  %op119 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 5
  %op120 = getelementptr [2 x i32], [2 x i32]* %op119, i32 0, i32 0
  %op121 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 6
  %op122 = getelementptr [2 x i32], [2 x i32]* %op121, i32 0, i32 0
  %op123 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 7
  %op124 = getelementptr [2 x i32], [2 x i32]* %op123, i32 0, i32 0
  %op125 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 8
  %op126 = getelementptr [2 x i32], [2 x i32]* %op125, i32 0, i32 0
  %op127 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 9
  %op128 = getelementptr [2 x i32], [2 x i32]* %op127, i32 0, i32 0
  %op129 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 10
  %op130 = getelementptr [2 x i32], [2 x i32]* %op129, i32 0, i32 0
  %op131 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 11
  %op132 = getelementptr [2 x i32], [2 x i32]* %op131, i32 0, i32 0
  %op133 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 12
  %op134 = getelementptr [2 x i32], [2 x i32]* %op133, i32 0, i32 0
  %op135 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 13
  %op136 = getelementptr [2 x i32], [2 x i32]* %op135, i32 0, i32 0
  %op137 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 14
  %op138 = getelementptr [2 x i32], [2 x i32]* %op137, i32 0, i32 0
  %op139 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 15
  %op140 = getelementptr [2 x i32], [2 x i32]* %op139, i32 0, i32 0
  %op141 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 16
  %op142 = getelementptr [2 x i32], [2 x i32]* %op141, i32 0, i32 0
  %op143 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 17
  %op144 = getelementptr [2 x i32], [2 x i32]* %op143, i32 0, i32 0
  %op145 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 18
  %op146 = getelementptr [2 x i32], [2 x i32]* %op145, i32 0, i32 0
  %op147 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 19
  %op148 = getelementptr [2 x i32], [2 x i32]* %op147, i32 0, i32 0
  %op149 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 20
  %op150 = getelementptr [2 x i32], [2 x i32]* %op149, i32 0, i32 0
  %op151 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 21
  %op152 = getelementptr [2 x i32], [2 x i32]* %op151, i32 0, i32 0
  %op153 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 22
  %op154 = getelementptr [2 x i32], [2 x i32]* %op153, i32 0, i32 0
  %op155 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 23
  %op156 = getelementptr [2 x i32], [2 x i32]* %op155, i32 0, i32 0
  %op157 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 24
  %op158 = getelementptr [2 x i32], [2 x i32]* %op157, i32 0, i32 0
  %op159 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 25
  %op160 = getelementptr [2 x i32], [2 x i32]* %op159, i32 0, i32 0
  %op161 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 26
  %op162 = getelementptr [2 x i32], [2 x i32]* %op161, i32 0, i32 0
  %op163 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 27
  %op164 = getelementptr [2 x i32], [2 x i32]* %op163, i32 0, i32 0
  %op165 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 28
  %op166 = getelementptr [2 x i32], [2 x i32]* %op165, i32 0, i32 0
  %op167 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 29
  %op168 = getelementptr [2 x i32], [2 x i32]* %op167, i32 0, i32 0
  %op169 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 30
  %op170 = getelementptr [2 x i32], [2 x i32]* %op169, i32 0, i32 0
  %op171 = getelementptr [32 x [2 x i32]], [32 x [2 x i32]]* %op1, i32 0, i32 31
  %op172 = getelementptr [2 x i32], [2 x i32]* %op171, i32 0, i32 0
  %op173 = call i32 @param32_arr(i32* %op110, i32* %op112, i32* %op114, i32* %op116, i32* %op118, i32* %op120, i32* %op122, i32* %op124, i32* %op126, i32* %op128, i32* %op130, i32* %op132, i32* %op134, i32* %op136, i32* %op138, i32* %op140, i32* %op142, i32* %op144, i32* %op146, i32* %op148, i32* %op150, i32* %op152, i32* %op154, i32* %op156, i32* %op158, i32* %op160, i32* %op162, i32* %op164, i32* %op166, i32* %op168, i32* %op170, i32* %op172)
  call void @put_int(i32 %op173)
  call void @put_char(i32 10)
  br label %label_ret
}
