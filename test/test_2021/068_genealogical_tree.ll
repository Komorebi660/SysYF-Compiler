@map = global [10 x [10 x i32]] zeroinitializer
@indegree = global [10 x i32] zeroinitializer
@queue = global [10 x i32] zeroinitializer
declare i32 @get_int()

declare void @put_int(i32)

declare void @put_char(i32)

define void @topo(i32 %arg0) {
label_entry:
  br label %label_1
label_ret:                                                ; preds = %label_14
  ret void
label_1:                                                ; preds = %label_entry, %label_11
  %op54 = phi i32 [ 1, %label_entry ], [ %op36, %label_11 ]
  %op55 = phi i32 [ 0, %label_entry ], [ %op20, %label_11 ]
  %op56 = phi i32 [ 0, %label_entry ], [ %op58, %label_11 ]
  %op8 = icmp sle i32 %op54, %arg0
  br i1 %op8, label %label_2, label %label_3
label_2:                                                ; preds = %label_1
  br label %label_4
label_3:                                                ; preds = %label_1
  br label %label_14
label_4:                                                ; preds = %label_2, %label_8
  %op57 = phi i32 [ 1, %label_2 ], [ %op25, %label_8 ]
  %op11 = icmp sle i32 %op57, %arg0
  br i1 %op11, label %label_5, label %label_6
label_5:                                                ; preds = %label_4
  %op13 = getelementptr [10 x i32], [10 x i32]* @indegree, i32 0, i32 %op57
  %op14 = load i32, i32* %op13
  %op15 = icmp eq i32 %op14, 0
  br i1 %op15, label %label_7, label %label_8
label_6:                                                ; preds = %label_4, %label_7
  %op58 = phi i32 [ %op56, %label_4 ], [ %op57, %label_7 ]
  %op18 = getelementptr [10 x i32], [10 x i32]* @queue, i32 0, i32 %op55
  store i32 %op58, i32* %op18
  %op20 = add i32 %op55, 1
  %op22 = getelementptr [10 x i32], [10 x i32]* @indegree, i32 0, i32 %op58
  store i32 -1, i32* %op22
  br label %label_9
label_7:                                                ; preds = %label_5
  br label %label_6
label_8:                                                ; preds = %label_5
  %op25 = add i32 %op57, 1
  br label %label_4
label_9:                                                ; preds = %label_6, %label_13
  %op59 = phi i32 [ 1, %label_6 ], [ %op44, %label_13 ]
  %op28 = icmp sle i32 %op59, %arg0
  br i1 %op28, label %label_10, label %label_11
label_10:                                                ; preds = %label_9
  %op30 = getelementptr [10 x [10 x i32]], [10 x [10 x i32]]* @map, i32 0, i32 %op58
  %op32 = getelementptr [10 x i32], [10 x i32]* %op30, i32 0, i32 %op59
  %op33 = load i32, i32* %op32
  %op34 = icmp ne i32 %op33, 0
  br i1 %op34, label %label_12, label %label_13
label_11:                                                ; preds = %label_9
  %op36 = add i32 %op54, 1
  br label %label_1
label_12:                                                ; preds = %label_10
  %op38 = getelementptr [10 x i32], [10 x i32]* @indegree, i32 0, i32 %op59
  %op39 = load i32, i32* %op38
  %op40 = sub i32 %op39, 1
  store i32 %op40, i32* %op38
  br label %label_13
label_13:                                                ; preds = %label_10, %label_12
  %op44 = add i32 %op59, 1
  br label %label_9
label_14:                                                ; preds = %label_3, %label_15
  %op60 = phi i32 [ 0, %label_3 ], [ %op52, %label_15 ]
  %op47 = icmp slt i32 %op60, %arg0
  br i1 %op47, label %label_15, label %label_ret
label_15:                                                ; preds = %label_14
  %op49 = getelementptr [10 x i32], [10 x i32]* @queue, i32 0, i32 %op60
  %op50 = load i32, i32* %op49
  call void @put_int(i32 %op50)
  call void @put_char(i32 10)
  %op52 = add i32 %op60, 1
  br label %label_14
}
define i32 @main() {
label_entry:
  br label %label_17
label_ret:                                                ; preds = %label_19
  ret i32 0
label_17:                                                ; preds = %label_entry, %label_22
  %op25 = phi i32 [ 1, %label_entry ], [ %op24, %label_22 ]
  %op7 = icmp sle i32 %op25, 5
  br i1 %op7, label %label_18, label %label_19
label_18:                                                ; preds = %label_17
  %op8 = call i32 @get_int()
  br label %label_20
label_19:                                                ; preds = %label_17
  call void @topo(i32 5)
  br label %label_ret
label_20:                                                ; preds = %label_18, %label_21
  %op27 = phi i32 [ %op8, %label_18 ], [ %op22, %label_21 ]
  %op11 = icmp ne i32 %op27, 0
  br i1 %op11, label %label_21, label %label_22
label_21:                                                ; preds = %label_20
  %op13 = getelementptr [10 x [10 x i32]], [10 x [10 x i32]]* @map, i32 0, i32 %op25
  %op15 = getelementptr [10 x i32], [10 x i32]* %op13, i32 0, i32 %op27
  store i32 1, i32* %op15
  %op17 = getelementptr [10 x i32], [10 x i32]* @indegree, i32 0, i32 %op27
  %op18 = load i32, i32* %op17
  %op19 = add i32 %op18, 1
  store i32 %op19, i32* %op17
  %op22 = call i32 @get_int()
  br label %label_20
label_22:                                                ; preds = %label_20
  %op24 = add i32 %op25, 1
  br label %label_17
}
