// init
   @256
   D=A
   @SP
   M=D
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
// pop pointer 1
   // SP--
   @SP
   M=M-1
   // D = *SP
   @SP
   A=M
   D=M
   // THAT = *SP
   @THAT
   M=D
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
// pop that 0
   // addr = THAT + i
   @0
   D=A
   @THAT
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
// pop that 1
   // addr = THAT + i
   @1
   D=A
   @THAT
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
// push constant 2
   // *SP = i
   @2
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
// label MAIN_LOOP_START
(MAIN_LOOP_START)
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
// goto-if COMPUTE_ELEMENT
   // SP--
   @SP
   M=M-1
   // if (x > y) goto LABEL
   A=M
   D=M
   @COMPUTE_ELEMENT
   D;JGT
// goto END_PROGRAM
   @END_PROGRAM
   0;JMP
// label COMPUTE_ELEMENT
(COMPUTE_ELEMENT)
// push that 0
   // *SP = *(THAT + i)
   @0
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
// push that 1
   // *SP = *(THAT + i)
   @1
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
// pop that 2
   // addr = THAT + i
   @2
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
// push pointer 1
   // *SP = THAT
   @THAT
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
// pop pointer 1
   // SP--
   @SP
   M=M-1
   // D = *SP
   @SP
   A=M
   D=M
   // THAT = *SP
   @THAT
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
// goto MAIN_LOOP_START
   @MAIN_LOOP_START
   0;JMP
// label END_PROGRAM
(END_PROGRAM)
