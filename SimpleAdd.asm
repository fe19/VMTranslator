// push constant 7
   // *SP = i
   @7
   D=A
   @SP
   A=M
   M=D
   // SP++
   @SP
   M=M+1
// push constant 8
   // *SP = i
   @8
   D=A
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
