// init
   // Set SP
   @256
   D=A
   @SP
   M=D
   // Call Sys.init
   @Sys.init
   0;JMP
// function SimpleFunction.test 2
// label SimpleFunction.test
(SimpleFunction.test)
   // Set #numVars to zero and increment SP
   @0
   D=A
   @LCL
   D=D+M
   A=D
   M=0
   @SP
   M=M+1
   @1
   D=A
   @LCL
   D=D+M
   A=D
   M=0
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
// push local 1
   // *SP = *(LCL + i)
   @1
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
// not
   // SP--
   @SP
   M=M-1
   // *SP = !*SP
   A=M
   M=!M
   // SP++
   @SP
   M=M+1
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
// return
   // 1) Copy return value to argument 0
   @SP
   M=M-1
   A=M
   D=M
   @ARG
   A=M
   M=D
   // 3/4) Clear stack (i.e., set SP after argument 0)
   @ARG
   D=M+1
   @SP
   M=D
   // 2) Restore caller's frame
   // Store return address first before we reset LCL in caller's frame
   @5
   D=A
   @LCL
   D=M-D
   A=D
   D=M
   @returnAddress
   M=D
   @1
   D=A
   @LCL
   D=M-D
   A=D
   D=M
   @THAT
   M=D
   @2
   D=A
   @LCL
   D=M-D
   A=D
   D=M
   @THIS
   M=D
   @3
   D=A
   @LCL
   D=M-D
   A=D
   D=M
   @ARG
   M=D
   @4
   D=A
   @LCL
   D=M-D
   A=D
   D=M
   @LCL
   M=D
   // 5) Jump to the return address in callers frame
   @returnAddress
   D=M
   A=D
   D;JMP
