@N = global i32 zeroinitializer
@newline = global i32 zeroinitializer
declare void @put_int(i32)

declare void @put_char(i32)

define i32 @split(i32 %arg0, i32* %arg1) {
label_entry:
  %op6 = load i32, i32* @N
  %op7 = sub i32 %op6, 1
  br label %label_1
label_ret:                                                ; preds = %label_1
  ret i32 0
label_1:                                                ; preds = %label_entry, %label_2
  %op20 = phi i32 [ %op7, %label_entry ], [ %op19, %label_2 ]
  %op21 = phi i32 [ %arg0, %label_entry ], [ %op17, %label_2 ]
  %op10 = icmp ne i32 %op20, -1
  br i1 %op10, label %label_2, label %label_ret
label_2:                                                ; preds = %label_1
  %op12 = srem i32 %op21, 10
  %op15 = getelementptr i32, i32* %arg1, i32 %op20
  store i32 %op12, i32* %op15
  %op17 = sdiv i32 %op21, 10
  %op19 = sub i32 %op20, 1
  br label %label_1
}
define i32 @main() {
label_entry:
  store i32 4, i32* @N
  store i32 10, i32* @newline
  %op3 = alloca [4 x i32]
  %op5 = getelementptr [4 x i32], [4 x i32]* %op3, i32 0, i32 0
  %op6 = call i32 @split(i32 1478, i32* %op5)
  br label %label_4
label_ret:                                                ; preds = %label_4
  ret i32 0
label_4:                                                ; preds = %label_entry, %label_5
  %op18 = phi i32 [ 0, %label_entry ], [ %op17, %label_5 ]
  %op10 = icmp slt i32 %op18, 4
  br i1 %op10, label %label_5, label %label_ret
label_5:                                                ; preds = %label_4
  %op12 = getelementptr [4 x i32], [4 x i32]* %op3, i32 0, i32 %op18
  %op13 = load i32, i32* %op12
  call void @put_int(i32 %op13)
  %op15 = load i32, i32* @newline
  call void @put_char(i32 %op15)
  %op17 = add i32 %op18, 1
  br label %label_4
}
