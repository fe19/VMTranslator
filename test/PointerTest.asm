// push constant 3030
   // *SP = i
   @3030
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop pointer 0
   @SP
   M=M-1
   // D = *SP
   @SP
   A=M
   D=M
   // THIS = *SP
   @THIS
   M=D
// push constant 3040
   // *SP = i
   @3040
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop pointer 1
   @SP
   M=M-1
   // D = *SP
   @SP
   A=M
   D=M
   // THAT = *SP
   @THAT
   M=D
// push constant 32
   // *SP = i
   @32
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop this 2
   // addr = THIS + i
   @2
   D=A
   @THIS
   D=D+M
   @addr2
   M=D
   @SP
   M=M-1
   // *addr = *SP
   A=M
   D=M
   @addr2
   A=M
   M=D
// push constant 46
   // *SP = i
   @46
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop that 6
   // addr = THAT + i
   @6
   D=A
   @THAT
   D=D+M
   @addr3
   M=D
   @SP
   M=M-1
   // *addr = *SP
   A=M
   D=M
   @addr3
   A=M
   M=D
// push pointer 0
   // *SP = THIS
   @THIS
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push pointer 1
   // *SP = THAT
   @THAT
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// add
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   D=D+M
   M=D
   @SP
   M=M+1
// push this 2
   // *SP = *(THIS + i)
   @2
   D=A
   @THIS
   D=D+M
   A=D
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// sub
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
   @SP
   M=M+1
// push that 6
   // *SP = *(THAT + i)
   @6
   D=A
   @THAT
   D=D+M
   A=D
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// add
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   D=D+M
   M=D
   @SP
   M=M+1
