import java.io.File;
import java.io.IOException;

public class Main {

    public static void main(String[] args) throws IOException {

        String pathName = "test/FibonacciElement";
        File filePath = new File(pathName);

        if (filePath.isDirectory()) {
            Parser parser = new Parser(pathName + ".asm");
            File[] files = filePath.listFiles();
            assert files != null;
            for (File file : files) {
                parser.readFile(pathName + "/" + file.getName());
                parser.advance();
            }
            parser.closeFile();
        } else {
            Parser parser = new Parser(pathName + ".asm");
            parser.readFile(pathName + ".vm");
            parser.advance();
            parser.closeFile();
        }

    }
}
