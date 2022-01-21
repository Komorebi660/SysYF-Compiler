declare i32 @get_int()

declare void @put_int(i32)

declare void @put_char(i32)

define i32 @main() {
label_entry:
  %op3 = alloca [10 x i32]
  br label %label_1
label_ret:                                                ; preds = %label_12
  ret i32 0
label_1:                                                ; preds = %label_entry, %label_2
  %op44 = phi i32 [ 0, %label_entry ], [ %op8, %label_2 ]
  %op6 = icmp slt i32 %op44, 10
  br i1 %op6, label %label_2, label %label_3
label_2:                                                ; preds = %label_1
  %op8 = add i32 %op44, 1
  %op10 = getelementptr [10 x i32], [10 x i32]* %op3, i32 0, i32 %op44
  store i32 %op8, i32* %op10
  br label %label_1
label_3:                                                ; preds = %label_1
  %op18 = call i32 @get_int()
  br label %label_4
label_4:                                                ; preds = %label_3, %label_9
  %op45 = phi i32 [ 0, %label_3 ], [ %op48, %label_9 ]
  %op46 = phi i32 [ 0, %label_3 ], [ %op49, %label_9 ]
  %op47 = phi i32 [ 0, %label_3 ], [ %op40, %label_9 ]
  %op28 = icmp slt i32 %op47, 10
  br i1 %op28, label %label_7, label %label_6
label_5:                                                ; preds = %label_7
  %op30 = getelementptr [10 x i32], [10 x i32]* %op3, i32 0, i32 %op47
  %op31 = load i32, i32* %op30
  %op33 = icmp eq i32 %op31, %op18
  br i1 %op33, label %label_8, label %label_9
label_6:                                                ; preds = %label_4, %label_7
  %op35 = icmp eq i32 %op46, 1
  br i1 %op35, label %label_10, label %label_11
label_7:                                                ; preds = %label_4
  %op37 = icmp eq i32 %op46, 0
  br i1 %op37, label %label_5, label %label_6
label_8:                                                ; preds = %label_5
  br label %label_9
label_9:                                                ; preds = %label_5, %label_8
  %op48 = phi i32 [ %op45, %label_5 ], [ %op47, %label_8 ]
  %op49 = phi i32 [ %op46, %label_5 ], [ 1, %label_8 ]
  %op40 = add i32 %op47, 1
  br label %label_4
label_10:                                                ; preds = %label_6
  call void @put_int(i32 %op45)
  br label %label_12
label_11:                                                ; preds = %label_6
  call void @put_int(i32 0)
  br label %label_12
label_12:                                                ; preds = %label_10, %label_11
  call void @put_char(i32 10)
  br label %label_ret
}
