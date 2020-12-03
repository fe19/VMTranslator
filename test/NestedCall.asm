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
// label Sys.initReturnAddress0
(Sys.initReturnAddress0)
// function Sys.init 0
// label Sys.init
(Sys.init)
   // Set LCL
   @SP
   D=M
   @LCL
   M=D
   // Set #numVars to zero and increment SP
// push constant 4000
   // *SP = i
   @4000
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
// push constant 5000
   // *SP = i
   @5000
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
// call Sys.main 0
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
   @Sys.mainReturnAddress1
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
   @Sys.main
   0;JMP
// label Sys.mainReturnAddress1
(Sys.mainReturnAddress1)
// pop temp 1
   // addr = 5 + i
   @1
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
// label LOOP
(LOOP)
// goto LOOP
   @LOOP
   0;JMP
// function Sys.main 5
// label Sys.main
(Sys.main)
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
   @2
   D=A
   @LCL
   D=D+M
   A=D
   M=0
   @SP
   M=M+1
   @3
   D=A
   @LCL
   D=D+M
   A=D
   M=0
   @SP
   M=M+1
   @4
   D=A
   @LCL
   D=D+M
   A=D
   M=0
   @SP
   M=M+1
// push constant 4001
   // *SP = i
   @4001
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
// push constant 5001
   // *SP = i
   @5001
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
// push constant 200
   // *SP = i
   @200
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop local 1
   // addr = LCL + i
   @1
   D=A
   @LCL
   D=D+M
   @addr5
   M=D
   @SP
   M=M-1
   // *addr = *SP
   A=M
   D=M
   @addr5
   A=M
   M=D
// push constant 40
   // *SP = i
   @40
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop local 2
   // addr = LCL + i
   @2
   D=A
   @LCL
   D=D+M
   @addr6
   M=D
   @SP
   M=M-1
   // *addr = *SP
   A=M
   D=M
   @addr6
   A=M
   M=D
// push constant 6
   // *SP = i
   @6
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop local 3
   // addr = LCL + i
   @3
   D=A
   @LCL
   D=D+M
   @addr7
   M=D
   @SP
   M=M-1
   // *addr = *SP
   A=M
   D=M
   @addr7
   A=M
   M=D
// push constant 123
   // *SP = i
   @123
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call Sys.add12 1
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
   @Sys.add12ReturnAddress2
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
   @Sys.add12
   0;JMP
// label Sys.add12ReturnAddress2
(Sys.add12ReturnAddress2)
// pop temp 0
   // addr = 5 + i
   @0
   D=A
   @5
   D=D+A
   @addr8
   M=D
   @SP
   M=M-1
   // *addr = *SP
   A=M
   D=M
   @addr8
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
// push local 2
   // *SP = *(LCL + i)
   @2
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
// push local 3
   // *SP = *(LCL + i)
   @3
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
// push local 4
   // *SP = *(LCL + i)
   @4
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
// function Sys.add12 0
// label Sys.add12
(Sys.add12)
   // Set LCL
   @SP
   D=M
   @LCL
   M=D
   // Set #numVars to zero and increment SP
// push constant 4002
   // *SP = i
   @4002
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
// push constant 5002
   // *SP = i
   @5002
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
// push constant 12
   // *SP = i
   @12
   D=A
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
