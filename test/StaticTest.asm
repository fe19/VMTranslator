// init
   @256
   D=A
   @SP
   M=D
// push constant 111
   // *SP = i
   @111
   D=A
   @SP
   A=M
   M=D
   // SP++
   @SP
   M=M+1
// push constant 333
   // *SP = i
   @333
   D=A
   @SP
   A=M
   M=D
   // SP++
   @SP
   M=M+1
// push constant 888
   // *SP = i
   @888
   D=A
   @SP
   A=M
   M=D
   // SP++
   @SP
   M=M+1
// pop static 8
   // SP--
   @SP
   M=M-1
   // *filename.i = *SP
   A=M
   D=M
   @StaticTest.asm.8
   M=D
// pop static 3
   // SP--
   @SP
   M=M-1
   // *filename.i = *SP
   A=M
   D=M
   @StaticTest.asm.3
   M=D
// pop static 1
   // SP--
   @SP
   M=M-1
   // *filename.i = *SP
   A=M
   D=M
   @StaticTest.asm.1
   M=D
// push static 3
   // *SP = *filename.i
   @StaticTest.asm.3
   D=M
   @SP
   A=M
   M=D
   // SP++
   @SP
   M=M+1
// push static 1
   // *SP = *filename.i
   @StaticTest.asm.1
   D=M
   @SP
   A=M
   M=D
   // SP++
   @SP
   M=M+1
// sub
   // SP--
   @SP
   M=M-1
   // *SP = X - Y
   A=M
   D=M
   @SP
   M=M-1
   A=M
   D=M-D
   M=D
   // SP++
   @SP
   M=M+1
// push static 8
   // *SP = *filename.i
   @StaticTest.asm.8
   D=M
   @SP
   A=M
   M=D
   // SP++
   @SP
   M=M+1
// add
   // SP--
   @SP
   M=M-1
   // SP = X + Y
   A=M
   D=M
   @SP
   M=M-1
   A=M
   D=D+M
   M=D
   // SP++
   @SP
   M=M+1
