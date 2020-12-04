// push constant 17
   // *SP = i
   @17
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 17
   // *SP = i
   @17
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// eq
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   D=M-D
   @EQ0
   D;JEQ
   @SP
   A=M
   M=0
   @EQEND0
   0;JMP
(EQ0)
   @SP
   A=M
   M=-1
(EQEND0)
   @SP
   M=M+1
// push constant 17
   // *SP = i
   @17
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 16
   // *SP = i
   @16
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// eq
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   D=M-D
   @EQ1
   D;JEQ
   @SP
   A=M
   M=0
   @EQEND1
   0;JMP
(EQ1)
   @SP
   A=M
   M=-1
(EQEND1)
   @SP
   M=M+1
// push constant 16
   // *SP = i
   @16
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 17
   // *SP = i
   @17
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// eq
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   D=M-D
   @EQ2
   D;JEQ
   @SP
   A=M
   M=0
   @EQEND2
   0;JMP
(EQ2)
   @SP
   A=M
   M=-1
(EQEND2)
   @SP
   M=M+1
// push constant 892
   // *SP = i
   @892
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 891
   // *SP = i
   @891
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
// push constant 891
   // *SP = i
   @891
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 892
   // *SP = i
   @892
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
   @LT1
   D;JLT
   @SP
   A=M
   M=0
   @LTEND1
   0;JMP
(LT1)
   @SP
   A=M
   M=-1
(LTEND1)
   @SP
   M=M+1
// push constant 891
   // *SP = i
   @891
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 891
   // *SP = i
   @891
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
   @LT2
   D;JLT
   @SP
   A=M
   M=0
   @LTEND2
   0;JMP
(LT2)
   @SP
   A=M
   M=-1
(LTEND2)
   @SP
   M=M+1
// push constant 32767
   // *SP = i
   @32767
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 32766
   // *SP = i
   @32766
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// gt
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   D=M-D
   @GT0
   D;JGT
   @SP
   A=M
   M=0
   @GTEND0
   0;JMP
(GT0)
   @SP
   A=M
   M=-1
(GTEND0)
   @SP
   M=M+1
// push constant 32766
   // *SP = i
   @32766
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 32767
   // *SP = i
   @32767
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// gt
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   D=M-D
   @GT1
   D;JGT
   @SP
   A=M
   M=0
   @GTEND1
   0;JMP
(GT1)
   @SP
   A=M
   M=-1
(GTEND1)
   @SP
   M=M+1
// push constant 32766
   // *SP = i
   @32766
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 32766
   // *SP = i
   @32766
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// gt
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   D=M-D
   @GT2
   D;JGT
   @SP
   A=M
   M=0
   @GTEND2
   0;JMP
(GT2)
   @SP
   A=M
   M=-1
(GTEND2)
   @SP
   M=M+1
// push constant 57
   // *SP = i
   @57
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 31
   // *SP = i
   @31
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 53
   // *SP = i
   @53
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
// push constant 112
   // *SP = i
   @112
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
// neg
   @SP
   M=M-1
   // *SP = -*SP
   A=M
   M=-M
   @SP
   M=M+1
// and
   @SP
   M=M-1
   // *SP = X & Y
   A=M
   D=M
   @SP
   M=M-1
   A=M
   M=D&M
   @SP
   M=M+1
// push constant 82
   // *SP = i
   @82
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// or
   @SP
   M=M-1
   // *SP = X | Y
   A=M
   D=M
   @SP
   M=M-1
   A=M
   M=D|M
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
