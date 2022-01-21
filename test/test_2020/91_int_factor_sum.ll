@N = global i32 zeroinitializer
@newline = global i32 zeroinitializer
define i32 @factor(i32 %arg0) {
label_entry:
  br label %label_1
label_ret:                                                ; preds = %label_1
  ret i32 %op20
label_1:                                                ; preds = %label_entry, %label_5
  %op20 = phi i32 [ 0, %label_entry ], [ %op22, %label_5 ]
  %op21 = phi i32 [ 1, %label_entry ], [ %op19, %label_5 ]
  %op8 = add i32 %arg0, 1
  %op9 = icmp slt i32 %op21, %op8
  br i1 %op9, label %label_2, label %label_ret
label_2:                                                ; preds = %label_1
  %op12 = srem i32 %arg0, %op21
  %op13 = icmp eq i32 %op12, 0
  br i1 %op13, label %label_4, label %label_5
label_4:                                                ; preds = %label_2
  %op17 = add i32 %op20, %op21
  br label %label_5
label_5:                                                ; preds = %label_2, %label_4
  %op22 = phi i32 [ %op20, %label_2 ], [ %op17, %label_4 ]
  %op19 = add i32 %op21, 1
  br label %label_1
}
define i32 @main() {
label_entry:
  store i32 4, i32* @N
  store i32 10, i32* @newline
  %op5 = call i32 @factor(i32 1478)
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op5
}
