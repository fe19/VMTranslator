import java.io.FileWriter;
import java.io.IOException;

/**
 * Generates assembly code from the parsed VM command.
 */
public class CodeWriter {

    FileWriter fileWriter;
    String fileName;

    int countAddr = 0;
    int countEQ = 0;
    int countGT = 0;
    int countLT = 0;

    public CodeWriter(String filename) throws IOException {
        fileWriter = new FileWriter(filename);
        this.fileName = filename;
    }

    public void writePushPop(String command, String segment, int index) throws IOException {
        // Add comment first to indicate VM command that is followed by HACK assembly
        fileWriter.write("// " + command + " " + segment + " " + index + "\n");
        // Assembly for push command
        if (command.equals("push")) {
            switch (segment) {
                case "constant":
                    fileWriter.write("   // *SP = i\n");
                    fileWriter.write("   @" + index + "\n");
                    fileWriter.write("   D=A\n");
                    fileWriter.write("   @SP\n");
                    fileWriter.write("   A=M\n");
                    fileWriter.write("   M=D\n");
                    fileWriter.write("   // SP++\n");
                    fileWriter.write("   @SP\n");
                    fileWriter.write("   M=M+1\n");
                    break;
                case "local":
                    fileWriter.write("   // *SP = *(LCL + i)\n");
                    fileWriter.write("   @" + index + "\n");
                    fileWriter.write("   D=A\n");
                    fileWriter.write("   @LCL\n");
                    fileWriter.write("   D=D+M\n");
                    fileWriter.write("   A=D\n");
                    fileWriter.write("   D=M\n");
                    fileWriter.write("   @SP\n");
                    fileWriter.write("   A=M\n");
                    fileWriter.write("   M=D\n");
                    fileWriter.write("   // SP++\n");
                    fileWriter.write("   @SP\n");
                    fileWriter.write("   M=M+1\n");
                    break;
                case "argument":
                    fileWriter.write("   // *SP = *(ARG + i)\n");
                    fileWriter.write("   @" + index + "\n");
                    fileWriter.write("   D=A\n");
                    fileWriter.write("   @ARG\n");
                    fileWriter.write("   D=D+M\n");
                    fileWriter.write("   A=D\n");
                    fileWriter.write("   D=M\n");
                    fileWriter.write("   @SP\n");
                    fileWriter.write("   A=M\n");
                    fileWriter.write("   M=D\n");
                    fileWriter.write("   // SP++\n");
                    fileWriter.write("   @SP\n");
                    fileWriter.write("   M=M+1\n");
                    break;
                case "this":
                    fileWriter.write("   // *SP = *(THIS + i)\n");
                    fileWriter.write("   @" + index + "\n");
                    fileWriter.write("   D=A\n");
                    fileWriter.write("   @THIS\n");
                    fileWriter.write("   D=D+M\n");
                    fileWriter.write("   A=D\n");
                    fileWriter.write("   D=M\n");
                    fileWriter.write("   @SP\n");
                    fileWriter.write("   A=M\n");
                    fileWriter.write("   M=D\n");
                    fileWriter.write("   // SP++\n");
                    fileWriter.write("   @SP\n");
                    fileWriter.write("   M=M+1\n");
                    break;
                case "that":
                    fileWriter.write("   // *SP = *(THAT + i)\n");
                    fileWriter.write("   @" + index + "\n");
                    fileWriter.write("   D=A\n");
                    fileWriter.write("   @THAT\n");
                    fileWriter.write("   D=D+M\n");
                    fileWriter.write("   A=D\n");
                    fileWriter.write("   D=M\n");
                    fileWriter.write("   @SP\n");
                    fileWriter.write("   A=M\n");
                    fileWriter.write("   M=D\n");
                    fileWriter.write("   // SP++\n");
                    fileWriter.write("   @SP\n");
                    fileWriter.write("   M=M+1\n");
                    break;
                case "temp":
                    fileWriter.write("   // *SP = *(5 + i)\n");
                    fileWriter.write("   @" + index + "\n");
                    fileWriter.write("   D=A\n");
                    fileWriter.write("   @5\n");
                    fileWriter.write("   D=D+A\n");
                    fileWriter.write("   A=D\n");
                    fileWriter.write("   D=M\n");
                    fileWriter.write("   @SP\n");
                    fileWriter.write("   A=M\n");
                    fileWriter.write("   M=D\n");
                    fileWriter.write("   // SP++\n");
                    fileWriter.write("   @SP\n");
                    fileWriter.write("   M=M+1\n");
                    break;
                case "static":
                    fileWriter.write("   // *SP = *filename.i\n");
                    fileWriter.write("   @" + fileName + "." + index + "\n");
                    fileWriter.write("   D=M\n");
                    fileWriter.write("   @SP\n");
                    fileWriter.write("   A=M\n");
                    fileWriter.write("   M=D\n");
                    fileWriter.write("   // SP++\n");
                    fileWriter.write("   @SP\n");
                    fileWriter.write("   M=M+1\n");
                    break;
                case "pointer":
                    if (index == 0) {
                        fileWriter.write("   // *SP = THIS\n");
                        fileWriter.write("   @THIS\n");
                        fileWriter.write("   D=M\n");
                    } else {
                        fileWriter.write("   // *SP = THAT\n");
                        fileWriter.write("   @THAT\n");
                        fileWriter.write("   D=M\n");
                    }
                    fileWriter.write("   @SP\n");
                    fileWriter.write("   A=M\n");
                    fileWriter.write("   M=D\n");
                    fileWriter.write("   // SP++\n");
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
                    fileWriter.write("   D=D+A\n");
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
                case "static":
                    fileWriter.write("   // SP--\n");
                    fileWriter.write("   @SP\n");
                    fileWriter.write("   M=M-1\n");
                    fileWriter.write("   // *filename.i = *SP\n");
                    fileWriter.write("   A=M\n");
                    fileWriter.write("   D=M\n");
                    fileWriter.write("   @" + fileName + "." + index + "\n");
                    fileWriter.write("   M=D\n");
                    break;
                case "pointer":
                    fileWriter.write("   // SP--\n");
                    fileWriter.write("   @SP\n");
                    fileWriter.write("   M=M-1\n");
                    fileWriter.write("   // D = *SP\n");
                    fileWriter.write("   @SP\n");
                    fileWriter.write("   A=M\n");
                    fileWriter.write("   D=M\n");
                    if (index == 0) {
                        fileWriter.write("   // THIS = *SP\n");
                        fileWriter.write("   @THIS\n");
                        fileWriter.write("   M=D\n");
                    } else {
                        fileWriter.write("   // THAT = *SP\n");
                        fileWriter.write("   @THAT\n");
                        fileWriter.write("   M=D\n");
                    }


                    break;
                default:
                    throw new IllegalStateException("Unexpected value: " + segment);
            }
        }
    }

