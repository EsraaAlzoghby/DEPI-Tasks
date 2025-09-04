/*4.Create a struct named Rectangle that represents a rectangle with the following fields:
width(type: double)
height(type: double)
Implement encapsulation by making the fields private and provide public properties access and modify these values.
Ensure the following conditions are met:
1.The width and height should not be negative. If a negative value is provided,
the setter should not update the field and should instead print an error message.
2.Implement a public read -only property Area that calculates and returns the area of the rectangle (Area = width * height).
3.Implement a method DisplayInfo that prints the rectangle's dimensions and area.
4.Write a program to demonstrate the usage of this struct by creating an instance,
setting values via properties, and displaying the area.
 */
namespace Rectangle
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("************Rectangle************");
            Rectangle r = new Rectangle(width:-10 , height:-30);
            // display info
            r.DisplayInfo();
            Console.Write("The area of the rectangle is: ");
            Console.WriteLine(r.Rectanglearea);
            Console.ReadKey();
        }
    }
}
