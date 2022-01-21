@n = global i32 zeroinitializer
declare i32 @get_int()

declare void @put_int(i32)

declare void @put_char(i32)

define i32 @main() {
label_entry:
  %op3 = call i32 @get_int()
  %op4 = call i32 @get_int()
  call void @put_int(i32 %op4)
  call void @put_char(i32 10)
  call void @put_int(i32 %op3)
  call void @put_char(i32 10)
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 0
}
