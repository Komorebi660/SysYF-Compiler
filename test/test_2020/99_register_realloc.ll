define i32 @func(i32 %arg0, i32 %arg1) {
label_entry:
  %op111 = sub i32 %arg0, %arg1
  %op112 = add i32 %op111, 10
  %op187 = add i32 %op112, 10
  %op189 = add i32 %op187, 20
  %op191 = add i32 %op189, 30
  %op193 = add i32 %op191, 40
  %op195 = sub i32 %op193, 2
  %op197 = sub i32 %op195, 4
  %op199 = sub i32 %op197, 6
  %op201 = sub i32 %op199, 8
  %op203 = add i32 %op201, 3
  %op205 = add i32 %op203, 6
  %op207 = add i32 %op205, 9
  %op209 = add i32 %op207, 12
  %op211 = sub i32 %op209, 4
  %op213 = sub i32 %op211, 8
  %op215 = sub i32 %op213, 12
  %op217 = sub i32 %op215, 16
  %op219 = add i32 %op217, 5
  %op221 = add i32 %op219, 10
  %op223 = add i32 %op221, 15
  %op225 = add i32 %op223, 20
  %op227 = sub i32 %op225, 6
  %op229 = sub i32 %op227, 12
  %op231 = sub i32 %op229, 18
  %op233 = sub i32 %op231, 24
  %op235 = add i32 %op233, 7
  %op237 = add i32 %op235, 14
  %op239 = add i32 %op237, 21
  %op241 = add i32 %op239, 28
  %op243 = sub i32 %op241, 8
  %op245 = sub i32 %op243, 16
  %op247 = sub i32 %op245, 24
  %op249 = sub i32 %op247, 32
  %op251 = add i32 %op249, 9
  %op253 = add i32 %op251, 18
  %op255 = add i32 %op253, 27
  %op257 = add i32 %op255, 36
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op257
}
define i32 @main() {
label_entry:
  %op7 = call i32 @func(i32 1, i32 19)
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op7
}
