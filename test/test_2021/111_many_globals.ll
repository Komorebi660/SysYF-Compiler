@a0 = global i32 zeroinitializer
@a1 = global i32 zeroinitializer
@a2 = global i32 zeroinitializer
@a3 = global i32 zeroinitializer
@a4 = global i32 zeroinitializer
@a5 = global i32 zeroinitializer
@a6 = global i32 zeroinitializer
@a7 = global i32 zeroinitializer
@a8 = global i32 zeroinitializer
@a9 = global i32 zeroinitializer
@a10 = global i32 zeroinitializer
@a11 = global i32 zeroinitializer
@a12 = global i32 zeroinitializer
@a13 = global i32 zeroinitializer
@a14 = global i32 zeroinitializer
@a15 = global i32 zeroinitializer
@a16 = global i32 zeroinitializer
@a17 = global i32 zeroinitializer
@a18 = global i32 zeroinitializer
@a19 = global i32 zeroinitializer
@a20 = global i32 zeroinitializer
@a21 = global i32 zeroinitializer
@a22 = global i32 zeroinitializer
@a23 = global i32 zeroinitializer
@a24 = global i32 zeroinitializer
@a25 = global i32 zeroinitializer
@a26 = global i32 zeroinitializer
@a27 = global i32 zeroinitializer
@a28 = global i32 zeroinitializer
@a29 = global i32 zeroinitializer
@a30 = global i32 zeroinitializer
@a31 = global i32 zeroinitializer
@a32 = global i32 zeroinitializer
@a33 = global i32 zeroinitializer
@a34 = global i32 zeroinitializer
@a35 = global i32 zeroinitializer
@a36 = global i32 zeroinitializer
@a37 = global i32 zeroinitializer
@a38 = global i32 zeroinitializer
@a39 = global i32 zeroinitializer
declare void @put_int(i32)

