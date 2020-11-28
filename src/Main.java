import java.io.File;
import java.io.IOException;

public class Main {

    public static void main(String[] args) throws IOException {

        String pathName = "test/";
        String fileName = "StaticTest";

        File file = new File(pathName + fileName);

        if (file.isDirectory()) {
            Parser parser = new Parser(pathName, fileName, ".asm");
            File[] files = file.listFiles();
            assert files != null;
            for (File f : files) {
                parser.readFile(pathName, f.getName());
                parser.advance();
            }
            parser.closeFile();
        } else {
            Parser parser = new Parser(pathName, fileName, ".asm");
            parser.readFile(pathName, fileName + ".vm");
            parser.advance();
            parser.closeFile();
        }

    }
}
