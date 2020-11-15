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

    static String filename = "example";

    public static void main(String[] args) {

        String result = readFile(filename);
        writeFile(result, filename);

    }

    private static String readFile(String filename) {
        StringBuilder result = new StringBuilder();
        Parser parser = new Parser();

        try {
            FileReader fileReader = new FileReader(filename + ".vm");
            Scanner scanner = new Scanner(fileReader);

            while (scanner.hasNextLine()) {
                String line = scanner.nextLine();
                System.out.println("Line = " + line);
                result.append(parser.parseLine(line));
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }

        return result.toString();
    }

    private static void writeFile(String content, String filename) {

        try {
            FileWriter fileWriter = new FileWriter(filename + ".asm");
            fileWriter.write(content);
            fileWriter.close();
            System.out.println("Successfully wrote to the file.");
        } catch (IOException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }
    }
}
