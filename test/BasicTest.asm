// push constant 10
   // *SP = i
   @10
   D=A
   @SP
   A=M
   M=D
   // SP++
   @SP
   M=M+1
// pop local 0
   // addr = LCL + i
   @0
   D=A
   @LCL
   D=D+M
   @addr0
   M=D
   // SP--
   @SP
   M=M-1
   // *addr = *SP
   A=M
   D=M
   @addr0
   A=M
   M=D
// push constant 21
   // *SP = i
   @21
   D=A
   @SP
   A=M
   M=D
   // SP++
   @SP
   M=M+1
// push constant 22
   // *SP = i
   @22
   D=A
   @SP
   A=M
   M=D
   // SP++
   @SP
   M=M+1
// pop argument 2
   // addr = ARG + i
   @2
   D=A
   @ARG
   D=D+M
   @addr1
   M=D
   // SP--
   @SP
   M=M-1
   // *addr = *SP
   A=M
   D=M
   @addr1
   A=M
   M=D
// pop argument 1
   // addr = ARG + i
   @1
   D=A
   @ARG
   D=D+M
   @addr2
   M=D
   // SP--
   @SP
   M=M-1
   // *addr = *SP
   A=M
   D=M
   @addr2
   A=M
   M=D
// push constant 36
   // *SP = i
   @36
   D=A
   @SP
   A=M
   M=D
   // SP++
   @SP
   M=M+1
// pop this 6
   // addr = THIS + i
   @6
   D=A
   @THIS
   D=D+M
   @addr3
   M=D
   // SP--
   @SP
   M=M-1
   // *addr = *SP
   A=M
   D=M
   @addr3
   A=M
   M=D
// push constant 42
   // *SP = i
   @42
   D=A
   @SP
   A=M
   M=D
   // SP++
   @SP
   M=M+1
// push constant 45
   // *SP = i
   @45
   D=A
   @SP
   A=M
   M=D
   // SP++
   @SP
   M=M+1
// pop that 5
   // addr = THAT + i
   @5
   D=A
   @THAT
   D=D+M
   @addr4
   M=D
   // SP--
   @SP
   M=M-1
   // *addr = *SP
   A=M
   D=M
   @addr4
   A=M
   M=D
// pop that 2
   // addr = THAT + i
   @2
   D=A
   @THAT
   D=D+M
   @addr5
   M=D
   // SP--
   @SP
   M=M-1
   // *addr = *SP
   A=M
   D=M
   @addr5
   A=M
   M=D
// push constant 510
   // *SP = i
   @510
   D=A
   @SP
   A=M
   M=D
   // SP++
   @SP
   M=M+1
// pop temp 6
   // addr = 5 + i
   @6
   D=A
   @5
   D=D+A
   @addr6
   M=D
   // SP--
   @SP
   M=M-1
   // *addr = *SP
   A=M
   D=M
   @addr6
   A=M
   M=D
// push local 0
   // *SP = *(LCL + i)
   @0
   D=A
   @LCL
   D=D+M
   A=D
   D=M
   @SP
   A=M
   M=D
   // SP++
   @SP
   M=M+1
// push that 5
   // *SP = *(THAT + i)
   @5
   D=A
   @THAT
   D=D+M
   A=D
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
// push argument 1
   // *SP = *(ARG + i)
   @1
   D=A
   @ARG
   D=D+M
   A=D
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
// push this 6
   // *SP = *(THIS + i)
   @6
   D=A
   @THIS
   D=D+M
   A=D
   D=M
   @SP
   A=M
   M=D
   // SP++
   @SP
   M=M+1
// push this 6
   // *SP = *(THIS + i)
   @6
   D=A
   @THIS
   D=D+M
   A=D
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
// push temp 6
   // *SP = *(5 + i)
   @6
   D=A
   @5
   D=D+A
   A=D
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
