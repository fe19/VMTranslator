// init
   // Set SP
   @256
   D=A
   @SP
   M=D
   // Call Sys.init
   @Sys.init
   0;JMP
// function Main.fibonacci 0
// label Main.fibonacci
(Main.fibonacci)
   // Set #numVars to zero and increment SP
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
// lt
   // SP--
   @SP
   M=M-1
   A=M
   D=M
   // SP--
   @SP
   M=M-1
   A=M
   D=M-D
   @LT0
   D;JLT
   @SP
   A=M
   M=0
   @LTEND0
   0;JMP
(LT0)
   @SP
   A=M
   M=-1
(LTEND0)
   // SP++
   @SP
   M=M+1
// goto-if IF_TRUE
   // SP--
   @SP
   M=M-1
   // if (x > y) goto LABEL
   A=M
   D=M
   @IF_TRUE
   D;JGT
// goto IF_FALSE
   @IF_FALSE
   0;JMP
// label IF_TRUE
(IF_TRUE)
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
// label IF_FALSE
(IF_FALSE)
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
// call Main.fibonacci 1
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
// call Main.fibonacci 1
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
// function Sys.init 0
// label Sys.init
(Sys.init)
   // Set #numVars to zero and increment SP
// push constant 4
   // *SP = i
   @4
   D=A
   @SP
   A=M
   M=D
   // SP++
   @SP
   M=M+1
// call Main.fibonacci 1
// label WHILE
(WHILE)
// goto WHILE
   @WHILE
   0;JMP
