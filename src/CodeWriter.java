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

    public void writeArithmetic(String command) throws IOException {
        fileWriter.write(command);
    }

    public void writePushPop(String command, String segment, int index) throws IOException {
        fileWriter.write(command);
    }

    public void close() throws IOException {
        fileWriter.close();
        System.out.println("Wrote to file.");
    }
}
