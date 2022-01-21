declare i32 @get_int()

declare void @put_int(i32)

declare void @put_char(i32)

define i32 @main() {
label_entry:
  %op3 = alloca [10 x i32]
  br label %label_1
label_ret:                                                ; preds = %label_13
  ret i32 0
label_1:                                                ; preds = %label_entry, %label_2
  %op54 = phi i32 [ 0, %label_entry ], [ %op8, %label_2 ]
  %op6 = icmp slt i32 %op54, 10
  br i1 %op6, label %label_2, label %label_3
label_2:                                                ; preds = %label_1
  %op8 = add i32 %op54, 1
  %op10 = getelementptr [10 x i32], [10 x i32]* %op3, i32 0, i32 %op54
  store i32 %op8, i32* %op10
  br label %label_1
label_3:                                                ; preds = %label_1
  %op18 = call i32 @get_int()
  br label %label_4
label_4:                                                ; preds = %label_3, %label_10
  %op55 = phi i32 [ 4, %label_3 ], [ %op33, %label_10 ]
  %op56 = phi i32 [ 0, %label_3 ], [ %op58, %label_10 ]
  %op57 = phi i32 [ 9, %label_3 ], [ %op59, %label_10 ]
  %op26 = getelementptr [10 x i32], [10 x i32]* %op3, i32 0, i32 %op55
  %op27 = load i32, i32* %op26
  %op29 = icmp ne i32 %op27, %op18
  br i1 %op29, label %label_7, label %label_6
label_5:                                                ; preds = %label_7
  %op32 = add i32 %op57, %op56
  %op33 = sdiv i32 %op32, 2
  %op36 = getelementptr [10 x i32], [10 x i32]* %op3, i32 0, i32 %op33
  %op37 = load i32, i32* %op36
  %op38 = icmp slt i32 %op18, %op37
  br i1 %op38, label %label_8, label %label_9
label_6:                                                ; preds = %label_4, %label_7
  %op42 = load i32, i32* %op26
  %op43 = icmp eq i32 %op18, %op42
  br i1 %op43, label %label_11, label %label_12
label_7:                                                ; preds = %label_4
  %op46 = icmp slt i32 %op56, %op57
  br i1 %op46, label %label_5, label %label_6
label_8:                                                ; preds = %label_5
  %op48 = sub i32 %op33, 1
  br label %label_10
label_9:                                                ; preds = %label_5
  %op50 = add i32 %op33, 1
  br label %label_10
label_10:                                                ; preds = %label_8, %label_9
  %op58 = phi i32 [ %op50, %label_9 ], [ %op56, %label_8 ]
  %op59 = phi i32 [ %op57, %label_9 ], [ %op48, %label_8 ]
  br label %label_4
label_11:                                                ; preds = %label_6
  call void @put_int(i32 %op18)
  br label %label_13
label_12:                                                ; preds = %label_6
  call void @put_int(i32 0)
  br label %label_13
label_13:                                                ; preds = %label_11, %label_12
  call void @put_char(i32 10)
  br label %label_ret
}
