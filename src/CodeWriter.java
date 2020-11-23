import java.io.FileWriter;
import java.io.IOException;

/**
 * Generates assembly code from the parsed VM command.
 */
public class CodeWriter {

    FileWriter fileWriter;

    public CodeWriter(String filename) throws IOException {
        fileWriter = new FileWriter(filename);
    }

    public void writePushPop(String command, String segment, int index) throws IOException {
        // Add comment first to indicate VM commad that is followed by HACK assembly
        fileWriter.write("// " + command + " " + segment + " " + index + "\n");
        // Write assembly code for push command
        if (command.equals("push")) {
            if (segment.equals("constant")) {
                fileWriter.write("@" + index+ "\n");
                fileWriter.write("D=A\n");
                fileWriter.write("@SP\n");
                fileWriter.write("A=M\n");
                fileWriter.write("M=D\n");
                fileWriter.write("@SP\n");
                fileWriter.write("M=M+1\n");
            }
        }
    }

    public void writeArithmetic(String command) throws IOException {
        // Add comment first to indicate VM commad that is followed by HACK assembly
        fileWriter.write("// " + command + "\n");
    }

    public void close() throws IOException {
        fileWriter.close();
        System.out.println("Wrote to file.");
    }
}
