declare void @put_int(i32)

define i32 @testParam8(i32 %arg0, i32 %arg1, i32 %arg2, i32 %arg3, i32 %arg4, i32 %arg5, i32 %arg6, i32 %arg7) {
label_entry:
  %op19 = sub i32 %arg0, %arg1
  %op21 = add i32 %op19, %arg2
  %op23 = sub i32 %op21, %arg3
  %op25 = sub i32 %op23, %arg4
  %op27 = sub i32 %op25, %arg5
  %op29 = add i32 %op27, %arg6
  %op31 = add i32 %op29, %arg7
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op31
}
define i32 @testParam16(i32 %arg0, i32 %arg1, i32 %arg2, i32 %arg3, i32 %arg4, i32 %arg5, i32 %arg6, i32 %arg7, i32 %arg8, i32 %arg9, i32 %arg10, i32 %arg11, i32 %arg12, i32 %arg13, i32 %arg14, i32 %arg15) {
label_entry:
  %op35 = add i32 %arg0, %arg1
  %op37 = add i32 %op35, %arg2
  %op39 = add i32 %op37, %arg3
  %op41 = sub i32 %op39, %arg4
  %op43 = add i32 %op41, %arg5
  %op45 = add i32 %op43, %arg6
  %op47 = add i32 %op45, %arg7
  %op49 = sub i32 %op47, %arg8
  %op51 = add i32 %op49, %arg9
  %op53 = sub i32 %op51, %arg10
  %op55 = add i32 %op53, %arg11
  %op57 = add i32 %op55, %arg12
  %op59 = add i32 %op57, %arg13
  %op61 = add i32 %op59, %arg14
  %op63 = add i32 %op61, %arg15
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op63
}
define i32 @testParam32(i32 %arg0, i32 %arg1, i32 %arg2, i32 %arg3, i32 %arg4, i32 %arg5, i32 %arg6, i32 %arg7, i32 %arg8, i32 %arg9, i32 %arg10, i32 %arg11, i32 %arg12, i32 %arg13, i32 %arg14, i32 %arg15, i32 %arg16, i32 %arg17, i32 %arg18, i32 %arg19, i32 %arg20, i32 %arg21, i32 %arg22, i32 %arg23, i32 %arg24, i32 %arg25, i32 %arg26, i32 %arg27, i32 %arg28, i32 %arg29, i32 %arg30, i32 %arg31) {
label_entry:
  %op68 = mul i32 %arg1, %arg2
  %op69 = add i32 %arg0, %op68
  %op71 = add i32 %op69, %arg3
  %op73 = add i32 %op71, %arg4
  %op75 = add i32 %op73, %arg5
  %op77 = add i32 %op75, %arg6
  %op79 = add i32 %op77, %arg7
  %op81 = add i32 %op79, %arg8
  %op83 = add i32 %op81, %arg9
  %op85 = add i32 %op83, %arg10
  %op87 = add i32 %op85, %arg11
  %op89 = sub i32 %op87, %arg12
  %op91 = sub i32 %op89, %arg13
  %op93 = sub i32 %op91, %arg14
  %op95 = sub i32 %op93, %arg15
  %op97 = sub i32 %op95, %arg16
  %op99 = sub i32 %op97, %arg17
  %op101 = sub i32 %op99, %arg18
  %op103 = sub i32 %op101, %arg19
  %op105 = sub i32 %op103, %arg20
  %op107 = sub i32 %op105, %arg21
  %op109 = add i32 %op107, %arg22
  %op111 = add i32 %op109, %arg23
  %op113 = add i32 %op111, %arg24
  %op115 = add i32 %op113, %arg25
  %op117 = add i32 %op115, %arg26
  %op119 = add i32 %op117, %arg27
  %op121 = add i32 %op119, %arg28
  %op123 = add i32 %op121, %arg29
  %op125 = add i32 %op123, %arg30
  %op127 = add i32 %op125, %arg31
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 %op127
}
define i32 @main() {
label_entry:
  %op41 = call i32 @testParam8(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7)
  %op57 = call i32 @testParam16(i32 %op41, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 0, i32 1, i32 2, i32 3, i32 4, i32 5)
  %op89 = call i32 @testParam32(i32 %op57, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 0, i32 1)
  call void @put_int(i32 %op89)
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 0
}
