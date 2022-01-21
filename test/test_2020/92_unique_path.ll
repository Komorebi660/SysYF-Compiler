define i32 @uniquePaths(i32 %arg0, i32 %arg1) {
label_entry:
  %op6 = icmp eq i32 %arg0, 1
  br i1 %op6, label %label_1, label %label_3
label_ret:                                                ; preds = %label_1, %label_12
  %op71 = phi i32 [ %op42, %label_12 ], [ 1, %label_1 ]
  ret i32 %op71
label_1:                                                ; preds = %label_entry, %label_3
  br label %label_ret
label_2:                                                ; preds = %label_3
  %op8 = alloca [9 x i32]
  br label %label_4
label_3:                                                ; preds = %label_entry
  %op12 = icmp eq i32 %arg1, 1
  br i1 %op12, label %label_1, label %label_2
label_4:                                                ; preds = %label_2, %label_5
  %op72 = phi i32 [ 0, %label_2 ], [ %op23, %label_5 ]
  %op15 = icmp slt i32 %op72, %arg0
  br i1 %op15, label %label_5, label %label_6
label_5:                                                ; preds = %label_4
  %op17 = mul i32 %op72, 3
  %op19 = add i32 %op17, %arg1
  %op20 = sub i32 %op19, 1
  %op21 = getelementptr [9 x i32], [9 x i32]* %op8, i32 0, i32 %op20
  store i32 1, i32* %op21
  %op23 = add i32 %op72, 1
  br label %label_4
label_6:                                                ; preds = %label_4
  br label %label_7
label_7:                                                ; preds = %label_6, %label_8
  %op73 = phi i32 [ 0, %label_6 ], [ %op34, %label_8 ]
  %op26 = icmp slt i32 %op73, %arg1
  br i1 %op26, label %label_8, label %label_9
label_8:                                                ; preds = %label_7
  %op28 = sub i32 %arg0, 1
  %op29 = mul i32 %op28, 3
  %op31 = add i32 %op29, %op73
  %op32 = getelementptr [9 x i32], [9 x i32]* %op8, i32 0, i32 %op31
  store i32 1, i32* %op32
  %op34 = add i32 %op73, 1
  br label %label_7
label_9:                                                ; preds = %label_7
  %op36 = sub i32 %arg0, 2
  br label %label_10
label_10:                                                ; preds = %label_9, %label_15
  %op75 = phi i32 [ %op36, %label_9 ], [ %op68, %label_15 ]
  %op38 = icmp sgt i32 %op75, -1
  br i1 %op38, label %label_11, label %label_12
label_11:                                                ; preds = %label_10
  %op40 = sub i32 %arg1, 2
  br label %label_13
label_12:                                                ; preds = %label_10
  %op41 = getelementptr [9 x i32], [9 x i32]* %op8, i32 0, i32 0
  %op42 = load i32, i32* %op41
  br label %label_ret
label_13:                                                ; preds = %label_11, %label_14
  %op76 = phi i32 [ %op40, %label_11 ], [ %op66, %label_14 ]
  %op44 = icmp sgt i32 %op76, -1
  br i1 %op44, label %label_14, label %label_15
label_14:                                                ; preds = %label_13
  %op46 = add i32 %op75, 1
  %op47 = mul i32 %op46, 3
  %op49 = add i32 %op47, %op76
  %op50 = getelementptr [9 x i32], [9 x i32]* %op8, i32 0, i32 %op49
  %op51 = load i32, i32* %op50
  %op53 = mul i32 %op75, 3
  %op55 = add i32 %op53, %op76
  %op56 = add i32 %op55, 1
  %op57 = getelementptr [9 x i32], [9 x i32]* %op8, i32 0, i32 %op56
  %op58 = load i32, i32* %op57
  %op59 = add i32 %op51, %op58
  %op64 = getelementptr [9 x i32], [9 x i32]* %op8, i32 0, i32 %op55
  store i32 %op59, i32* %op64
  %op66 = sub i32 %op76, 1
  br label %label_13
label_15:                                                ; preds = %label_13
  %op68 = sub i32 %op75, 1
  br label %label_10
}
define i32 @main() {
label_entry:
  %op5 = call i32 @uniquePaths(i32 3, i32 3)
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op5
}
