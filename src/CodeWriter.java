import java.io.FileWriter;
import java.io.IOException;

/**
 * Generates assembly code from the parsed VM command.
 */
public class CodeWriter {

    FileWriter fileWriter;

    int countAddr = 0;
    int countEQ = 0;
    int countGT = 0;
    int countLT = 0;
    int countAnd = 0;
    int countOr = 0;
    int countNot = 0;

    public CodeWriter(String filename) throws IOException {
        fileWriter = new FileWriter(filename);
    }

    public void writePushPop(String command, String segment, int index) throws IOException {
        // Add comment first to indicate VM commad that is followed by HACK assembly
        fileWriter.write("// " + command + " " + segment + " " + index + "\n");
        // Assembly for push command
        if (command.equals("push")) {
            switch (segment) {
                case "constant":
                    fileWriter.write("   @" + index + "\n");
                    fileWriter.write("   D=A\n");
                    fileWriter.write("   @SP\n");
                    fileWriter.write("   A=M\n");
                    fileWriter.write("   M=D\n");
                    fileWriter.write("   @SP\n");
                    fileWriter.write("   M=M+1\n");
                    break;
                case "local":
                    fileWriter.write("   @" + index + "\n");
                    fileWriter.write("   D=M\n");
                    fileWriter.write("   @LCL\n");
                    fileWriter.write("   D=D+M\n");
                    fileWriter.write("   A=D\n");
                    fileWriter.write("   D=M\n");
                    fileWriter.write("   @SP\n");
                    fileWriter.write("   A=M\n");
                    fileWriter.write("   M=D\n");
                    fileWriter.write("   @SP\n");
                    fileWriter.write("   M=M+1\n");
                    break;
                case "argument":
                    fileWriter.write("   @" + index + "\n");
                    fileWriter.write("   D=M\n");
                    fileWriter.write("   @ARG\n");
                    fileWriter.write("   D=D+M\n");
                    fileWriter.write("   A=D\n");
                    fileWriter.write("   D=M\n");
                    fileWriter.write("   @SP\n");
                    fileWriter.write("   A=M\n");
                    fileWriter.write("   M=D\n");
                    fileWriter.write("   @SP\n");
                    fileWriter.write("   M=M+1\n");
                    break;
                case "this":
                    fileWriter.write("   @" + index + "\n");
                    fileWriter.write("   D=M\n");
                    fileWriter.write("   @THIS\n");
                    fileWriter.write("   D=D+M\n");
                    fileWriter.write("   A=D\n");
                    fileWriter.write("   D=M\n");
                    fileWriter.write("   @SP\n");
                    fileWriter.write("   A=M\n");
                    fileWriter.write("   M=D\n");
                    fileWriter.write("   @SP\n");
                    fileWriter.write("   M=M+1\n");
                    break;
                case "that":
                    fileWriter.write("   @" + index + "\n");
                    fileWriter.write("   D=M\n");
                    fileWriter.write("   @THAT\n");
                    fileWriter.write("   D=D+M\n");
                    fileWriter.write("   A=D\n");
                    fileWriter.write("   D=M\n");
                    fileWriter.write("   @SP\n");
                    fileWriter.write("   A=M\n");
                    fileWriter.write("   M=D\n");
                    fileWriter.write("   @SP\n");
                    fileWriter.write("   M=M+1\n");
                    break;
                case "temp":
                    fileWriter.write("   @" + index + "\n");
                    fileWriter.write("   D=M\n");
                    fileWriter.write("   @5\n");
                    fileWriter.write("   D=D+M\n");
                    fileWriter.write("   A=D\n");
                    fileWriter.write("   D=M\n");
                    fileWriter.write("   @SP\n");
                    fileWriter.write("   A=M\n");
                    fileWriter.write("   M=D\n");
                    fileWriter.write("   @SP\n");
                    fileWriter.write("   M=M+1\n");
                    break;
                default:
                    throw new IllegalStateException("Unexpected value: " + segment);
            }
        } else {
            String labelAddr = "addr" + countAddr;
            countAddr++;
            switch (segment) {
                case "local":
                    fileWriter.write("   // addr = LCL + i\n");
                    fileWriter.write("   @" + index + "\n");
                    fileWriter.write("   D=A\n");
                    fileWriter.write("   @LCL\n");
                    fileWriter.write("   D=D+M\n");
                    fileWriter.write("   @" + labelAddr + "\n");
                    fileWriter.write("   M=D\n");
                    fileWriter.write("   // SP--\n");
                    fileWriter.write("   @SP\n");
                    fileWriter.write("   M=M-1\n");
                    fileWriter.write("   // *addr = *SP\n");
                    fileWriter.write("   A=M\n");
                    fileWriter.write("   D=M\n");
                    fileWriter.write("   @" + labelAddr + "\n");
                    fileWriter.write("   A=M\n");
                    fileWriter.write("   M=D\n");
                    break;
                case "argument":
                    fileWriter.write("   // addr = ARG + i\n");
                    fileWriter.write("   @" + index + "\n");
                    fileWriter.write("   D=A\n");
                    fileWriter.write("   @ARG\n");
                    fileWriter.write("   D=D+M\n");
                    fileWriter.write("   @" + labelAddr + "\n");
                    fileWriter.write("   M=D\n");
                    fileWriter.write("   // SP--\n");
                    fileWriter.write("   @SP\n");
                    fileWriter.write("   M=M-1\n");
                    fileWriter.write("   // *addr = *SP\n");
                    fileWriter.write("   A=M\n");
                    fileWriter.write("   D=M\n");
                    fileWriter.write("   @" + labelAddr + "\n");
                    fileWriter.write("   A=M\n");
                    fileWriter.write("   M=D\n");
                    break;
                case "this":
                    fileWriter.write("   // addr = THIS + i\n");
                    fileWriter.write("   @" + index + "\n");
                    fileWriter.write("   D=A\n");
                    fileWriter.write("   @THIS\n");
                    fileWriter.write("   D=D+M\n");
                    fileWriter.write("   @" + labelAddr + "\n");
                    fileWriter.write("   M=D\n");
                    fileWriter.write("   // SP--\n");
                    fileWriter.write("   @SP\n");
                    fileWriter.write("   M=M-1\n");
                    fileWriter.write("   // *addr = *SP\n");
                    fileWriter.write("   A=M\n");
                    fileWriter.write("   D=M\n");
                    fileWriter.write("   @" + labelAddr + "\n");
                    fileWriter.write("   A=M\n");
                    fileWriter.write("   M=D\n");
                    break;
                case "that":
                    fileWriter.write("   // addr = THAT + i\n");
                    fileWriter.write("   @" + index + "\n");
                    fileWriter.write("   D=A\n");
                    fileWriter.write("   @THAT\n");
                    fileWriter.write("   D=D+M\n");
                    fileWriter.write("   @" + labelAddr + "\n");
                    fileWriter.write("   M=D\n");
                    fileWriter.write("   // SP--\n");
                    fileWriter.write("   @SP\n");
                    fileWriter.write("   M=M-1\n");
                    fileWriter.write("   // *addr = *SP\n");
                    fileWriter.write("   A=M\n");
                    fileWriter.write("   D=M\n");
                    fileWriter.write("   @" + labelAddr + "\n");
                    fileWriter.write("   A=M\n");
                    fileWriter.write("   M=D\n");
                    break;
                case "temp":
                    fileWriter.write("   // addr = 5 + i\n");
                    fileWriter.write("   @" + index + "\n");
                    fileWriter.write("   D=A\n");
                    fileWriter.write("   @5\n");
                    fileWriter.write("   D=D+M\n");
                    fileWriter.write("   @" + labelAddr + "\n");
                    fileWriter.write("   M=D\n");
                    fileWriter.write("   // SP--\n");
                    fileWriter.write("   @SP\n");
                    fileWriter.write("   M=M-1\n");
                    fileWriter.write("   // *addr = *SP\n");
                    fileWriter.write("   A=M\n");
                    fileWriter.write("   D=M\n");
                    fileWriter.write("   @" + labelAddr + "\n");
                    fileWriter.write("   A=M\n");
                    fileWriter.write("   M=D\n");
                    break;
                default:
                    throw new IllegalStateException("Unexpected value: " + segment);
            }
        }
    }

