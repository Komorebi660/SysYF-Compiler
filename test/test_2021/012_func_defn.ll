@a = global i32 zeroinitializer
@b = global float 0x4059000000000000
define i32 @func(i32 %arg0, i32 %arg1) {
label_entry:
  %op5 = load float, float* @b
  %op7 = sitofp i32 %arg0 to float
  %op8 = fadd float %op5, %op7
  %op10 = sitofp i32 %arg1 to float
  %op11 = fsub float %op8, %op10
  %op12 = fptosi float %op11 to i32
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op12
}
define i32 @main() {
label_entry:
  %op2 = load i32, i32* @a
  %op4 = call i32 @func(i32 %op2, i32 10)
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op4
}
