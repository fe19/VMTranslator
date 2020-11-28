import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Scanner;

/**
 * Parses a VM file.
 * Reads a VM command and parses it into its lexical elements.
 */
public class Parser {

    FileReader fileReader;
    CodeWriter codeWriter;
    Scanner scanner;
    String currentCommand;

    public Parser(String outputPath, String outputFile, String outputEnd) throws IOException {
        codeWriter = new CodeWriter(outputPath, outputFile, outputEnd);
        codeWriter.writeInit();
    }

    public void readFile(String path, String fileEnd) throws FileNotFoundException {
        fileReader = new FileReader(path + fileEnd);
        scanner = new Scanner(fileReader);
    }

    public void closeFile() throws IOException {
        codeWriter.close();
    }

    public boolean hasMoreCommands() {
        return scanner.hasNextLine();
    }

    /**
     * Go through file line by line. Each line corresponds to a VM command.
     */
    public void advance() throws IOException {
        while (hasMoreCommands()) {
            String line = scanner.nextLine();
            // remove comments
            if (line.contains("//")) {
                line = line.split("//")[0];   // take only part before comment
            }
            // ignore spaces
            if (!line.isEmpty()) {
                currentCommand = line;
                System.out.println("VM command = " + currentCommand);
                String[] commands = currentCommand.split(" ");
                switch (commands[0]) {
                    case "push":
                    case "pop":
                        codeWriter.writePushPop(commands[0], commands[1], Integer.parseInt(commands[2].trim()));
                        break;
                    case "add":
                    case "sub":
                    case "neg":
                    case "eq":
                    case "gt":
                    case "lt":
                    case "and":
                    case "or":
                    case "not":
                        codeWriter.writeArithmetic(currentCommand.trim());
                        break;
                    case "label":
                        codeWriter.writeLabel(commands[1]);
                        break;
                    case "goto":
                        codeWriter.writeGoto(commands[1]);
                        break;
                    case "if-goto":
                        codeWriter.writeIf(commands[1]);
                        break;
                    case "function":
                        codeWriter.writeFunction(commands[1], Integer.parseInt(commands[2].trim()));
                        break;
                    case "call":
                        codeWriter.writeCall(commands[1], Integer.parseInt(commands[2].trim()));
                        break;
                    case "return":
                        codeWriter.writeReturn();
                        break;
                    default:
                        throw new IllegalStateException("Unexpected VM command: " + commands[0]);
                }
            }
        }
    }

}
