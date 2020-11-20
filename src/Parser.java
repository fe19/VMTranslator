import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.Scanner;

/**
 * Parses a VM file.
 * Reads a VM command and parses it into its lexical elements.
 */
public class Parser {

    FileReader fileReader;
    String currentCommand;

    public Parser(String filename) throws FileNotFoundException {
        fileReader = new FileReader(filename);
    }

    public void advance(){
        // go through file line by line. A line corresponds to a VM command.
        Scanner scanner = new Scanner(fileReader);
        while (scanner.hasNextLine()) {
            String line = scanner.nextLine();
            // ignore spaces and comments
            System.out.println("VM command = " + line);
        }
        // for each

    }

}
