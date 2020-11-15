import java.util.Scanner;

/**
 * Parses each VM command in its lexical elements. Ignores spaces.
 */
public class Parser {

    public String parseLine(String line) {
        StringBuilder assembly = new StringBuilder();
        CodeWriter codeWriter = new CodeWriter();

        Scanner scanner = new Scanner(line);
        while (scanner.hasNext()) {
            String literal = scanner.next();
            System.out.println("Literal = " + literal);
            if (literal.equals("push")) {
                assembly.append(codeWriter.emitPush(literal));
            }
        }

        return assembly.toString();
    }
}