    public void writeArithmetic(String command) throws IOException {
        // Add comment first to indicate VM commad that is followed by HACK assembly
        fileWriter.write("// " + command + "\n");
        // Assembly
        switch (command) {
            case "add":
                fileWriter.write("   @SP\n");
                fileWriter.write("   M=M-1\n");
                fileWriter.write("   A=M\n");
                fileWriter.write("   D=M\n");
                fileWriter.write("   @SP\n");
                fileWriter.write("   M=M-1\n");
                fileWriter.write("   A=M\n");
                fileWriter.write("   D=D+M\n");
                fileWriter.write("   M=D\n");
                fileWriter.write("   @SP\n");
                fileWriter.write("   M=M+1\n");
                break;
            case "sub":
                fileWriter.write("   @SP\n");
                fileWriter.write("   M=M-1\n");
                fileWriter.write("   A=M\n");
                fileWriter.write("   D=M\n");
                fileWriter.write("   @SP\n");
                fileWriter.write("   M=M-1\n");
                fileWriter.write("   A=M\n");
                fileWriter.write("   D=D-M\n");
                fileWriter.write("   M=D\n");
                fileWriter.write("   @SP\n");
                fileWriter.write("   M=M+1\n");
                break;
            case "neg":
                fileWriter.write("   @SP\n");
                fileWriter.write("   A=M\n");
                fileWriter.write("   D=M\n");
                fileWriter.write("   D=-D\n");
                fileWriter.write("   @SP\n");
                fileWriter.write("   A=M\n");
                fileWriter.write("   M=D\n");
                break;
            case "eq":
                String labelEQ = "EQ" + countEQ;
                String labelEQEnd = "EQEND" + countEQ;
                countEQ++;
                fileWriter.write("   @SP\n");
                fileWriter.write("   M=M-1\n");
                fileWriter.write("   A=M\n");
                fileWriter.write("   D=M\n");
                fileWriter.write("   @SP\n");
                fileWriter.write("   M=M-1\n");
                fileWriter.write("   A=M\n");
                fileWriter.write("   D=M-D\n");
                fileWriter.write("   @" + labelEQ + "\n");
                fileWriter.write("   D;JEQ\n");
                fileWriter.write("   @SP\n");
                fileWriter.write("   A=M\n");
                fileWriter.write("   M=0\n");
                fileWriter.write("   @" + labelEQEnd + "\n");
                fileWriter.write("   0;JMP\n");
                fileWriter.write("(" + labelEQ + ")\n");
                fileWriter.write("   @SP\n");
                fileWriter.write("   A=M\n");
                fileWriter.write("   M=1\n");
                fileWriter.write("(" + labelEQEnd + ")\n");
                fileWriter.write("   @SP\n");
                fileWriter.write("   M=M+1\n");
                break;
            case "gt":
                String labelGT = "GT" + countGT;
                String labelGTEnd = "GTEND" + countGT;
                countGT++;
                fileWriter.write("   @SP\n");
                fileWriter.write("   M=M-1\n");
                fileWriter.write("   A=M\n");
                fileWriter.write("   D=M\n");
                fileWriter.write("   @SP\n");
                fileWriter.write("   M=M-1\n");
                fileWriter.write("   A=M\n");
                fileWriter.write("   D=M-D\n");
                fileWriter.write("   @" + labelGT + "\n");
                fileWriter.write("   D;JGT\n");
                fileWriter.write("   @SP\n");
                fileWriter.write("   A=M\n");
                fileWriter.write("   M=0\n");
                fileWriter.write("   @" + labelGTEnd + "\n");
                fileWriter.write("   0;JMP\n");
                fileWriter.write("(" + labelGT + ")\n");
                fileWriter.write("   @SP\n");
                fileWriter.write("   A=M\n");
                fileWriter.write("   M=1\n");
                fileWriter.write("(" + labelGTEnd + ")\n");
                fileWriter.write("   @SP\n");
                fileWriter.write("   M=M+1\n");
                break;
            case "lt":
                String labelLT = "GT" + countLT;
                String labelLTEnd = "GTEND" + countLT;
                countLT++;
                fileWriter.write("   @SP\n");
                fileWriter.write("   M=M-1\n");
                fileWriter.write("   A=M\n");
                fileWriter.write("   D=M\n");
                fileWriter.write("   @SP\n");
                fileWriter.write("   M=M-1\n");
                fileWriter.write("   A=M\n");
                fileWriter.write("   D=M-D\n");
                fileWriter.write("   @" + labelLT + "\n");
                fileWriter.write("   D;JLT\n");
                fileWriter.write("   @SP\n");
                fileWriter.write("   A=M\n");
                fileWriter.write("   M=0\n");
                fileWriter.write("   @" + labelLTEnd + "\n");
                fileWriter.write("   0;JMP\n");
                fileWriter.write("(" + labelLT + ")\n");
                fileWriter.write("   @SP\n");
                fileWriter.write("   A=M\n");
                fileWriter.write("   M=1\n");
                fileWriter.write("(" + labelLTEnd + ")\n");
                fileWriter.write("   @SP\n");
                fileWriter.write("   M=M+1\n");
                break;
            case "and":
                String labelAnd = "AND" + countAnd;
                String labelAndEnd = "ANDEND" + countAnd;
                countAnd++;
                fileWriter.write("   @SP\n");
                fileWriter.write("   M=M-1\n");
                fileWriter.write("   A=M\n");
                fileWriter.write("   D=M\n");
                fileWriter.write("   @" + labelAnd + "\n");
                fileWriter.write("   D;JEQ\n");
                fileWriter.write("   @SP\n");
                fileWriter.write("   M=M-1\n");
                fileWriter.write("   A=M\n");
                fileWriter.write("   D=M\n");
                fileWriter.write("   @" + labelAnd + "\n");
                fileWriter.write("   D;JEQ\n");
                fileWriter.write("   @SP\n");
                fileWriter.write("   A=M\n");
                fileWriter.write("   M=1\n");
                fileWriter.write("   @" + labelAndEnd + "\n");
                fileWriter.write("   0;JMP\n");
                fileWriter.write("(" + labelAnd + ")\n");
                fileWriter.write("   @SP\n");
                fileWriter.write("   A=M\n");
                fileWriter.write("   M=0\n");
                fileWriter.write("(" + labelAndEnd + ")\n");
                fileWriter.write("   @SP\n");
                fileWriter.write("   M=M+1\n");
                break;
            case "or":
                String labelOr = "AND" + countOr;
                String labelOrEnd = "OREND" + countOr;
                countOr++;
                fileWriter.write("   @SP\n");
                fileWriter.write("   M=M-1\n");
                fileWriter.write("   A=M\n");
                fileWriter.write("   D=M\n");
                fileWriter.write("   @" + labelOr + "\n");
                fileWriter.write("   D;JGT\n");
                fileWriter.write("   @SP\n");
                fileWriter.write("   M=M-1\n");
                fileWriter.write("   A=M\n");
                fileWriter.write("   D=M\n");
                fileWriter.write("   @" + labelOr + "\n");
                fileWriter.write("   D;JGT\n");
                fileWriter.write("   @SP\n");
                fileWriter.write("   A=M\n");
                fileWriter.write("   M=0\n");
                fileWriter.write("   @" + labelOrEnd + "\n");
                fileWriter.write("   0;JMP\n");
                fileWriter.write("(" + labelOr + ")\n");
                fileWriter.write("   @SP\n");
                fileWriter.write("   A=M\n");
                fileWriter.write("   M=1\n");
                fileWriter.write("(" + labelOrEnd + ")\n");
                fileWriter.write("   @SP\n");
                fileWriter.write("   M=M+1\n");
                break;
            case "not":
                String labelNot = "NOT" + countNot;
                String labelNotEnd = "NOTEND" + countNot;
                countNot++;
                fileWriter.write("   @SP\n");
                fileWriter.write("   M=M-1\n");
                fileWriter.write("   A=M\n");
                fileWriter.write("   D=M\n");
                fileWriter.write("   @" + labelNot + "\n");
                fileWriter.write("   D;JEQ\n");
                fileWriter.write("   @SP\n");
                fileWriter.write("   A=M\n");
                fileWriter.write("   M=0\n");
                fileWriter.write("   @" + labelNotEnd + "\n");
                fileWriter.write("   0;JMP\n");
                fileWriter.write("(" + labelNot + ")\n");
                fileWriter.write("   @SP\n");
                fileWriter.write("   A=M\n");
                fileWriter.write("   M=1\n");
                fileWriter.write("(" + labelNotEnd + ")\n");
                fileWriter.write("   @SP\n");
                fileWriter.write("   M=M+1\n");
                break;
            default:
                throw new IllegalStateException("Unexpected value: " + command);
        }
    }

    public void close() throws IOException {
        fileWriter.close();
        System.out.println("Wrote to file.");
    }
}