define i32 @testParam8(i32 %arg0, i32 %arg1, i32 %arg2, i32 %arg3, i32 %arg4, i32 %arg5, i32 %arg6, i32 %arg7) {
label_entry:
  %op19 = add i32 %arg0, %arg1
  %op21 = add i32 %op19, %arg2
  %op23 = add i32 %op21, %arg3
  %op25 = add i32 %op23, %arg4
  %op27 = add i32 %op25, %arg5
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
  %op39 = sub i32 %op37, %arg3
  %op41 = sub i32 %op39, %arg4
  %op43 = sub i32 %op41, %arg5
  %op45 = sub i32 %op43, %arg6
  %op47 = sub i32 %op45, %arg7
  %op49 = add i32 %op47, %arg8
  %op51 = add i32 %op49, %arg9
  %op53 = add i32 %op51, %arg10
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
  %op67 = add i32 %arg0, %arg1
  %op69 = add i32 %op67, %arg2
  %op71 = add i32 %op69, %arg3
  %op73 = add i32 %op71, %arg4
  %op75 = add i32 %op73, %arg5
  %op77 = add i32 %op75, %arg6
  %op79 = add i32 %op77, %arg7
  %op81 = add i32 %op79, %arg8
  %op83 = add i32 %op81, %arg9
  %op85 = add i32 %op83, %arg10
  %op87 = add i32 %op85, %arg11
  %op89 = add i32 %op87, %arg12
  %op91 = add i32 %op89, %arg13
  %op93 = add i32 %op91, %arg14
  %op95 = add i32 %op93, %arg15
  %op97 = add i32 %op95, %arg16
  %op99 = add i32 %op97, %arg17
  %op101 = sub i32 %op99, %arg18
  %op103 = sub i32 %op101, %arg19
  %op105 = sub i32 %op103, %arg20
  %op107 = sub i32 %op105, %arg21
  %op109 = sub i32 %op107, %arg22
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
  store i32 0, i32* @a0
  store i32 1, i32* @a1
  store i32 2, i32* @a2
  store i32 3, i32* @a3
  store i32 4, i32* @a4
  store i32 5, i32* @a5
  store i32 6, i32* @a6
  store i32 7, i32* @a7
  store i32 8, i32* @a8
  store i32 9, i32* @a9
  store i32 0, i32* @a10
  store i32 1, i32* @a11
  store i32 2, i32* @a12
  store i32 3, i32* @a13
  store i32 4, i32* @a14
  store i32 5, i32* @a15
  store i32 6, i32* @a16
  store i32 7, i32* @a17
  store i32 8, i32* @a18
  store i32 9, i32* @a19
  store i32 0, i32* @a20
  store i32 1, i32* @a21
  store i32 2, i32* @a22
  store i32 3, i32* @a23
  store i32 4, i32* @a24
  store i32 5, i32* @a25
  store i32 6, i32* @a26
  store i32 7, i32* @a27
  store i32 8, i32* @a28
  store i32 9, i32* @a29
  store i32 0, i32* @a30
  store i32 1, i32* @a31
  store i32 4, i32* @a32
  store i32 5, i32* @a33
  store i32 6, i32* @a34
  store i32 7, i32* @a35
  store i32 8, i32* @a36
  store i32 9, i32* @a37
  store i32 0, i32* @a38
  store i32 1, i32* @a39
  %op9 = call i32 @testParam8(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7)
  store i32 %op9, i32* @a0
  %op10 = load i32, i32* @a0
  call void @put_int(i32 %op10)
  %op11 = load i32, i32* @a32
  %op12 = load i32, i32* @a33
  %op13 = load i32, i32* @a34
  %op14 = load i32, i32* @a35
  %op15 = load i32, i32* @a36
  %op16 = load i32, i32* @a37
  %op17 = load i32, i32* @a38
  %op18 = load i32, i32* @a39
  %op19 = load i32, i32* @a8
  %op20 = load i32, i32* @a9
  %op21 = load i32, i32* @a10
  %op22 = load i32, i32* @a11
  %op23 = load i32, i32* @a12
  %op24 = load i32, i32* @a13
  %op25 = load i32, i32* @a14
  %op26 = load i32, i32* @a15
  %op27 = call i32 @testParam16(i32 %op11, i32 %op12, i32 %op13, i32 %op14, i32 %op15, i32 %op16, i32 %op17, i32 %op18, i32 %op19, i32 %op20, i32 %op21, i32 %op22, i32 %op23, i32 %op24, i32 %op25, i32 %op26)
  store i32 %op27, i32* @a0
  %op28 = load i32, i32* @a0
  call void @put_int(i32 %op28)
  %op29 = load i32, i32* @a0
  %op30 = load i32, i32* @a1
  %op31 = load i32, i32* @a2
  %op32 = load i32, i32* @a3
  %op33 = load i32, i32* @a4
  %op34 = load i32, i32* @a5
  %op35 = load i32, i32* @a6
  %op36 = load i32, i32* @a7
  %op37 = load i32, i32* @a8
  %op38 = load i32, i32* @a9
  %op39 = load i32, i32* @a10
  %op40 = load i32, i32* @a11
  %op41 = load i32, i32* @a12
  %op42 = load i32, i32* @a13
  %op43 = load i32, i32* @a14
  %op44 = load i32, i32* @a15
  %op45 = load i32, i32* @a16
  %op46 = load i32, i32* @a17
  %op47 = load i32, i32* @a18
  %op48 = load i32, i32* @a19
  %op49 = load i32, i32* @a20
  %op50 = load i32, i32* @a21
  %op51 = load i32, i32* @a22
  %op52 = load i32, i32* @a23
  %op53 = load i32, i32* @a24
  %op54 = load i32, i32* @a25
  %op55 = load i32, i32* @a26
  %op56 = load i32, i32* @a27
  %op57 = load i32, i32* @a28
  %op58 = load i32, i32* @a29
  %op59 = load i32, i32* @a30
  %op60 = load i32, i32* @a31
  %op61 = call i32 @testParam32(i32 %op29, i32 %op30, i32 %op31, i32 %op32, i32 %op33, i32 %op34, i32 %op35, i32 %op36, i32 %op37, i32 %op38, i32 %op39, i32 %op40, i32 %op41, i32 %op42, i32 %op43, i32 %op44, i32 %op45, i32 %op46, i32 %op47, i32 %op48, i32 %op49, i32 %op50, i32 %op51, i32 %op52, i32 %op53, i32 %op54, i32 %op55, i32 %op56, i32 %op57, i32 %op58, i32 %op59, i32 %op60)
  store i32 %op61, i32* @a0
  %op62 = load i32, i32* @a0
  call void @put_int(i32 %op62)
  br label %label_ret
label_ret:                                                ; preds = %label_entry
  ret i32 0
}
