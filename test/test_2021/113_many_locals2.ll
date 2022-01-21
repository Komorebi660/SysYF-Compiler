@n = global i32 zeroinitializer
declare i32 @get_int()

declare void @put_int(i32)

declare void @put_char(i32)

define i32 @main() {
label_entry:
  %op32 = call i32 @get_int()
  br label %label_1
label_ret:                                                ; preds = %label_3
  ret i32 25
label_1:                                                ; preds = %label_entry, %label_2
  %op132 = phi i32 [ %op32, %label_entry ], [ %op37, %label_2 ]
  %op35 = icmp eq i32 %op132, 5
  br i1 %op35, label %label_2, label %label_3
label_2:                                                ; preds = %label_1
  %op37 = add i32 %op132, 1
  br label %label_1
label_3:                                                ; preds = %label_1
  call void @put_int(i32 0)
  call void @put_int(i32 1)
  call void @put_int(i32 2)
  call void @put_int(i32 3)
  call void @put_int(i32 4)
  call void @put_int(i32 5)
  call void @put_int(i32 6)
  call void @put_int(i32 7)
  call void @put_int(i32 8)
  call void @put_int(i32 9)
  call void @put_int(i32 10)
  call void @put_int(i32 11)
  call void @put_int(i32 12)
  call void @put_int(i32 13)
  call void @put_int(i32 14)
  call void @put_int(i32 15)
  call void @put_int(i32 16)
  call void @put_int(i32 17)
  call void @put_int(i32 18)
  call void @put_int(i32 19)
  call void @put_int(i32 20)
  call void @put_int(i32 21)
  call void @put_int(i32 22)
  call void @put_int(i32 23)
  call void @put_int(i32 24)
  call void @put_int(i32 25)
  call void @put_int(i32 26)
  call void @put_int(i32 27)
  call void @put_int(i32 28)
  call void @put_int(i32 29)
  call void @put_char(i32 10)
  call void @put_int(i32 %op132)
  call void @put_char(i32 10)
  br label %label_ret
}
