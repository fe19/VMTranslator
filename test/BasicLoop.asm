// push constant 0
   // *SP = i
   @0
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
// label LOOP_START
(LOOP_START)
// push argument 0
   // *SP = *(ARG + i)
   @0
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
// pop local 0
   // addr = LCL + i
   @0
   D=A
   @LCL
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
// push argument 0
   // *SP = *(ARG + i)
   @0
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
// push constant 1
   // *SP = i
   @1
   D=A
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
// pop argument 0
   // addr = ARG + i
   @0
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
// push argument 0
   // *SP = *(ARG + i)
   @0
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
// goto-if LOOP_START
   // SP--
   @SP
   M=M-1
   // if (x > y) goto LABEL
   A=M
   D=M
   @LOOP_START
   D;JGT
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
