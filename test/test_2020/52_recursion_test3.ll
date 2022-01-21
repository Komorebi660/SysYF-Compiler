@a = global i32 zeroinitializer
@r = global i32 zeroinitializer
define i32 @fac(i32 %arg0) {
label_entry:
  %op4 = icmp slt i32 %arg0, 2
  br i1 %op4, label %label_1, label %label_2
label_ret:                                                ; preds = %label_1, %label_2
  %op14 = phi i32 [ %op13, %label_2 ], [ 1, %label_1 ]
  ret i32 %op14
label_1:                                                ; preds = %label_entry
  br label %label_ret
label_2:                                                ; preds = %label_entry
  %op7 = sub i32 %arg0, 1
  store i32 %op7, i32* @a
  %op8 = load i32, i32* @a
  %op9 = call i32 @fac(i32 %op8)
  store i32 %op9, i32* @r
  %op11 = load i32, i32* @r
  %op12 = mul i32 %arg0, %op11
  store i32 %op12, i32* @r
  %op13 = load i32, i32* @r
  br label %label_ret
}
define i32 @main() {
label_entry:
  %op3 = call i32 @fac(i32 5)
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op3
}
