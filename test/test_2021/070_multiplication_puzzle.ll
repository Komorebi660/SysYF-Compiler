@a = global [6 x i32] [i32 10, i32 1, i32 50, i32 50, i32 20, i32 5]
@dp = global [10 x [10 x i32]] zeroinitializer
declare void @put_int(i32)

define i32 @main() {
label_entry:
  br label %label_1
label_ret:                                                ; preds = %label_3
  ret i32 0
label_1:                                                ; preds = %label_entry, %label_6
  %op82 = phi i32 [ 3, %label_entry ], [ %op29, %label_6 ]
  %op10 = icmp sle i32 %op82, 6
  br i1 %op10, label %label_2, label %label_3
label_2:                                                ; preds = %label_1
  br label %label_4
label_3:                                                ; preds = %label_1
  %op11 = getelementptr [10 x [10 x i32]], [10 x [10 x i32]]* @dp, i32 0, i32 0
  %op14 = getelementptr [10 x i32], [10 x i32]* %op11, i32 0, i32 5
  %op15 = load i32, i32* %op14
  call void @put_int(i32 %op15)
  br label %label_ret
label_4:                                                ; preds = %label_2, %label_9
  %op86 = phi i32 [ 0, %label_2 ], [ %op27, %label_9 ]
  %op19 = sub i32 6, %op82
  %op20 = add i32 %op19, 1
  %op21 = icmp slt i32 %op86, %op20
  br i1 %op21, label %label_5, label %label_6
label_5:                                                ; preds = %label_4
  %op24 = add i32 %op86, %op82
  %op25 = sub i32 %op24, 1
  %op27 = add i32 %op86, 1
  br label %label_7
label_6:                                                ; preds = %label_4
  %op29 = add i32 %op82, 1
  br label %label_1
label_7:                                                ; preds = %label_5, %label_11
  %op88 = phi i32 [ %op27, %label_5 ], [ %op70, %label_11 ]
  %op32 = icmp slt i32 %op88, %op25
  br i1 %op32, label %label_8, label %label_9
label_8:                                                ; preds = %label_7
  %op34 = getelementptr [10 x [10 x i32]], [10 x [10 x i32]]* @dp, i32 0, i32 %op86
  %op36 = getelementptr [10 x i32], [10 x i32]* %op34, i32 0, i32 %op88
  %op37 = load i32, i32* %op36
  %op39 = getelementptr [10 x [10 x i32]], [10 x [10 x i32]]* @dp, i32 0, i32 %op88
  %op41 = getelementptr [10 x i32], [10 x i32]* %op39, i32 0, i32 %op25
  %op42 = load i32, i32* %op41
  %op43 = add i32 %op37, %op42
  %op45 = getelementptr [6 x i32], [6 x i32]* @a, i32 0, i32 %op86
  %op46 = load i32, i32* %op45
  %op48 = getelementptr [6 x i32], [6 x i32]* @a, i32 0, i32 %op88
  %op49 = load i32, i32* %op48
  %op50 = mul i32 %op46, %op49
  %op52 = getelementptr [6 x i32], [6 x i32]* @a, i32 0, i32 %op25
  %op53 = load i32, i32* %op52
  %op54 = mul i32 %op50, %op53
  %op55 = add i32 %op43, %op54
  %op59 = getelementptr [10 x i32], [10 x i32]* %op34, i32 0, i32 %op25
  %op60 = load i32, i32* %op59
  %op61 = icmp eq i32 %op60, 0
  br i1 %op61, label %label_10, label %label_12
label_9:                                                ; preds = %label_7
  br label %label_4
label_10:                                                ; preds = %label_8, %label_12
  %op68 = getelementptr [10 x i32], [10 x i32]* %op34, i32 0, i32 %op25
  store i32 %op55, i32* %op68
  br label %label_11
label_11:                                                ; preds = %label_12, %label_10
  %op70 = add i32 %op88, 1
  br label %label_7
label_12:                                                ; preds = %label_8
  %op75 = getelementptr [10 x i32], [10 x i32]* %op34, i32 0, i32 %op25
  %op76 = load i32, i32* %op75
  %op77 = icmp slt i32 %op55, %op76
  br i1 %op77, label %label_10, label %label_11
}
