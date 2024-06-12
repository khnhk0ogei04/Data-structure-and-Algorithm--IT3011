import java.util.Scanner;

public class Validation {
    private final static Scanner sc = new Scanner(System.in);
    public static int inputInt(String mess, int min, int max){
        System.out.println(mess);
        while (true){
            String input = sc.nextLine();
            try {
                int num = Integer.parseInt(input);
                if (num < min || num > max){
                    System.out.println("Invalid input, type again");
                    continue;
                }
                return num;
            } catch (NumberFormatException ex){
                System.out.print("Please input an integer number");
            }
        }
    }
    public static double inputDouble(String mess, double min, double max){
        System.out.println(mess);
        while (true){
            String input = sc.nextLine();
            try{
                double num = Double.parseDouble(input);
                if (num < min || num > max){
                    System.out.println("Please input between" + min + " " + max);
                    continue;
                }
                return num;
            }
            catch (NumberFormatException ex){
                ex.printStackTrace();
                System.out.println("Please input an number");
            }
        }
    }
    public static String inputString(String mess, String regex){
        System.out.println(mess);
        while(true){
            String input = sc.nextLine();
            if (!input.matches(regex)){
                System.out.println("Please input match regex");
                continue;
            }
            return input;
        }
    }
    public static boolean checkInputYesNo(String mess){
        System.out.println(mess);
        while(true){
            String result = sc.nextLine();
            if (result.equalsIgnoreCase("Y")){
                return true;
            }
            else if (result.equalsIgnoreCase("N")){
                return false;
            }
            System.out.println("Input must be `y/Y` or `n/N`, enter again");
        }
    }
    public static String checkInputCourse(String mess){
        System.out.println(mess);
        while (true){
            String result = sc.nextLine();
            if (result.equalsIgnoreCase("java") || result.equalsIgnoreCase(".net") || result.equalsIgnoreCase("C/C++")){
                return result;
            }
            System.out.println("There are only three courses in this semester");
            System.out.print("Enter again");
        }
    }
}
