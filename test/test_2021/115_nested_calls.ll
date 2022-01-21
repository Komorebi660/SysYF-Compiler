declare i32 @get_int()

define i32 @func1(i32 %arg0, i32 %arg1, i32 %arg2) {
label_entry:
  %op8 = icmp eq i32 %arg2, 0
  br i1 %op8, label %label_1, label %label_2
label_ret:                                                ; preds = %label_1, %label_2
  %op18 = phi i32 [ %op17, %label_2 ], [ %op12, %label_1 ]
  ret i32 %op18
label_1:                                                ; preds = %label_entry
  %op12 = mul i32 %arg0, %arg1
  br label %label_ret
label_2:                                                ; preds = %label_entry
  %op16 = sub i32 %arg1, %arg2
  %op17 = call i32 @func1(i32 %arg0, i32 %op16, i32 0)
  br label %label_ret
}
define i32 @func2(i32 %arg0, i32 %arg1) {
label_entry:
  %op6 = icmp ne i32 %arg1, 0
  br i1 %op6, label %label_4, label %label_5
label_ret:                                                ; preds = %label_4, %label_5
  %op13 = phi i32 [ %arg0, %label_5 ], [ %op11, %label_4 ]
  ret i32 %op13
label_4:                                                ; preds = %label_entry
  %op10 = srem i32 %arg0, %arg1
  %op11 = call i32 @func2(i32 %op10, i32 0)
  br label %label_ret
label_5:                                                ; preds = %label_entry
  br label %label_ret
}
define i32 @func3(i32 %arg0, i32 %arg1) {
label_entry:
  %op6 = icmp eq i32 %arg1, 0
  br i1 %op6, label %label_7, label %label_8
label_ret:                                                ; preds = %label_7, %label_8
  %op14 = phi i32 [ %op13, %label_8 ], [ %op9, %label_7 ]
  ret i32 %op14
label_7:                                                ; preds = %label_entry
  %op9 = add i32 %arg0, 1
  br label %label_ret
label_8:                                                ; preds = %label_entry
  %op12 = add i32 %arg0, %arg1
  %op13 = call i32 @func3(i32 %op12, i32 0)
  br label %label_ret
}
define i32 @func4(i32 %arg0, i32 %arg1, i32 %arg2) {
label_entry:
  %op8 = icmp ne i32 %arg0, 0
  br i1 %op8, label %label_10, label %label_11
label_ret:                                                ; preds = %label_10, %label_11
  %op12 = phi i32 [ %arg2, %label_11 ], [ %arg1, %label_10 ]
  ret i32 %op12
label_10:                                                ; preds = %label_entry
  br label %label_ret
label_11:                                                ; preds = %label_entry
  br label %label_ret
}
define i32 @func5(i32 %arg0) {
label_entry:
  %op4 = mul i32 %arg0, -1
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op4
}
define i32 @func6(i32 %arg0, i32 %arg1) {
label_entry:
  %op6 = icmp ne i32 %arg0, 0
  br i1 %op6, label %label_16, label %label_14
label_ret:                                                ; preds = %label_13, %label_14
  %op10 = phi i32 [ 0, %label_14 ], [ 1, %label_13 ]
  ret i32 %op10
label_13:                                                ; preds = %label_16
  br label %label_ret
label_14:                                                ; preds = %label_entry, %label_16
  br label %label_ret
label_16:                                                ; preds = %label_entry
  %op9 = icmp ne i32 %arg1, 0
  br i1 %op9, label %label_13, label %label_14
}
define i32 @func7(i32 %arg0) {
label_entry:
  %op4 = icmp eq i32 %arg0, 0
  br i1 %op4, label %label_17, label %label_18
label_ret:                                                ; preds = %label_17, %label_18
  %op6 = phi i32 [ 0, %label_18 ], [ 1, %label_17 ]
  ret i32 %op6
label_17:                                                ; preds = %label_entry
  br label %label_ret
label_18:                                                ; preds = %label_entry
  br label %label_ret
}
define i32 @main() {
label_entry:
  %op2 = call i32 @get_int()
  %op4 = call i32 @get_int()
  %op6 = call i32 @get_int()
  %op8 = call i32 @get_int()
  %op9 = alloca [10 x i32]
  br label %label_20
label_ret:                                                ; preds = %label_22
  ret i32 %op102
label_20:                                                ; preds = %label_entry, %label_21
  %op104 = phi i32 [ 0, %label_entry ], [ %op18, %label_21 ]
  %op13 = icmp slt i32 %op104, 10
  br i1 %op13, label %label_21, label %label_22
label_21:                                                ; preds = %label_20
  %op14 = call i32 @get_int()
  %op16 = getelementptr [10 x i32], [10 x i32]* %op9, i32 0, i32 %op104
  store i32 %op14, i32* %op16
  %op18 = add i32 %op104, 1
  br label %label_20
label_22:                                                ; preds = %label_20
  %op21 = call i32 @func7(i32 %op2)
  %op23 = call i32 @func5(i32 %op4)
  %op24 = call i32 @func6(i32 %op21, i32 %op23)
  %op26 = call i32 @func2(i32 %op24, i32 %op6)
  %op28 = call i32 @func3(i32 %op26, i32 %op8)
  %op29 = call i32 @func5(i32 %op28)
  %op30 = getelementptr [10 x i32], [10 x i32]* %op9, i32 0, i32 0
  %op31 = load i32, i32* %op30
  %op32 = getelementptr [10 x i32], [10 x i32]* %op9, i32 0, i32 1
  %op33 = load i32, i32* %op32
  %op34 = call i32 @func5(i32 %op33)
  %op35 = getelementptr [10 x i32], [10 x i32]* %op9, i32 0, i32 2
  %op36 = load i32, i32* %op35
  %op37 = getelementptr [10 x i32], [10 x i32]* %op9, i32 0, i32 3
  %op38 = load i32, i32* %op37
  %op39 = call i32 @func7(i32 %op38)
  %op40 = call i32 @func6(i32 %op36, i32 %op39)
  %op41 = getelementptr [10 x i32], [10 x i32]* %op9, i32 0, i32 4
  %op42 = load i32, i32* %op41
  %op43 = getelementptr [10 x i32], [10 x i32]* %op9, i32 0, i32 5
  %op44 = load i32, i32* %op43
  %op45 = call i32 @func7(i32 %op44)
  %op46 = call i32 @func2(i32 %op42, i32 %op45)
  %op47 = call i32 @func4(i32 %op34, i32 %op40, i32 %op46)
  %op48 = getelementptr [10 x i32], [10 x i32]* %op9, i32 0, i32 6
  %op49 = load i32, i32* %op48
  %op50 = call i32 @func3(i32 %op47, i32 %op49)
  %op51 = getelementptr [10 x i32], [10 x i32]* %op9, i32 0, i32 7
  %op52 = load i32, i32* %op51
  %op53 = call i32 @func2(i32 %op50, i32 %op52)
  %op54 = getelementptr [10 x i32], [10 x i32]* %op9, i32 0, i32 8
  %op55 = load i32, i32* %op54
  %op56 = getelementptr [10 x i32], [10 x i32]* %op9, i32 0, i32 9
  %op57 = load i32, i32* %op56
  %op58 = call i32 @func7(i32 %op57)
  %op59 = call i32 @func3(i32 %op55, i32 %op58)
  %op61 = call i32 @func1(i32 %op53, i32 %op59, i32 %op2)
  %op62 = call i32 @func4(i32 %op29, i32 %op31, i32 %op61)
  %op65 = call i32 @func7(i32 %op6)
  %op67 = call i32 @func3(i32 %op65, i32 %op8)
  %op68 = call i32 @func2(i32 %op4, i32 %op67)
  %op69 = call i32 @func3(i32 %op62, i32 %op68)
  %op71 = load i32, i32* %op30
  %op73 = load i32, i32* %op32
  %op74 = call i32 @func1(i32 %op69, i32 %op71, i32 %op73)
  %op76 = load i32, i32* %op35
  %op77 = call i32 @func2(i32 %op74, i32 %op76)
  %op79 = load i32, i32* %op37
  %op81 = load i32, i32* %op41
  %op83 = load i32, i32* %op43
  %op84 = call i32 @func5(i32 %op83)
  %op85 = call i32 @func3(i32 %op81, i32 %op84)
  %op87 = load i32, i32* %op48
  %op88 = call i32 @func5(i32 %op87)
  %op89 = call i32 @func2(i32 %op85, i32 %op88)
  %op91 = load i32, i32* %op51
  %op93 = load i32, i32* %op54
  %op94 = call i32 @func7(i32 %op93)
  %op95 = call i32 @func1(i32 %op89, i32 %op91, i32 %op94)
  %op97 = load i32, i32* %op56
  %op98 = call i32 @func5(i32 %op97)
  %op99 = call i32 @func2(i32 %op95, i32 %op98)
  %op101 = call i32 @func3(i32 %op99, i32 %op2)
  %op102 = call i32 @func1(i32 %op77, i32 %op79, i32 %op101)
  br label %label_ret
}
