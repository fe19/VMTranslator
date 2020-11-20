import java.io.IOException;

public class Main {

    public static void main(String[] args) throws IOException {

        Parser parser = new Parser("SimpleAdd.vm");
        parser.advance();

        CodeWriter codeWriter = new CodeWriter("SimpleAdd.asm");
        codeWriter.close();
    }
}
