import java.io.FileReader;
import java.io.IOException;
import java.util.Scanner;

/**
 * Parses a VM file.
 * Reads a VM command and parses it into its lexical elements.
 */
public class Parser {

    private final String C_PUSH = "C_PUSH";
    private final String C_POP = "C_POP";
    private final String C_ARITHMETIC = "C_ARITHMETIC";
    private final String C_LABEL = "C_LABEL";
    private final String C_GOTO = "C_GOTO";
    private final String C_IF = "C_IF";
    private final String C_FUNCTION = "C_FUNCTION";
    private final String C_RETURN = "C_RETURN";

    String fileName;
    FileReader fileReader;
    CodeWriter codeWriter;
    Scanner scanner;
    String currentCommand;

    public Parser(String filename) throws IOException {
        this.fileName = filename;
        fileReader = new FileReader(filename + ".vm");
        codeWriter = new CodeWriter(filename + ".asm");
        scanner = new Scanner(fileReader);
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
            // ignore spaces and comments
            if (!line.isEmpty() && !line.contains("//")) {
                currentCommand = line;
                System.out.println("VM command = " + currentCommand);
                String[] commands = currentCommand.split(" ");
                switch (commandType()) {
                    case C_PUSH:
                    case C_POP:
                        codeWriter.writePushPop(commands[0], commands[1], Integer.parseInt(commands[2]), fileName);
                        break;
                    case C_ARITHMETIC:
                        codeWriter.writeArithmetic(currentCommand);
                        break;
                    case C_LABEL:
                        codeWriter.writeLabel(commands[1]);
                        break;
                    case C_GOTO:
                        codeWriter.writeGoto(commands[1]);
                        break;
                    case C_IF:
                        codeWriter.writeIf(commands[1]);
                        break;
                    case C_FUNCTION:
                        // Project 8: implement function
                        break;
                    case C_RETURN:
                        // Project 8: implement return
                        break;
                    default:
                        throw new IllegalStateException("Unexpected value: " + commandType());
                }
            }
        }
        codeWriter.close();
    }

    public String commandType() {
        if (currentCommand.contains("push")) {
            return C_PUSH;
        } else if (currentCommand.contains("pop")) {
            return C_POP;
        } else if (currentCommand.contains("label")) {
            return C_LABEL;
        } else if (currentCommand.contains("goto")) {
            return C_GOTO;
        } else if (currentCommand.contains("if")) {
            return C_IF;
        } else if (currentCommand.contains("function")) {
            return C_FUNCTION;
        } else if (currentCommand.contains("return")) {
            return C_RETURN;
        } else {
            return C_ARITHMETIC;
        }
    }

}
