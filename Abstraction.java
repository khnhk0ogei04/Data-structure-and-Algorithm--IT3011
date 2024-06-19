abstract class Shape{
    public abstract void perimeter();
    public abstract void area();
}
class Circle extends Shape{
    private double radius;
    public Circle(){
        // Constructor
    }
    public Circle(double radius){
        this.radius = radius;
    }
    @Override
    public void perimeter(){
        double perimeter =  Math.PI*2*radius;
        System.out.println(perimeter);
    }
    @Override
    public void area(){
        System.out.println(String.format("%.2f",Math.PI*radius*radius));
    }
}
class Rectangle extends Shape{
    private double length;
    private double width;
    public Rectangle(){
        System.out.println("LOZ");
    }
    public Rectangle(double length, double width){
        this.length = length;
        this.width = width;
    }
    @Override
    public void perimeter(){
        System.out.println(String.format("%.2f", (length + width) * 2));
    }
    @Override
    public void area(){
        System.out.println(String.format("%.2f", length* width));
    }
}
public class Test{
    public static void main(String[] args){
        Shape shape = new Circle(3);
        Circle circle = (Circle) shape; // Downcasting
        circle.area();
        Shape shape2 = new Rectangle(5, 4);
        shape2.perimeter();
        Rectangle r = new Rectangle(); // Print "LOZ" 
    }
}
