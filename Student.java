import java.util.*;
public class Main{
    static class Person{
        protected String name;
        protected String birthday;
        protected String address;
        public Person(){
            // Constructor
        }
        public Person(String name, String birthday, String address){
            this.name = name;
            this.birthday = chuanHoaNgaySinh(birthday);
            this.address = address;
        }
        public String toString(){
            return name + " " + birthday + " " + address;
        }
    }
    static class Student extends Person{
        protected static int lastStudentId = 0;
        protected int studentId;
        protected double gpa;
        protected String lop;
        public Student(String name, String birthday, String address, String lop, double gpa ){
            super(name, birthday, address);
            lastStudentId++;
            this.studentId = lastStudentId;
            this.gpa = gpa;
            this.lop = lop;
        }
        @Override
        public String toString(){
            return String.format("%04d %s %s %s %s %.2f",studentId, name, birthday, address, lop, gpa);
        }
    }
    public static void main(String[] args){
        Scanner sc = new Scanner(System.in);
        int N = sc.nextInt();
        sc.nextLine();

        ArrayList<Student> students = new ArrayList<>();
        for (int i = 0; i < N; i++) {
            String name = sc.nextLine().trim();
            String[] info1 = sc.nextLine().trim().split(",");
            String birthday = info1[0].trim();
            String address = info1[1].trim();
            String lop = sc.nextLine().trim();
            double gpa = Double.parseDouble(sc.nextLine().trim());

            Student student = new Student(name, birthday, address, lop, gpa);
            students.add(student);
        }

        for (Student student : students) {
            System.out.println(student.toString());
        }
        sc.close();
    }
    private static String chuanHoaNgaySinh(String birthday){
        StringBuilder sb = new StringBuilder(birthday);
        if (sb.charAt(1) == '/'){
            sb.insert(0, '0');
        }
        if (sb.charAt(4) == '/'){
            sb.insert(3, '0');
        }
        return sb.toString();
    }
}
