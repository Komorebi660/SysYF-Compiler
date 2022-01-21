@n = global i32 zeroinitializer
@a = global [10 x i32] zeroinitializer
declare i32 @get_int()

declare void @put_int(i32)

declare void @put_char(i32)

define i32 @main() {
label_entry:
  %op1 = call i32 @get_int()
  store i32 %op1, i32* @n
  %op2 = load i32, i32* @n
  %op3 = icmp sgt i32 %op2, 10
  br i1 %op3, label %label_1, label %label_2
label_ret:                                                ; preds = %label_1, %label_5
  %op27 = phi i32 [ %op29, %label_5 ], [ 1, %label_1 ]
  ret i32 %op27
label_1:                                                ; preds = %label_entry
  br label %label_ret
label_2:                                                ; preds = %label_entry
  br label %label_3
label_3:                                                ; preds = %label_2, %label_4
  %op28 = phi i32 [ 0, %label_2 ], [ %op20, %label_4 ]
  %op29 = phi i32 [ 0, %label_2 ], [ %op18, %label_4 ]
  %op9 = load i32, i32* @n
  %op10 = icmp slt i32 %op28, %op9
  br i1 %op10, label %label_4, label %label_5
label_4:                                                ; preds = %label_3
  %op11 = call i32 @get_int()
  %op13 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 %op28
  store i32 %op11, i32* %op13
  %op17 = load i32, i32* %op13
  %op18 = add i32 %op29, %op17
  %op20 = add i32 %op28, 1
  br label %label_3
label_5:                                                ; preds = %label_3
  call void @put_int(i32 %op29)
  call void @put_char(i32 10)
  br label %label_ret
}
