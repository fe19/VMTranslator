import java.io.File;
import java.io.IOException;

public class Main {

    public static void main(String[] args) throws IOException {

        String fileName = "test/FibonacciElement";
        File file = new File(fileName);

        if (file.isDirectory()) {
            System.out.println("Directory");
        } else {
            Parser parser = new Parser(fileName);
            parser.advance();
        }

    }
}
