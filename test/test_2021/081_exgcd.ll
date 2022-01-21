declare void @put_int(i32)

define i32 @exgcd(i32 %arg0, i32 %arg1, i32* %arg2, i32* %arg3) {
label_entry:
  %op10 = icmp eq i32 %arg1, 0
  br i1 %op10, label %label_1, label %label_2
label_ret:                                                ; preds = %label_1, %label_2
  %op46 = phi i32 [ %op24, %label_2 ], [ %arg0, %label_1 ]
  ret i32 %op46
label_1:                                                ; preds = %label_entry
  %op13 = getelementptr i32, i32* %arg2, i32 0
  store i32 1, i32* %op13
  %op15 = getelementptr i32, i32* %arg3, i32 0
  store i32 0, i32* %op15
  br label %label_ret
label_2:                                                ; preds = %label_entry
  %op21 = srem i32 %arg0, %arg1
  %op24 = call i32 @exgcd(i32 %arg1, i32 %op21, i32* %arg2, i32* %arg3)
  %op27 = getelementptr i32, i32* %arg2, i32 0
  %op28 = load i32, i32* %op27
  %op30 = getelementptr i32, i32* %arg3, i32 0
  %op31 = load i32, i32* %op30
  store i32 %op31, i32* %op27
  %op37 = sdiv i32 %arg0, %arg1
  %op40 = load i32, i32* %op30
  %op41 = mul i32 %op37, %op40
  %op42 = sub i32 %op28, %op41
  store i32 %op42, i32* %op30
  br label %label_ret
}
define i32 @main() {
label_entry:
  %op3 = alloca [1 x i32]
  %op4 = getelementptr [1 x i32], [1 x i32]* %op3, i32 0, i32 0
  store i32 0, i32* %op4
  store i32 1, i32* %op4
  %op6 = alloca [1 x i32]
  %op7 = getelementptr [1 x i32], [1 x i32]* %op6, i32 0, i32 0
  store i32 0, i32* %op7
  store i32 1, i32* %op7
  %op13 = call i32 @exgcd(i32 7, i32 15, i32* %op4, i32* %op7)
  %op15 = load i32, i32* %op4
  %op17 = srem i32 %op15, 15
  %op19 = add i32 %op17, 15
  %op21 = srem i32 %op19, 15
  store i32 %op21, i32* %op4
  %op24 = load i32, i32* %op4
  call void @put_int(i32 %op24)
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 0
}
