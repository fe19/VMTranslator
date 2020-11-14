import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

/**
 * Input: name.vm
 * Output: name.asm
 * Goes through input file and parses it line by line and generates assembly code.
 */
public class Main {

    static String filename = "output.txt";

    public static void main(String[] args) {

        writeFile(filename);
        readFile(filename);

    }

    private static void readFile(String filename) {
        try {
            FileReader fileReader = new FileReader(filename);
            Scanner scanner = new Scanner(fileReader);
            while (scanner.hasNext()) {
                System.out.println(scanner.next());
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }

    }

    private static void writeFile(String filename) {

        try {
            FileWriter fileWriter = new FileWriter(filename);
            fileWriter.write("First line\n");
            fileWriter.write("Next line\n");
            fileWriter.close();
            System.out.println("Successfully wrote to the file.");
        } catch (IOException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }
    }
}
