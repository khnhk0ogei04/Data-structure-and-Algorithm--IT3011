package week8;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

public class ReadFile {
	public static void main(String[] args) {
		ArrayList<String> arr = new ArrayList<>();
		ArrayList<Integer> arr_lst = new ArrayList<>();
		try {
		FileReader fileReader = new FileReader("src/week8/diemmy.txt");
		BufferedReader bufferedReader = new BufferedReader(fileReader);
		String line;
			while ((line = bufferedReader.readLine()) != null) {
				System.out.println(line);
				arr.add(line);
				try {
					int number = Integer.parseInt(line);
					arr_lst.add(number);
				} catch (NumberFormatException ex) {
					ex.printStackTrace();
				}
			}
			bufferedReader.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		if (!arr_lst.isEmpty()) {
			StringBuilder result = new StringBuilder("Non-integer values:\n");
            for (Integer nonInteger : arr_lst) {
                result.append(nonInteger).append("\n");
            }
            WriteFile.appendLine(result.toString());
		}
		
	}
}
