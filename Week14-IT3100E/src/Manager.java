import java.util.ArrayList;
import java.util.Scanner;
import java.util.Collections;
import java.util.HashMap;
public class Manager {
    /**
     *
     */
    ArrayList<Student> students = new ArrayList<Student>();
    public ArrayList<Student> getStudents() {
        return students;
    }
    public void setStudents(ArrayList<Student> students){
        this.students = students;
    }
    public boolean checkStudentExists(String id, String studentName, String semester, String courseName) {
        for (Student student : students) {
            if (id.equalsIgnoreCase(student.getId())
                    && semester.equalsIgnoreCase(student.getSemester())
                    && courseName.equalsIgnoreCase(student.getCourseName())
                    && studentName.equalsIgnoreCase(student.getStudentName())
            )
                return true;
        }
        return false;
    }
    public Student checkIdExist(String id){
        for (Student student: students){
            if (id.equalsIgnoreCase(student.getId())){
                return student;
            }
        }
        return null;
    }
    public void createStudent(){
        while (true){
            String id = Validation.inputString("Enter id:", "[A-Za-z0-9\\s]+");
            Student student = checkIdExist(id);
            String name;
            if (student == null) {
                name = Validation.inputString("Enter name: ", "[A-Za-z\\s]+");
            } else {
                name = student.getStudentName();
            }
            String semester = Validation.inputString("Enter semester", "[A-Za-z\\s]+");
            String course = Validation.checkInputCourse("Enter course: ");
            if (checkStudentExists(id, name, semester, course)){
                students.add(new Student(id, name, semester, course));
            } else {
                System.out.println("This student is existed in class");
            }
            if (students.size() > 10){
                boolean YesNo = Validation.checkInputYesNo("Do you want to continue?");
                if (!YesNo){
                    break;
                }
            }
        }
    }
    public void FindAndSort(){
        String name = Validation.inputString("Enter name", "[A-Za-z\\s]+");
        Collections.sort(students);
        if (students.isEmpty()){
            System.out.println("No students found");
        } else {
            for (Student student: students){
                if (student.getStudentName().trim().toLowerCase().contains(name.toLowerCase())){
                    System.out.println(student.toString());
                }
            }
        }
    }
    public void updateOrDelete(){
        for (Student student: students){
            System.out.println(student.toString());
        }
        String id = Validation.inputString("Enter id: ", "[A-Za-z0-9\\s]+");
        ArrayList<Student> studentsWithId = getListStudentsById(id);
        if (studentsWithId.isEmpty()){
            System.out.println("No students found with id: " + id);
            return;
        }
        else {
            System.out.println("Found " + studentsWithId.size() + " records with this id");
            if (Validation.checkInputYesNo("Do you want to create or delete student?")) {
                String name = Validation.inputString("Enter name: ", "[A-Za-z\\s]+");
                String semester = Validation.inputString("Enter semester: ", "[A-Za-z\\s]+");
                String course = Validation.checkInputCourse("Enter course: ");
                if (checkStudentExists(id, name, semester, course)) {
                    System.out.println("Duplicated data");
                } else {
                    if (id.equalsIgnoreCase(studentsWithId.getFirst().getId())) {
                        for (Student std : studentsWithId) {
                            std.setStudentName(name);
                            std.setCourseName(course);
                            std.setSemester(semester);
                        }
                    }
                }
            }
            else {
                students.remove(studentsWithId);
            }
        }
    }
    public ArrayList<Student> getListStudentsById(String id){
        ArrayList<Student> arr = new ArrayList<>();
        for (Student student : students) {
            if (student.getId().trim().equalsIgnoreCase(id)) {
                arr.add(student);
            }
        }
        return arr;
    }
    public void getReport(){
        HashMap<String, Integer> reports = new HashMap<>();
        for (Student student: students){
            String key = student.getId() + "#" + student.getStudentName() + "|" + student.getCourseName();
            if (reports.containsKey(key)){
                int total = reports.get(key);
                reports.put(key, total + 1);
            }
            else {
                reports.put(key, 1);
            }
        }
        for (String key: reports.keySet()){
            System.out.println(key.split("#")[1] + "|" + reports.get(key));
        }
    }
    public void generateStudent(){
        students.add(new Student("s1", "Long", "Fall", "Java"));
        students.add(new Student("s1", "Long", "Summer", "C/C++"));
        students.add(new Student("s2", "Chi", "Fall", ".NET"));
        students.add(new Student("s3", "Khánh", "Winter", "Java"));
    }
}
