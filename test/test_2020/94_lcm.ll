@n = global i32 zeroinitializer
declare i32 @get_int()

define i32 @gcd(i32 %arg0, i32 %arg1) {
label_entry:
  %op13 = icmp slt i32 %arg0, %arg1
  br i1 %op13, label %label_1, label %label_2
label_ret:                                                ; preds = %label_5
  ret i32 %op32
label_1:                                                ; preds = %label_entry
  br label %label_2
label_2:                                                ; preds = %label_entry, %label_1
  %op33 = phi i32 [ %arg1, %label_entry ], [ %arg0, %label_1 ]
  %op34 = phi i32 [ %arg0, %label_entry ], [ %arg1, %label_1 ]
  %op20 = srem i32 %op34, %op33
  br label %label_3
label_3:                                                ; preds = %label_2, %label_4
  %op35 = phi i32 [ %op20, %label_2 ], [ %op27, %label_4 ]
  %op36 = phi i32 [ %op33, %label_2 ], [ %op35, %label_4 ]
  %op22 = icmp ne i32 %op35, 0
  br i1 %op22, label %label_4, label %label_5
label_4:                                                ; preds = %label_3
  %op27 = srem i32 %op36, %op35
  br label %label_3
label_5:                                                ; preds = %label_3
  %op30 = mul i32 %arg0, %arg1
  %op32 = sdiv i32 %op30, %op36
  br label %label_ret
}
define i32 @main() {
label_entry:
  %op3 = call i32 @get_int()
  %op4 = call i32 @get_int()
  %op7 = call i32 @gcd(i32 %op3, i32 %op4)
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op7
}
