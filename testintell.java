import java.util.ArrayList;
import java.util.Scanner;
class Vehicle1 {
    private int id;
    private String type;
    private String color;
    public Vehicle1(){
        // Constructor
    }
    public Vehicle1(int id, String type, String color) {
        this.id = id;
        this.type = type;
        this.color = color;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String toString(){
        return this.id + " " + this.type + " " + this.color;
    }
}
public class Vehicle{
    public static void main(String[] args){
        Vehicle1 v = new Vehicle1(1, "Motorbike", "red");
        Vehicle1 v2 = new Vehicle1(2, "Car", "green");
        ArrayList<Vehicle1> arr = new ArrayList<>();
        arr.add(v);
        arr.add(v2);
        for (int i = 0; i < arr.size(); i++){
            System.out.println(arr.get(i).getColor());
        }
    }
}
