public class Main {
    public static void main(String[] args){
        Manager manager = new Manager();
        manager.generateStudent();
        while (true) {
            System.out.println("-----------Chương trình quản lý sinh viên-------------");
            System.out.println("1. Create");
            System.out.println("2. Find And Sort");
            System.out.println("3. Update");
            System.out.println("4. Report");
            System.out.println("5. Exit");
            int choice = Validation.inputInt("Enter choice: ", 1, 5);
            switch (choice) {
                case 1:
                    manager.createStudent();
                    break;
                case 2:
                    manager.FindAndSort();
                    break;
                case 3:
                    manager.updateOrDelete();
                    break;
                case 4:
                    manager.getReport();
                    break;
                case 5:
                    return;
            }
        }
    }
}