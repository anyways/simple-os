.code16
.text
  mov  %cs, %ax
  mov  %ax, %dx
  mov  %ax, %es
  call DispStr
  jmp  .
DispStr:
  mov  $BootMessage, %ax
  mov  %ax, %bp
  mov  $16, %cx
  mov  $0x1301, %ax
  mov  $0x00c, %bx
  mov  $0, %dl
  int  $0x10
  ret
BootMessage:.ascii "Hello world!"
.org 510
.word 0xaa55