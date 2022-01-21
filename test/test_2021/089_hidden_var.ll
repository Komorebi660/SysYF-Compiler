@b = global i32 5
@c = global [4 x i32] [i32 6, i32 7, i32 8, i32 9]
declare void @put_int(i32)

declare void @put_char(i32)

define i32 @main() {
label_entry:
  call void @put_int(i32 3)
  call void @put_int(i32 3)
  call void @put_int(i32 1)
  call void @put_char(i32 10)
  br label %label_3
label_ret:                                                ; preds = %label_7
  ret i32 0
label_3:                                                ; preds = %label_entry
  call void @put_int(i32 1)
  call void @put_char(i32 10)
  %op15 = getelementptr [4 x i32], [4 x i32]* @c, i32 0, i32 2
  store i32 1, i32* %op15
  %op16 = alloca [2 x [8 x i32]]
  %op17 = getelementptr [2 x [8 x i32]], [2 x [8 x i32]]* %op16, i32 0, i32 0, i32 0
  store i32 0, i32* %op17
  %op18 = getelementptr [2 x [8 x i32]], [2 x [8 x i32]]* %op16, i32 0, i32 0, i32 1
  store i32 0, i32* %op18
  %op19 = getelementptr [2 x [8 x i32]], [2 x [8 x i32]]* %op16, i32 0, i32 0, i32 2
  store i32 0, i32* %op19
  %op20 = getelementptr [2 x [8 x i32]], [2 x [8 x i32]]* %op16, i32 0, i32 0, i32 3
  store i32 0, i32* %op20
  %op21 = getelementptr [2 x [8 x i32]], [2 x [8 x i32]]* %op16, i32 0, i32 0, i32 4
  store i32 0, i32* %op21
  %op22 = getelementptr [2 x [8 x i32]], [2 x [8 x i32]]* %op16, i32 0, i32 0, i32 5
  store i32 0, i32* %op22
  %op23 = getelementptr [2 x [8 x i32]], [2 x [8 x i32]]* %op16, i32 0, i32 0, i32 6
  store i32 0, i32* %op23
  %op24 = getelementptr [2 x [8 x i32]], [2 x [8 x i32]]* %op16, i32 0, i32 0, i32 7
  store i32 0, i32* %op24
  %op25 = getelementptr [2 x [8 x i32]], [2 x [8 x i32]]* %op16, i32 0, i32 1, i32 0
  store i32 0, i32* %op25
  %op26 = getelementptr [2 x [8 x i32]], [2 x [8 x i32]]* %op16, i32 0, i32 1, i32 1
  store i32 0, i32* %op26
  %op27 = getelementptr [2 x [8 x i32]], [2 x [8 x i32]]* %op16, i32 0, i32 1, i32 2
  store i32 0, i32* %op27
  %op28 = getelementptr [2 x [8 x i32]], [2 x [8 x i32]]* %op16, i32 0, i32 1, i32 3
  store i32 0, i32* %op28
  %op29 = getelementptr [2 x [8 x i32]], [2 x [8 x i32]]* %op16, i32 0, i32 1, i32 4
  store i32 0, i32* %op29
  %op30 = getelementptr [2 x [8 x i32]], [2 x [8 x i32]]* %op16, i32 0, i32 1, i32 5
  store i32 0, i32* %op30
  %op31 = getelementptr [2 x [8 x i32]], [2 x [8 x i32]]* %op16, i32 0, i32 1, i32 6
  store i32 0, i32* %op31
  %op32 = getelementptr [2 x [8 x i32]], [2 x [8 x i32]]* %op16, i32 0, i32 1, i32 7
  store i32 0, i32* %op32
  store i32 0, i32* %op17
  store i32 9, i32* %op18
  store i32 8, i32* %op25
  store i32 3, i32* %op26
  %op39 = load i32, i32* %op15
  %op40 = icmp ne i32 %op39, 0
  br i1 %op40, label %label_6, label %label_7
label_6:                                                ; preds = %label_3
  %op41 = alloca [7 x [1 x [5 x i32]]]
  %op42 = getelementptr [7 x [1 x [5 x i32]]], [7 x [1 x [5 x i32]]]* %op41, i32 0, i32 0, i32 0, i32 0
  store i32 0, i32* %op42
  %op43 = getelementptr [7 x [1 x [5 x i32]]], [7 x [1 x [5 x i32]]]* %op41, i32 0, i32 0, i32 0, i32 1
  store i32 0, i32* %op43
  %op44 = getelementptr [7 x [1 x [5 x i32]]], [7 x [1 x [5 x i32]]]* %op41, i32 0, i32 0, i32 0, i32 2
  store i32 0, i32* %op44
  %op45 = getelementptr [7 x [1 x [5 x i32]]], [7 x [1 x [5 x i32]]]* %op41, i32 0, i32 0, i32 0, i32 3
  store i32 0, i32* %op45
  %op46 = getelementptr [7 x [1 x [5 x i32]]], [7 x [1 x [5 x i32]]]* %op41, i32 0, i32 0, i32 0, i32 4
  store i32 0, i32* %op46
  %op47 = getelementptr [7 x [1 x [5 x i32]]], [7 x [1 x [5 x i32]]]* %op41, i32 0, i32 1, i32 0, i32 0
  store i32 0, i32* %op47
  %op48 = getelementptr [7 x [1 x [5 x i32]]], [7 x [1 x [5 x i32]]]* %op41, i32 0, i32 1, i32 0, i32 1
  store i32 0, i32* %op48
  %op49 = getelementptr [7 x [1 x [5 x i32]]], [7 x [1 x [5 x i32]]]* %op41, i32 0, i32 1, i32 0, i32 2
  store i32 0, i32* %op49
  %op50 = getelementptr [7 x [1 x [5 x i32]]], [7 x [1 x [5 x i32]]]* %op41, i32 0, i32 1, i32 0, i32 3
  store i32 0, i32* %op50
  %op51 = getelementptr [7 x [1 x [5 x i32]]], [7 x [1 x [5 x i32]]]* %op41, i32 0, i32 1, i32 0, i32 4
  store i32 0, i32* %op51
  %op52 = getelementptr [7 x [1 x [5 x i32]]], [7 x [1 x [5 x i32]]]* %op41, i32 0, i32 2, i32 0, i32 0
  store i32 0, i32* %op52
  %op53 = getelementptr [7 x [1 x [5 x i32]]], [7 x [1 x [5 x i32]]]* %op41, i32 0, i32 2, i32 0, i32 1
  store i32 0, i32* %op53
  %op54 = getelementptr [7 x [1 x [5 x i32]]], [7 x [1 x [5 x i32]]]* %op41, i32 0, i32 2, i32 0, i32 2
  store i32 0, i32* %op54
  %op55 = getelementptr [7 x [1 x [5 x i32]]], [7 x [1 x [5 x i32]]]* %op41, i32 0, i32 2, i32 0, i32 3
  store i32 0, i32* %op55
  %op56 = getelementptr [7 x [1 x [5 x i32]]], [7 x [1 x [5 x i32]]]* %op41, i32 0, i32 2, i32 0, i32 4
  store i32 0, i32* %op56
  %op57 = getelementptr [7 x [1 x [5 x i32]]], [7 x [1 x [5 x i32]]]* %op41, i32 0, i32 3, i32 0, i32 0
  store i32 0, i32* %op57
  %op58 = getelementptr [7 x [1 x [5 x i32]]], [7 x [1 x [5 x i32]]]* %op41, i32 0, i32 3, i32 0, i32 1
  store i32 0, i32* %op58
  %op59 = getelementptr [7 x [1 x [5 x i32]]], [7 x [1 x [5 x i32]]]* %op41, i32 0, i32 3, i32 0, i32 2
  store i32 0, i32* %op59
  %op60 = getelementptr [7 x [1 x [5 x i32]]], [7 x [1 x [5 x i32]]]* %op41, i32 0, i32 3, i32 0, i32 3
  store i32 0, i32* %op60
  %op61 = getelementptr [7 x [1 x [5 x i32]]], [7 x [1 x [5 x i32]]]* %op41, i32 0, i32 3, i32 0, i32 4
  store i32 0, i32* %op61
  %op62 = getelementptr [7 x [1 x [5 x i32]]], [7 x [1 x [5 x i32]]]* %op41, i32 0, i32 4, i32 0, i32 0
  store i32 0, i32* %op62
  %op63 = getelementptr [7 x [1 x [5 x i32]]], [7 x [1 x [5 x i32]]]* %op41, i32 0, i32 4, i32 0, i32 1
  store i32 0, i32* %op63
  %op64 = getelementptr [7 x [1 x [5 x i32]]], [7 x [1 x [5 x i32]]]* %op41, i32 0, i32 4, i32 0, i32 2
  store i32 0, i32* %op64
  %op65 = getelementptr [7 x [1 x [5 x i32]]], [7 x [1 x [5 x i32]]]* %op41, i32 0, i32 4, i32 0, i32 3
  store i32 0, i32* %op65
  %op66 = getelementptr [7 x [1 x [5 x i32]]], [7 x [1 x [5 x i32]]]* %op41, i32 0, i32 4, i32 0, i32 4
  store i32 0, i32* %op66
  %op67 = getelementptr [7 x [1 x [5 x i32]]], [7 x [1 x [5 x i32]]]* %op41, i32 0, i32 5, i32 0, i32 0
  store i32 0, i32* %op67
  %op68 = getelementptr [7 x [1 x [5 x i32]]], [7 x [1 x [5 x i32]]]* %op41, i32 0, i32 5, i32 0, i32 1
  store i32 0, i32* %op68
  %op69 = getelementptr [7 x [1 x [5 x i32]]], [7 x [1 x [5 x i32]]]* %op41, i32 0, i32 5, i32 0, i32 2
  store i32 0, i32* %op69
  %op70 = getelementptr [7 x [1 x [5 x i32]]], [7 x [1 x [5 x i32]]]* %op41, i32 0, i32 5, i32 0, i32 3
  store i32 0, i32* %op70
  %op71 = getelementptr [7 x [1 x [5 x i32]]], [7 x [1 x [5 x i32]]]* %op41, i32 0, i32 5, i32 0, i32 4
  store i32 0, i32* %op71
  %op72 = getelementptr [7 x [1 x [5 x i32]]], [7 x [1 x [5 x i32]]]* %op41, i32 0, i32 6, i32 0, i32 0
  store i32 0, i32* %op72
  %op73 = getelementptr [7 x [1 x [5 x i32]]], [7 x [1 x [5 x i32]]]* %op41, i32 0, i32 6, i32 0, i32 1
  store i32 0, i32* %op73
  %op74 = getelementptr [7 x [1 x [5 x i32]]], [7 x [1 x [5 x i32]]]* %op41, i32 0, i32 6, i32 0, i32 2
  store i32 0, i32* %op74
  %op75 = getelementptr [7 x [1 x [5 x i32]]], [7 x [1 x [5 x i32]]]* %op41, i32 0, i32 6, i32 0, i32 3
  store i32 0, i32* %op75
  %op76 = getelementptr [7 x [1 x [5 x i32]]], [7 x [1 x [5 x i32]]]* %op41, i32 0, i32 6, i32 0, i32 4
  store i32 0, i32* %op76
  store i32 2, i32* %op52
  store i32 1, i32* %op53
  store i32 8, i32* %op54
  %op81 = getelementptr [7 x [1 x [5 x i32]]], [7 x [1 x [5 x i32]]]* %op41, i32 0, i32 2
  %op82 = getelementptr [1 x [5 x i32]], [1 x [5 x i32]]* %op81, i32 0, i32 0
  %op83 = getelementptr [5 x i32], [5 x i32]* %op82, i32 0, i32 0
  %op84 = load i32, i32* %op83
  call void @put_int(i32 %op84)
  %op88 = getelementptr [5 x i32], [5 x i32]* %op82, i32 0, i32 1
  %op89 = load i32, i32* %op88
  call void @put_int(i32 %op89)
  %op93 = getelementptr [5 x i32], [5 x i32]* %op82, i32 0, i32 2
  %op94 = load i32, i32* %op93
  call void @put_int(i32 %op94)
  br label %label_7
label_7:                                                ; preds = %label_3, %label_6
  call void @put_char(i32 10)
  %op95 = load i32, i32* @b
  call void @put_int(i32 %op95)
  call void @put_char(i32 10)
  %op96 = getelementptr [4 x i32], [4 x i32]* @c, i32 0, i32 0
  %op97 = load i32, i32* %op96
  call void @put_int(i32 %op97)
  %op98 = getelementptr [4 x i32], [4 x i32]* @c, i32 0, i32 1
  %op99 = load i32, i32* %op98
  call void @put_int(i32 %op99)
  %op101 = load i32, i32* %op15
  call void @put_int(i32 %op101)
  %op102 = getelementptr [4 x i32], [4 x i32]* @c, i32 0, i32 3
  %op103 = load i32, i32* %op102
  call void @put_int(i32 %op103)
  call void @put_char(i32 10)
  br label %label_ret
}
