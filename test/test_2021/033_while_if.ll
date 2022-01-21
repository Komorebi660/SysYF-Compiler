declare void @put_int(i32)

define i32 @get_one(i32 %arg0) {
label_entry:
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 1
}
define i32 @deepWhileBr(i32 %arg0, i32 %arg1) {
label_entry:
  %op8 = add i32 %arg0, %arg1
  br label %label_1
label_ret:                                                ; preds = %label_1
  ret i32 %op30
label_1:                                                ; preds = %label_entry, %label_5
  %op30 = phi i32 [ %op8, %label_entry ], [ %op32, %label_5 ]
  %op11 = icmp slt i32 %op30, 75
  br i1 %op11, label %label_2, label %label_ret
label_2:                                                ; preds = %label_1
  %op14 = icmp slt i32 %op30, 100
  br i1 %op14, label %label_4, label %label_5
label_4:                                                ; preds = %label_2
  %op18 = add i32 %op30, 42
  %op20 = icmp sgt i32 %op18, 99
  br i1 %op20, label %label_6, label %label_7
label_5:                                                ; preds = %label_2, %label_7
  %op32 = phi i32 [ %op30, %label_2 ], [ %op34, %label_7 ]
  br label %label_1
label_6:                                                ; preds = %label_4
  %op24 = call i32 @get_one(i32 0)
  %op25 = icmp eq i32 %op24, 1
  br i1 %op25, label %label_8, label %label_9
label_7:                                                ; preds = %label_4, %label_9
  %op34 = phi i32 [ %op18, %label_4 ], [ %op35, %label_9 ]
  br label %label_5
label_8:                                                ; preds = %label_6
  br label %label_9
label_9:                                                ; preds = %label_6, %label_8
  %op35 = phi i32 [ %op18, %label_6 ], [ 168, %label_8 ]
  br label %label_7
}
define i32 @main() {
label_entry:
  %op4 = call i32 @deepWhileBr(i32 2, i32 2)
  call void @put_int(i32 %op4)
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 0
}
