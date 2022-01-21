@g = global i32 zeroinitializer
@h = global i32 zeroinitializer
@f = global i32 zeroinitializer
@e = global i32 zeroinitializer
define i32 @EightWhile() {
label_entry:
  br label %label_1
label_ret:                                                ; preds = %label_3
  ret i32 %op24
label_1:                                                ; preds = %label_entry, %label_6
  %op67 = phi i32 [ 10, %label_entry ], [ %op71, %label_6 ]
  %op68 = phi i32 [ 7, %label_entry ], [ %op72, %label_6 ]
  %op69 = phi i32 [ 6, %label_entry ], [ %op30, %label_6 ]
  %op70 = phi i32 [ 5, %label_entry ], [ %op9, %label_6 ]
  %op7 = icmp slt i32 %op70, 20
  br i1 %op7, label %label_2, label %label_3
label_2:                                                ; preds = %label_1
  %op9 = add i32 %op70, 3
  br label %label_4
label_3:                                                ; preds = %label_1
  %op13 = add i32 %op69, %op67
  %op14 = add i32 %op70, %op13
  %op16 = add i32 %op14, %op68
  %op17 = load i32, i32* @e
  %op19 = add i32 %op17, %op67
  %op20 = load i32, i32* @g
  %op21 = sub i32 %op19, %op20
  %op22 = load i32, i32* @h
  %op23 = add i32 %op21, %op22
  %op24 = sub i32 %op16, %op23
  br label %label_ret
label_4:                                                ; preds = %label_2, %label_9
  %op71 = phi i32 [ %op67, %label_2 ], [ %op74, %label_9 ]
  %op72 = phi i32 [ %op68, %label_2 ], [ %op36, %label_9 ]
  %op73 = phi i32 [ %op69, %label_2 ], [ %op28, %label_9 ]
  %op26 = icmp slt i32 %op73, 10
  br i1 %op26, label %label_5, label %label_6
label_5:                                                ; preds = %label_4
  %op28 = add i32 %op73, 1
  br label %label_7
label_6:                                                ; preds = %label_4
  %op30 = sub i32 %op73, 2
  br label %label_1
label_7:                                                ; preds = %label_5, %label_12
  %op74 = phi i32 [ %op71, %label_5 ], [ %op42, %label_12 ]
  %op75 = phi i32 [ %op72, %label_5 ], [ %op34, %label_12 ]
  %op32 = icmp eq i32 %op75, 7
  br i1 %op32, label %label_8, label %label_9
label_8:                                                ; preds = %label_7
  %op34 = sub i32 %op75, 1
  br label %label_10
label_9:                                                ; preds = %label_7
  %op36 = add i32 %op75, 1
  br label %label_4
label_10:                                                ; preds = %label_8, %label_15
  %op76 = phi i32 [ %op74, %label_8 ], [ %op40, %label_15 ]
  %op38 = icmp slt i32 %op76, 20
  br i1 %op38, label %label_11, label %label_12
label_11:                                                ; preds = %label_10
  %op40 = add i32 %op76, 3
  br label %label_13
label_12:                                                ; preds = %label_10
  %op42 = sub i32 %op76, 1
  br label %label_7
label_13:                                                ; preds = %label_11, %label_18
  %op43 = load i32, i32* @e
  %op44 = icmp sgt i32 %op43, 1
  br i1 %op44, label %label_14, label %label_15
label_14:                                                ; preds = %label_13
  %op45 = load i32, i32* @e
  %op46 = sub i32 %op45, 1
  store i32 %op46, i32* @e
  br label %label_16
label_15:                                                ; preds = %label_13
  %op47 = load i32, i32* @e
  %op48 = add i32 %op47, 1
  store i32 %op48, i32* @e
  br label %label_10
label_16:                                                ; preds = %label_14, %label_21
  %op49 = load i32, i32* @f
  %op50 = icmp sgt i32 %op49, 2
  br i1 %op50, label %label_17, label %label_18
label_17:                                                ; preds = %label_16
  %op51 = load i32, i32* @f
  %op52 = sub i32 %op51, 2
  store i32 %op52, i32* @f
  br label %label_19
label_18:                                                ; preds = %label_16
  %op53 = load i32, i32* @f
  %op54 = add i32 %op53, 1
  store i32 %op54, i32* @f
  br label %label_13
label_19:                                                ; preds = %label_17, %label_24
  %op55 = load i32, i32* @g
  %op56 = icmp slt i32 %op55, 3
  br i1 %op56, label %label_20, label %label_21
label_20:                                                ; preds = %label_19
  %op57 = load i32, i32* @g
  %op58 = add i32 %op57, 10
  store i32 %op58, i32* @g
  br label %label_22
label_21:                                                ; preds = %label_19
  %op59 = load i32, i32* @g
  %op60 = sub i32 %op59, 8
  store i32 %op60, i32* @g
  br label %label_16
label_22:                                                ; preds = %label_20, %label_23
  %op61 = load i32, i32* @h
  %op62 = icmp slt i32 %op61, 10
  br i1 %op62, label %label_23, label %label_24
label_23:                                                ; preds = %label_22
  %op63 = load i32, i32* @h
  %op64 = add i32 %op63, 8
  store i32 %op64, i32* @h
  br label %label_22
label_24:                                                ; preds = %label_22
  %op65 = load i32, i32* @h
  %op66 = sub i32 %op65, 1
  store i32 %op66, i32* @h
  br label %label_19
}
define i32 @main() {
label_entry:
  store i32 1, i32* @g
  store i32 2, i32* @h
  store i32 4, i32* @e
  store i32 6, i32* @f
  %op1 = call i32 @EightWhile()
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op1
}
