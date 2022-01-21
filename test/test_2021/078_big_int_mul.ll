@len = constant i32 20
declare void @put_int(i32)

define i32 @main() {
label_entry:
  %op6 = alloca [20 x i32]
  %op7 = getelementptr [20 x i32], [20 x i32]* %op6, i32 0, i32 0
  store i32 0, i32* %op7
  %op8 = getelementptr [20 x i32], [20 x i32]* %op6, i32 0, i32 1
  store i32 0, i32* %op8
  %op9 = getelementptr [20 x i32], [20 x i32]* %op6, i32 0, i32 2
  store i32 0, i32* %op9
  %op10 = getelementptr [20 x i32], [20 x i32]* %op6, i32 0, i32 3
  store i32 0, i32* %op10
  %op11 = getelementptr [20 x i32], [20 x i32]* %op6, i32 0, i32 4
  store i32 0, i32* %op11
  %op12 = getelementptr [20 x i32], [20 x i32]* %op6, i32 0, i32 5
  store i32 0, i32* %op12
  %op13 = getelementptr [20 x i32], [20 x i32]* %op6, i32 0, i32 6
  store i32 0, i32* %op13
  %op14 = getelementptr [20 x i32], [20 x i32]* %op6, i32 0, i32 7
  store i32 0, i32* %op14
  %op15 = getelementptr [20 x i32], [20 x i32]* %op6, i32 0, i32 8
  store i32 0, i32* %op15
  %op16 = getelementptr [20 x i32], [20 x i32]* %op6, i32 0, i32 9
  store i32 0, i32* %op16
  %op17 = getelementptr [20 x i32], [20 x i32]* %op6, i32 0, i32 10
  store i32 0, i32* %op17
  %op18 = getelementptr [20 x i32], [20 x i32]* %op6, i32 0, i32 11
  store i32 0, i32* %op18
  %op19 = getelementptr [20 x i32], [20 x i32]* %op6, i32 0, i32 12
  store i32 0, i32* %op19
  %op20 = getelementptr [20 x i32], [20 x i32]* %op6, i32 0, i32 13
  store i32 0, i32* %op20
  %op21 = getelementptr [20 x i32], [20 x i32]* %op6, i32 0, i32 14
  store i32 0, i32* %op21
  %op22 = getelementptr [20 x i32], [20 x i32]* %op6, i32 0, i32 15
  store i32 0, i32* %op22
  %op23 = getelementptr [20 x i32], [20 x i32]* %op6, i32 0, i32 16
  store i32 0, i32* %op23
  %op24 = getelementptr [20 x i32], [20 x i32]* %op6, i32 0, i32 17
  store i32 0, i32* %op24
  %op25 = getelementptr [20 x i32], [20 x i32]* %op6, i32 0, i32 18
  store i32 0, i32* %op25
  %op26 = getelementptr [20 x i32], [20 x i32]* %op6, i32 0, i32 19
  store i32 0, i32* %op26
  store i32 1, i32* %op7
  store i32 2, i32* %op8
  store i32 3, i32* %op9
  store i32 4, i32* %op10
  store i32 5, i32* %op11
  store i32 6, i32* %op12
  store i32 7, i32* %op13
  store i32 8, i32* %op14
  store i32 9, i32* %op15
  store i32 0, i32* %op16
  store i32 1, i32* %op17
  store i32 2, i32* %op18
  store i32 3, i32* %op19
  store i32 4, i32* %op20
  store i32 5, i32* %op21
  store i32 6, i32* %op22
  store i32 7, i32* %op23
  store i32 8, i32* %op24
  store i32 9, i32* %op25
  store i32 0, i32* %op26
  %op47 = alloca [20 x i32]
  %op48 = getelementptr [20 x i32], [20 x i32]* %op47, i32 0, i32 0
  store i32 0, i32* %op48
  %op49 = getelementptr [20 x i32], [20 x i32]* %op47, i32 0, i32 1
  store i32 0, i32* %op49
  %op50 = getelementptr [20 x i32], [20 x i32]* %op47, i32 0, i32 2
  store i32 0, i32* %op50
  %op51 = getelementptr [20 x i32], [20 x i32]* %op47, i32 0, i32 3
  store i32 0, i32* %op51
  %op52 = getelementptr [20 x i32], [20 x i32]* %op47, i32 0, i32 4
  store i32 0, i32* %op52
  %op53 = getelementptr [20 x i32], [20 x i32]* %op47, i32 0, i32 5
  store i32 0, i32* %op53
  %op54 = getelementptr [20 x i32], [20 x i32]* %op47, i32 0, i32 6
  store i32 0, i32* %op54
  %op55 = getelementptr [20 x i32], [20 x i32]* %op47, i32 0, i32 7
  store i32 0, i32* %op55
  %op56 = getelementptr [20 x i32], [20 x i32]* %op47, i32 0, i32 8
  store i32 0, i32* %op56
  %op57 = getelementptr [20 x i32], [20 x i32]* %op47, i32 0, i32 9
  store i32 0, i32* %op57
  %op58 = getelementptr [20 x i32], [20 x i32]* %op47, i32 0, i32 10
  store i32 0, i32* %op58
  %op59 = getelementptr [20 x i32], [20 x i32]* %op47, i32 0, i32 11
  store i32 0, i32* %op59
  %op60 = getelementptr [20 x i32], [20 x i32]* %op47, i32 0, i32 12
  store i32 0, i32* %op60
  %op61 = getelementptr [20 x i32], [20 x i32]* %op47, i32 0, i32 13
  store i32 0, i32* %op61
  %op62 = getelementptr [20 x i32], [20 x i32]* %op47, i32 0, i32 14
  store i32 0, i32* %op62
  %op63 = getelementptr [20 x i32], [20 x i32]* %op47, i32 0, i32 15
  store i32 0, i32* %op63
  %op64 = getelementptr [20 x i32], [20 x i32]* %op47, i32 0, i32 16
  store i32 0, i32* %op64
  %op65 = getelementptr [20 x i32], [20 x i32]* %op47, i32 0, i32 17
  store i32 0, i32* %op65
  %op66 = getelementptr [20 x i32], [20 x i32]* %op47, i32 0, i32 18
  store i32 0, i32* %op66
  %op67 = getelementptr [20 x i32], [20 x i32]* %op47, i32 0, i32 19
  store i32 0, i32* %op67
  store i32 2, i32* %op48
  store i32 3, i32* %op49
  store i32 4, i32* %op50
  store i32 2, i32* %op51
  store i32 5, i32* %op52
  store i32 7, i32* %op53
  store i32 9, i32* %op54
  store i32 9, i32* %op55
  store i32 0, i32* %op56
  store i32 1, i32* %op57
  store i32 9, i32* %op58
  store i32 8, i32* %op59
  store i32 7, i32* %op60
  store i32 6, i32* %op61
  store i32 4, i32* %op62
  store i32 3, i32* %op63
  store i32 2, i32* %op64
  store i32 1, i32* %op65
  store i32 2, i32* %op66
  store i32 2, i32* %op67
  %op89 = load i32, i32* @len
  %op91 = load i32, i32* @len
  %op92 = alloca [25 x i32]
  %op93 = alloca [25 x i32]
  %op94 = alloca [40 x i32]
  %op95 = getelementptr [40 x i32], [40 x i32]* %op94, i32 0, i32 0
  store i32 0, i32* %op95
  %op96 = getelementptr [40 x i32], [40 x i32]* %op94, i32 0, i32 1
  store i32 0, i32* %op96
  %op97 = getelementptr [40 x i32], [40 x i32]* %op94, i32 0, i32 2
  store i32 0, i32* %op97
  %op98 = getelementptr [40 x i32], [40 x i32]* %op94, i32 0, i32 3
  store i32 0, i32* %op98
  %op99 = getelementptr [40 x i32], [40 x i32]* %op94, i32 0, i32 4
  store i32 0, i32* %op99
  %op100 = getelementptr [40 x i32], [40 x i32]* %op94, i32 0, i32 5
  store i32 0, i32* %op100
  %op101 = getelementptr [40 x i32], [40 x i32]* %op94, i32 0, i32 6
  store i32 0, i32* %op101
  %op102 = getelementptr [40 x i32], [40 x i32]* %op94, i32 0, i32 7
  store i32 0, i32* %op102
  %op103 = getelementptr [40 x i32], [40 x i32]* %op94, i32 0, i32 8
  store i32 0, i32* %op103
  %op104 = getelementptr [40 x i32], [40 x i32]* %op94, i32 0, i32 9
  store i32 0, i32* %op104
  %op105 = getelementptr [40 x i32], [40 x i32]* %op94, i32 0, i32 10
  store i32 0, i32* %op105
  %op106 = getelementptr [40 x i32], [40 x i32]* %op94, i32 0, i32 11
  store i32 0, i32* %op106
  %op107 = getelementptr [40 x i32], [40 x i32]* %op94, i32 0, i32 12
  store i32 0, i32* %op107
  %op108 = getelementptr [40 x i32], [40 x i32]* %op94, i32 0, i32 13
  store i32 0, i32* %op108
  %op109 = getelementptr [40 x i32], [40 x i32]* %op94, i32 0, i32 14
  store i32 0, i32* %op109
  %op110 = getelementptr [40 x i32], [40 x i32]* %op94, i32 0, i32 15
  store i32 0, i32* %op110
  %op111 = getelementptr [40 x i32], [40 x i32]* %op94, i32 0, i32 16
  store i32 0, i32* %op111
  %op112 = getelementptr [40 x i32], [40 x i32]* %op94, i32 0, i32 17
  store i32 0, i32* %op112
  %op113 = getelementptr [40 x i32], [40 x i32]* %op94, i32 0, i32 18
  store i32 0, i32* %op113
  %op114 = getelementptr [40 x i32], [40 x i32]* %op94, i32 0, i32 19
  store i32 0, i32* %op114
  %op115 = getelementptr [40 x i32], [40 x i32]* %op94, i32 0, i32 20
  store i32 0, i32* %op115
  %op116 = getelementptr [40 x i32], [40 x i32]* %op94, i32 0, i32 21
  store i32 0, i32* %op116
  %op117 = getelementptr [40 x i32], [40 x i32]* %op94, i32 0, i32 22
  store i32 0, i32* %op117
  %op118 = getelementptr [40 x i32], [40 x i32]* %op94, i32 0, i32 23
  store i32 0, i32* %op118
  %op119 = getelementptr [40 x i32], [40 x i32]* %op94, i32 0, i32 24
  store i32 0, i32* %op119
  %op120 = getelementptr [40 x i32], [40 x i32]* %op94, i32 0, i32 25
  store i32 0, i32* %op120
  %op121 = getelementptr [40 x i32], [40 x i32]* %op94, i32 0, i32 26
  store i32 0, i32* %op121
  %op122 = getelementptr [40 x i32], [40 x i32]* %op94, i32 0, i32 27
  store i32 0, i32* %op122
  %op123 = getelementptr [40 x i32], [40 x i32]* %op94, i32 0, i32 28
  store i32 0, i32* %op123
  %op124 = getelementptr [40 x i32], [40 x i32]* %op94, i32 0, i32 29
  store i32 0, i32* %op124
  %op125 = getelementptr [40 x i32], [40 x i32]* %op94, i32 0, i32 30
  store i32 0, i32* %op125
  %op126 = getelementptr [40 x i32], [40 x i32]* %op94, i32 0, i32 31
  store i32 0, i32* %op126
  %op127 = getelementptr [40 x i32], [40 x i32]* %op94, i32 0, i32 32
  store i32 0, i32* %op127
  %op128 = getelementptr [40 x i32], [40 x i32]* %op94, i32 0, i32 33
  store i32 0, i32* %op128
  %op129 = getelementptr [40 x i32], [40 x i32]* %op94, i32 0, i32 34
  store i32 0, i32* %op129
  %op130 = getelementptr [40 x i32], [40 x i32]* %op94, i32 0, i32 35
  store i32 0, i32* %op130
  %op131 = getelementptr [40 x i32], [40 x i32]* %op94, i32 0, i32 36
  store i32 0, i32* %op131
  %op132 = getelementptr [40 x i32], [40 x i32]* %op94, i32 0, i32 37
  store i32 0, i32* %op132
  %op133 = getelementptr [40 x i32], [40 x i32]* %op94, i32 0, i32 38
  store i32 0, i32* %op133
  %op134 = getelementptr [40 x i32], [40 x i32]* %op94, i32 0, i32 39
  store i32 0, i32* %op134
  br label %label_1
label_ret:                                                ; preds = %label_21
  ret i32 0
label_1:                                                ; preds = %label_entry, %label_2
  %op231 = phi i32 [ 0, %label_entry ], [ %op145, %label_2 ]
  %op138 = icmp slt i32 %op231, %op89
  br i1 %op138, label %label_2, label %label_3
label_2:                                                ; preds = %label_1
  %op140 = getelementptr [20 x i32], [20 x i32]* %op6, i32 0, i32 %op231
  %op141 = load i32, i32* %op140
  %op143 = getelementptr [25 x i32], [25 x i32]* %op92, i32 0, i32 %op231
  store i32 %op141, i32* %op143
  %op145 = add i32 %op231, 1
  br label %label_1
label_3:                                                ; preds = %label_1
  br label %label_4
label_4:                                                ; preds = %label_3, %label_5
  %op232 = phi i32 [ 0, %label_3 ], [ %op155, %label_5 ]
  %op148 = icmp slt i32 %op232, %op91
  br i1 %op148, label %label_5, label %label_6
label_5:                                                ; preds = %label_4
  %op150 = getelementptr [20 x i32], [20 x i32]* %op47, i32 0, i32 %op232
  %op151 = load i32, i32* %op150
  %op153 = getelementptr [25 x i32], [25 x i32]* %op93, i32 0, i32 %op232
  store i32 %op151, i32* %op153
  %op155 = add i32 %op232, 1
  br label %label_4
label_6:                                                ; preds = %label_4
  %op158 = add i32 %op89, %op91
  %op159 = sub i32 %op158, 1
  br label %label_7
label_7:                                                ; preds = %label_6, %label_8
  %op233 = phi i32 [ 0, %label_6 ], [ %op166, %label_8 ]
  %op162 = icmp sle i32 %op233, %op159
  br i1 %op162, label %label_8, label %label_9
label_8:                                                ; preds = %label_7
  %op164 = getelementptr [40 x i32], [40 x i32]* %op94, i32 0, i32 %op233
  store i32 0, i32* %op164
  %op166 = add i32 %op233, 1
  br label %label_7
label_9:                                                ; preds = %label_7
  %op168 = sub i32 %op91, 1
  br label %label_10
label_10:                                                ; preds = %label_9, %label_15
  %op236 = phi i32 [ %op159, %label_9 ], [ %op195, %label_15 ]
  %op237 = phi i32 [ %op168, %label_9 ], [ %op197, %label_15 ]
  %op170 = icmp sgt i32 %op237, -1
  br i1 %op170, label %label_11, label %label_12
label_11:                                                ; preds = %label_10
  %op172 = getelementptr [25 x i32], [25 x i32]* %op93, i32 0, i32 %op237
  %op173 = load i32, i32* %op172
  %op175 = sub i32 %op89, 1
  br label %label_13
label_12:                                                ; preds = %label_10
  %op177 = load i32, i32* %op95
  %op178 = icmp ne i32 %op177, 0
  br i1 %op178, label %label_19, label %label_20
label_13:                                                ; preds = %label_11, %label_18
  %op240 = phi i32 [ %op175, %label_11 ], [ %op215, %label_18 ]
  %op241 = phi i32 [ %op236, %label_11 ], [ %op217, %label_18 ]
  %op180 = icmp sgt i32 %op240, -1
  br i1 %op180, label %label_14, label %label_15
label_14:                                                ; preds = %label_13
  %op182 = getelementptr [40 x i32], [40 x i32]* %op94, i32 0, i32 %op241
  %op183 = load i32, i32* %op182
  %op186 = getelementptr [25 x i32], [25 x i32]* %op92, i32 0, i32 %op240
  %op187 = load i32, i32* %op186
  %op188 = mul i32 %op173, %op187
  %op189 = add i32 %op183, %op188
  %op191 = icmp sge i32 %op189, 10
  br i1 %op191, label %label_16, label %label_17
label_15:                                                ; preds = %label_13
  %op194 = add i32 %op241, %op89
  %op195 = sub i32 %op194, 1
  %op197 = sub i32 %op237, 1
  br label %label_10
label_16:                                                ; preds = %label_14
  store i32 %op189, i32* %op182
  %op202 = sub i32 %op241, 1
  %op203 = getelementptr [40 x i32], [40 x i32]* %op94, i32 0, i32 %op202
  %op204 = load i32, i32* %op203
  %op206 = sdiv i32 %op189, 10
  %op207 = add i32 %op204, %op206
  store i32 %op207, i32* %op203
  br label %label_18
label_17:                                                ; preds = %label_14
  store i32 %op189, i32* %op182
  br label %label_18
label_18:                                                ; preds = %label_16, %label_17
  %op215 = sub i32 %op240, 1
  %op217 = sub i32 %op241, 1
  br label %label_13
label_19:                                                ; preds = %label_12
  %op219 = load i32, i32* %op95
  call void @put_int(i32 %op219)
  br label %label_20
label_20:                                                ; preds = %label_12, %label_19
  br label %label_21
label_21:                                                ; preds = %label_20, %label_22
  %op242 = phi i32 [ 1, %label_20 ], [ %op230, %label_22 ]
  %op225 = icmp sle i32 %op242, %op159
  br i1 %op225, label %label_22, label %label_ret
label_22:                                                ; preds = %label_21
  %op227 = getelementptr [40 x i32], [40 x i32]* %op94, i32 0, i32 %op242
  %op228 = load i32, i32* %op227
  call void @put_int(i32 %op228)
  %op230 = add i32 %op242, 1
  br label %label_21
}
