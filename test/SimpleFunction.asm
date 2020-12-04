// function SimpleFunction.test 2
(SimpleFunction.test)
   // Set LCL
   @SP
   D=M
   @LCL
   M=D
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
// not
   @SP
   M=M-1
   // *SP = !*SP
   A=M
   M=!M
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
// return
   // Store return address first before we reset LCL in caller's frame
   @5
   D=A
   @LCL
   D=M-D
   A=D
   D=M
   @returnAddress0
   M=D
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
   @returnAddress0
   D=M
   A=D
   D;JMP
