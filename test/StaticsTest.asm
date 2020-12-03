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
// function Class1.set 0
(Class1.set)
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
// pop static 0
   @SP
   M=M-1
   // *filename.i = *SP
   A=M
   D=M
   @StaticsTest.0
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
   @SP
   M=M+1
// pop static 1
   @SP
   M=M-1
   // *filename.i = *SP
   A=M
   D=M
   @StaticsTest.1
   M=D
// push constant 0
   // *SP = i
   @0
   D=A
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
// function Class1.get 0
(Class1.get)
   // Set LCL
   @SP
   D=M
   @LCL
   M=D
   // Set #numVars to zero and increment SP
// push static 0
   // *SP = *filename.i
   @StaticsTest.0
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push static 1
   // *SP = *filename.i
   @StaticsTest.1
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
// push constant 6
   // *SP = i
   @6
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 8
   // *SP = i
   @8
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call Class1.set 2
   // 1.0) Save ARG in variable before update (needed for frame)
   @ARG
   D=M
   @savedARG
   M=D
   // 1.1) Set ARG = SP - numArgs
   @2
   D=A
   @SP
   D=M-D
   @ARG
   M=D
   // 2) Save caller's frame onto stack
   // 2.1) Push caller's return address onto stack
   @Class1.setReturnAddress1
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
   @Class1.set
   0;JMP
(Class1.setReturnAddress1)
// pop temp 0
   // addr = 5 + i
   @0
   D=A
   @5
   D=D+A
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
// push constant 23
   // *SP = i
   @23
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 15
   // *SP = i
   @15
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call Class2.set 2
   // 1.0) Save ARG in variable before update (needed for frame)
   @ARG
   D=M
   @savedARG
   M=D
   // 1.1) Set ARG = SP - numArgs
   @2
   D=A
   @SP
   D=M-D
   @ARG
   M=D
   // 2) Save caller's frame onto stack
   // 2.1) Push caller's return address onto stack
   @Class2.setReturnAddress2
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
   @Class2.set
   0;JMP
(Class2.setReturnAddress2)
// pop temp 0
   // addr = 5 + i
   @0
   D=A
   @5
   D=D+A
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
// call Class1.get 0
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
   @Class1.getReturnAddress3
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
   @Class1.get
   0;JMP
(Class1.getReturnAddress3)
// call Class2.get 0
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
   @Class2.getReturnAddress4
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
   @Class2.get
   0;JMP
(Class2.getReturnAddress4)
(WHILE)
// goto WHILE
   @WHILE
   0;JMP
// function Class2.set 0
(Class2.set)
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
// pop static 0
   @SP
   M=M-1
   // *filename.i = *SP
   A=M
   D=M
   @StaticsTest.0
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
   @SP
   M=M+1
// pop static 1
   @SP
   M=M-1
   // *filename.i = *SP
   A=M
   D=M
   @StaticsTest.1
   M=D
// push constant 0
   // *SP = i
   @0
   D=A
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
   @returnAddress2
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
   @returnAddress2
   D=M
   A=D
   D;JMP
// function Class2.get 0
(Class2.get)
   // Set LCL
   @SP
   D=M
   @LCL
   M=D
   // Set #numVars to zero and increment SP
// push static 0
   // *SP = *filename.i
   @StaticsTest.0
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push static 1
   // *SP = *filename.i
   @StaticsTest.1
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
   @returnAddress3
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
   @returnAddress3
   D=M
   A=D
   D;JMP