    public void writeArithmetic(String command) throws IOException {
        // Add comment first to indicate VM command that is followed by HACK assembly
        fileWriter.write("// " + command + "\n");
        // Assembly
        switch (command) {
            case "add":
                fileWriter.write("   // SP--\n");
                fileWriter.write("   @SP\n");
                fileWriter.write("   M=M-1\n");
                fileWriter.write("   // SP = X + Y\n");
                fileWriter.write("   A=M\n");
                fileWriter.write("   D=M\n");
                fileWriter.write("   @SP\n");
                fileWriter.write("   M=M-1\n");
                fileWriter.write("   A=M\n");
                fileWriter.write("   D=D+M\n");
                fileWriter.write("   M=D\n");
                fileWriter.write("   // SP++\n");
                fileWriter.write("   @SP\n");
                fileWriter.write("   M=M+1\n");
                break;
            case "sub":
                fileWriter.write("   // SP--\n");
                fileWriter.write("   @SP\n");
                fileWriter.write("   M=M-1\n");
                fileWriter.write("   // *SP = X - Y\n");
                fileWriter.write("   A=M\n");
                fileWriter.write("   D=M\n");
                fileWriter.write("   @SP\n");
                fileWriter.write("   M=M-1\n");
                fileWriter.write("   A=M\n");
                fileWriter.write("   D=M-D\n");
                fileWriter.write("   M=D\n");
                fileWriter.write("   // SP++\n");
                fileWriter.write("   @SP\n");
                fileWriter.write("   M=M+1\n");
                break;
            case "neg":
                fileWriter.write("   // SP--\n");
                fileWriter.write("   @SP\n");
                fileWriter.write("   M=M-1\n");
                fileWriter.write("   // *SP = -*SP\n");
                fileWriter.write("   A=M\n");
                fileWriter.write("   M=-M\n");
                fileWriter.write("   // SP++\n");
                fileWriter.write("   @SP\n");
                fileWriter.write("   M=M+1\n");
                break;
            case "eq":
                String labelEQ = "EQ" + countEQ;
                String labelEQEnd = "EQEND" + countEQ;
                countEQ++;
                fileWriter.write("   // SP--\n");
                fileWriter.write("   @SP\n");
                fileWriter.write("   M=M-1\n");
                fileWriter.write("   A=M\n");
                fileWriter.write("   D=M\n");
                fileWriter.write("   // SP--\n");
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
                fileWriter.write("   M=-1\n");
                fileWriter.write("(" + labelEQEnd + ")\n");
                fileWriter.write("   // SP++\n");
                fileWriter.write("   @SP\n");
                fileWriter.write("   M=M+1\n");
                break;
            case "gt":
                String labelGT = "GT" + countGT;
                String labelGTEnd = "GTEND" + countGT;
                countGT++;
                fileWriter.write("   // SP--\n");
                fileWriter.write("   @SP\n");
                fileWriter.write("   M=M-1\n");
                fileWriter.write("   A=M\n");
                fileWriter.write("   D=M\n");
                fileWriter.write("   // SP--\n");
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
                fileWriter.write("   M=-1\n");
                fileWriter.write("(" + labelGTEnd + ")\n");
                fileWriter.write("   // SP++\n");
                fileWriter.write("   @SP\n");
                fileWriter.write("   M=M+1\n");
                break;
            case "lt":
                String labelLT = "LT" + countLT;
                String labelLTEnd = "LTEND" + countLT;
                countLT++;
                fileWriter.write("   // SP--\n");
                fileWriter.write("   @SP\n");
                fileWriter.write("   M=M-1\n");
                fileWriter.write("   A=M\n");
                fileWriter.write("   D=M\n");
                fileWriter.write("   // SP--\n");
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
                fileWriter.write("   M=-1\n");
                fileWriter.write("(" + labelLTEnd + ")\n");
                fileWriter.write("   // SP++\n");
                fileWriter.write("   @SP\n");
                fileWriter.write("   M=M+1\n");
                break;
            case "and":
                fileWriter.write("   // SP--\n");
                fileWriter.write("   @SP\n");
                fileWriter.write("   M=M-1\n");
                fileWriter.write("   // *SP = X & Y\n");
                fileWriter.write("   A=M\n");
                fileWriter.write("   D=M\n");
                fileWriter.write("   @SP\n");
                fileWriter.write("   M=M-1\n");
                fileWriter.write("   A=M\n");
                fileWriter.write("   M=D&M\n");
                fileWriter.write("   // SP++\n");
                fileWriter.write("   @SP\n");
                fileWriter.write("   M=M+1\n");
                break;
            case "or":
                fileWriter.write("   // SP--\n");
                fileWriter.write("   @SP\n");
                fileWriter.write("   M=M-1\n");
                fileWriter.write("   // *SP = X | Y\n");
                fileWriter.write("   A=M\n");
                fileWriter.write("   D=M\n");
                fileWriter.write("   @SP\n");
                fileWriter.write("   M=M-1\n");
                fileWriter.write("   A=M\n");
                fileWriter.write("   M=D|M\n");
                fileWriter.write("   // SP++\n");
                fileWriter.write("   @SP\n");
                fileWriter.write("   M=M+1\n");
                break;
            case "not":
                fileWriter.write("   // SP--\n");
                fileWriter.write("   @SP\n");
                fileWriter.write("   M=M-1\n");
                fileWriter.write("   // *SP = !*SP\n");
                fileWriter.write("   A=M\n");
                fileWriter.write("   M=!M\n");
                fileWriter.write("   // SP++\n");
                fileWriter.write("   @SP\n");
                fileWriter.write("   M=M+1\n");
                break;
            default:
                throw new IllegalStateException("Unexpected value: " + command);
        }
    }

