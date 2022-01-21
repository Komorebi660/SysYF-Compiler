@s = global i32 0
define i32 @get_ans_se(i32 %arg0, i32 %arg1, i32 %arg2) {
label_entry:
  %op10 = icmp eq i32 %arg1, %arg2
  br i1 %op10, label %label_1, label %label_2
label_ret:                                                ; preds = %label_2
  ret i32 %op16
label_1:                                                ; preds = %label_entry
  br label %label_2
label_2:                                                ; preds = %label_entry, %label_1
  %op21 = phi i32 [ 0, %label_entry ], [ 1, %label_1 ]
  %op13 = mul i32 %arg0, 2
  %op16 = add i32 %op13, %op21
  %op17 = load i32, i32* @s
  %op19 = add i32 %op17, %op16
  store i32 %op19, i32* @s
  br label %label_ret
}
define i32 @get_ans(i32 %arg0, i32 %arg1, i32 %arg2) {
label_entry:
  %op10 = icmp eq i32 %arg1, %arg2
  br i1 %op10, label %label_3, label %label_4
label_ret:                                                ; preds = %label_4
  ret i32 %op16
label_3:                                                ; preds = %label_entry
  br label %label_4
label_4:                                                ; preds = %label_entry, %label_3
  %op18 = phi i32 [ 0, %label_entry ], [ 1, %label_3 ]
  %op13 = mul i32 %arg0, 2
  %op16 = add i32 %op13, %op18
  br label %label_ret
}
define i32 @main() {
label_entry:
  %op12 = call i32 @get_ans(i32 0, i32 -2147483648, i32 -2147483648)
  %op17 = call i32 @get_ans(i32 %op12, i32 -2147483647, i32 -2147483647)
  %op23 = call i32 @get_ans(i32 %op17, i32 -2147483648, i32 -2147483648)
  %op28 = call i32 @get_ans(i32 %op23, i32 -2147483648, i32 2147483647)
  %op34 = call i32 @get_ans(i32 %op28, i32 -1073741824, i32 -1073741823)
  %op40 = call i32 @get_ans(i32 %op34, i32 -2147483648, i32 -2147483648)
  %op45 = call i32 @get_ans(i32 %op40, i32 -2147483648, i32 2147483647)
  %op48 = call i32 @get_ans(i32 0, i32 -2147483647, i32 2147483647)
  %op52 = call i32 @get_ans(i32 %op48, i32 -2147483647, i32 2147483646)
  %op56 = call i32 @get_ans(i32 %op52, i32 2147483647, i32 2147483646)
  %op62 = call i32 @get_ans(i32 %op56, i32 -1073741824, i32 -1073741824)
  %op65 = call i32 @get_ans_se(i32 0, i32 -2147483648, i32 -2147483648)
  %op70 = call i32 @get_ans_se(i32 %op65, i32 -2147483647, i32 -2147483647)
  %op76 = call i32 @get_ans_se(i32 %op70, i32 -2147483648, i32 -2147483648)
  %op81 = call i32 @get_ans_se(i32 %op76, i32 -2147483648, i32 2147483647)
  %op87 = call i32 @get_ans_se(i32 %op81, i32 -1073741824, i32 -1073741823)
  %op93 = call i32 @get_ans_se(i32 %op87, i32 -2147483648, i32 -2147483648)
  %op98 = call i32 @get_ans_se(i32 %op93, i32 -2147483648, i32 2147483647)
  %op101 = call i32 @get_ans_se(i32 0, i32 -2147483647, i32 2147483647)
  %op105 = call i32 @get_ans_se(i32 %op101, i32 -2147483647, i32 2147483646)
  %op109 = call i32 @get_ans_se(i32 %op105, i32 2147483647, i32 2147483646)
  %op115 = call i32 @get_ans_se(i32 %op109, i32 -1073741824, i32 -1073741824)
  %op118 = add i32 %op45, %op62
  %op120 = add i32 %op118, %op98
  %op122 = add i32 %op120, %op115
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op122
}
