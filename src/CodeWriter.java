/**
 * Writes assembly code.
 */
public class CodeWriter {

    public String emitPush(String literal) {
        String assembly = "@17\n";
        if (literal.equals("push")) {
            assembly += "D=A\n";
        }

        return assembly;
    }
}
