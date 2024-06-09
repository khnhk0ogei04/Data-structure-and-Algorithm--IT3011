package week8;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

public class WriteFile {
	public static void appendLine(String line){
		try {
            BufferedWriter writer = new BufferedWriter(new FileWriter("src/week8/diemmy.txt",true));
            writer.write(line);
            writer.newLine();
            writer.close();
            System.out.println("Successfully write on file");
        } catch (IOException e) {
            e.printStackTrace();
        }
	}
}
