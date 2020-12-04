import java.io.File;
import java.io.IOException;

public class Main {

    public static void main(String[] args) throws IOException {

        String pathName = "test/";
        String content = "FibonacciElement";
        boolean isBootstrapActive = true;   // For files without Sys.init function (e.g., SimpleFunction) set to false

        File file = new File(pathName + content);

        if (file.isDirectory()) {
            Parser parser = new Parser(pathName, content, ".asm", isBootstrapActive);
            File[] files = file.listFiles();
            assert files != null;
            for (File f : files) {
                parser.readFile(pathName, content + "/", f.getName());
                parser.advance();
            }
            parser.closeFile();
        } else {
            Parser parser = new Parser(pathName, content, ".asm", isBootstrapActive);
            parser.readFile(pathName, content, ".vm");
            parser.advance();
            parser.closeFile();
        }

    }
}