    public void writeInit() throws IOException {
        fileWriter.write("// init\n");
        fileWriter.write("   @256\n");
        fileWriter.write("   D=A\n");
        fileWriter.write("   @SP\n");
        fileWriter.write("   M=D\n");
        //TODO call Sys.init
    }

    public void writeLabel(String label) throws IOException {
        fileWriter.write("// label " + label + "\n");
        fileWriter.write("(" + label + ")\n");
    }

    public void writeGoto(String label) throws IOException {
        fileWriter.write("// goto " + label + "\n");
        fileWriter.write("   @" + label + "\n");
        fileWriter.write("   0;JMP" + "\n");
    }

    public void writeIf(String label) throws IOException {
        fileWriter.write("// goto-if " + label + "\n");
        fileWriter.write("   // SP--\n");
        fileWriter.write("   @SP\n");
        fileWriter.write("   M=M-1\n");
        fileWriter.write("   // if (x > y) goto LABEL\n");
        fileWriter.write("   A=M\n");
        fileWriter.write("   @" + label + "\n");
        fileWriter.write("   M;JGT\n");
    }

    public void writeFunction(String functionName, int numVars) throws IOException {
        // TODO
    }

    public void writeCall(String functionName, int numVars) throws IOException {
        // TODO
    }

    public void writeReturn() throws IOException {
        // TODO
    }

    public void close() throws IOException {
        fileWriter.close();
        System.out.println("Wrote to file.");
    }
}
