@a = global [5 x [5 x i32]] [[5 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5], [5 x i32] [i32 zeroinitializer, i32 zeroinitializer, i32 zeroinitializer, i32 zeroinitializer, i32 zeroinitializer], [5 x i32] [i32 zeroinitializer, i32 zeroinitializer, i32 zeroinitializer, i32 zeroinitializer, i32 zeroinitializer], [5 x i32] [i32 zeroinitializer, i32 zeroinitializer, i32 zeroinitializer, i32 zeroinitializer, i32 zeroinitializer], [5 x i32] [i32 zeroinitializer, i32 zeroinitializer, i32 zeroinitializer, i32 zeroinitializer, i32 zeroinitializer]]
declare void @put_int(i32)

define i32 @func([5 x i32]* %arg0) {
label_entry:
  br label %label_1
label_ret:                                                ; preds = %label_1
  ret i32 %op24
label_1:                                                ; preds = %label_entry, %label_6
  %op24 = phi i32 [ 0, %label_entry ], [ %op27, %label_6 ]
  %op25 = phi i32 [ 0, %label_entry ], [ %op28, %label_6 ]
  %op26 = phi i32 [ 0, %label_entry ], [ %op23, %label_6 ]
  %op8 = icmp slt i32 %op26, 5
  br i1 %op8, label %label_2, label %label_ret
label_2:                                                ; preds = %label_1
  br label %label_4
label_4:                                                ; preds = %label_2, %label_5
  %op27 = phi i32 [ %op24, %label_2 ], [ %op19, %label_5 ]
  %op28 = phi i32 [ %op25, %label_2 ], [ %op21, %label_5 ]
  %op11 = icmp slt i32 %op28, 5
  br i1 %op11, label %label_5, label %label_6
label_5:                                                ; preds = %label_4
  %op15 = getelementptr [5 x i32], [5 x i32]* %arg0, i32 %op26
  %op17 = getelementptr [5 x i32], [5 x i32]* %op15, i32 0, i32 %op28
  %op18 = load i32, i32* %op17
  %op19 = add i32 %op27, %op18
  %op21 = add i32 %op28, 1
  br label %label_4
label_6:                                                ; preds = %label_4
  %op23 = add i32 %op26, 1
  br label %label_1
}
define i32 @main() {
label_entry:
  %op1 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* @a, i32 0, i32 0
  %op2 = call i32 @func([5 x i32]* %op1)
  call void @put_int(i32 %op2)
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 0
}
