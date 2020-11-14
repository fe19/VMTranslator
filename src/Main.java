import java.io.FileWriter;
import java.io.IOException;

/**
 * Input: name.vm
 * Output: name.asm
 * Goes through input file and parses it line by line and generates assembly code.
 */
public class Main {

    static String filename = "output.txt";

    public static void main(String[] args) {

        writeFile(filename);

    }

    private static void writeFile(String filename) {

        System.out.println("Write file " + filename);

        try {
            FileWriter myWriter = new FileWriter(filename);
            myWriter.write("Files in Java might be tricky, but it is fun enough!");
            myWriter.close();
            System.out.println("Successfully wrote to the file.");
        } catch (IOException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }
    }
}
