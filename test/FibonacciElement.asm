// init
   // Set SP
   @256
   D=A
   @SP
   M=D
   // Set LCL, ARG, THIS, THAT to negative initial values
   @LCL
   M=-1
   @ARG
   M=-1
   @THIS
   M=-1
   @THAT
   M=-1
// call Sys.init 0
   // 1.0) Save ARG in variable before update (needed for frame)
   @ARG
   D=M
   @savedARG
   M=D
   // 1.1) Set ARG = SP - numArgs
   @0
   D=A
   @SP
   D=M-D
   @ARG
   M=D
   // 2) Save caller's frame onto stack
   // 2.1) Push caller's return address onto stack
   @Sys.initReturnAddress0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
   // 2.2) Push caller's LCL onto stack
   @LCL
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
   // 2.3) Push caller's ARG onto stack
   @savedARG
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
   // 2.4) Push caller's THIS onto stack
   @THIS
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
   // 2.5) Push caller's THAT onto stack
   @THAT
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
   // 3) Jump to callee function
   @Sys.init
   0;JMP
(Sys.initReturnAddress0)
// function Main.fibonacci 0
(Main.fibonacci)
   // Set LCL
   @SP
   D=M
   @LCL
   M=D
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
   @SP
   M=M+1
// push constant 2
   // *SP = i
   @2
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// lt
   @SP
   M=M-1
   A=M
   D=M
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
   @SP
   M=M+1
// goto-if IF_TRUE
   @SP
   M=M-1
   // if (x > y) goto LABEL
   A=M
   D=M
   @IF_TRUE
   D;JLT
// goto IF_FALSE
   @IF_FALSE
   0;JMP
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
   @SP
   M=M+1
// push constant 2
   // *SP = i
   @2
   D=A
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
// call Main.fibonacci 1
   // 1.0) Save ARG in variable before update (needed for frame)
   @ARG
   D=M
   @savedARG
   M=D
   // 1.1) Set ARG = SP - numArgs
   @1
   D=A
   @SP
   D=M-D
   @ARG
   M=D
   // 2) Save caller's frame onto stack
   // 2.1) Push caller's return address onto stack
   @Main.fibonacciReturnAddress1
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
   // 2.2) Push caller's LCL onto stack
   @LCL
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
   // 2.3) Push caller's ARG onto stack
   @savedARG
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
   // 2.4) Push caller's THIS onto stack
   @THIS
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
   // 2.5) Push caller's THAT onto stack
   @THAT
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
   // 3) Jump to callee function
   @Main.fibonacci
   0;JMP
(Main.fibonacciReturnAddress1)
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
// push constant 1
   // *SP = i
   @1
   D=A
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
// call Main.fibonacci 1
   // 1.0) Save ARG in variable before update (needed for frame)
   @ARG
   D=M
   @savedARG
   M=D
   // 1.1) Set ARG = SP - numArgs
   @1
   D=A
   @SP
   D=M-D
   @ARG
   M=D
   // 2) Save caller's frame onto stack
   // 2.1) Push caller's return address onto stack
   @Main.fibonacciReturnAddress2
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
   // 2.2) Push caller's LCL onto stack
   @LCL
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
   // 2.3) Push caller's ARG onto stack
   @savedARG
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
   // 2.4) Push caller's THIS onto stack
   @THIS
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
   // 2.5) Push caller's THAT onto stack
   @THAT
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
   // 3) Jump to callee function
   @Main.fibonacci
   0;JMP
(Main.fibonacciReturnAddress2)
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
// return
   // Store return address first before we reset LCL in caller's frame
   @5
   D=A
   @LCL
   D=M-D
   A=D
   D=M
   @returnAddress1
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
   @returnAddress1
   D=M
   A=D
   D;JMP
// function Sys.init 0
(Sys.init)
   // Set LCL
   @SP
   D=M
   @LCL
   M=D
   // Set #numVars to zero and increment SP
// push constant 4
   // *SP = i
   @4
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call Main.fibonacci 1
   // 1.0) Save ARG in variable before update (needed for frame)
   @ARG
   D=M
   @savedARG
   M=D
   // 1.1) Set ARG = SP - numArgs
   @1
   D=A
   @SP
   D=M-D
   @ARG
   M=D
   // 2) Save caller's frame onto stack
   // 2.1) Push caller's return address onto stack
   @Main.fibonacciReturnAddress3
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
   // 2.2) Push caller's LCL onto stack
   @LCL
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
   // 2.3) Push caller's ARG onto stack
   @savedARG
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
   // 2.4) Push caller's THIS onto stack
   @THIS
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
   // 2.5) Push caller's THAT onto stack
   @THAT
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
   // 3) Jump to callee function
   @Main.fibonacci
   0;JMP
(Main.fibonacciReturnAddress3)
(WHILE)
// goto WHILE
   @WHILE
   0;JMP
