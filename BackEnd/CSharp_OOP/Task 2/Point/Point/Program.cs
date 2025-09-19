//Create a struct called "Point" to represent a 2D point with properties "X" and   "Y".
//Write a C# program that takes two points as input from the user and calculates the distance between them.
namespace Point
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //one point
            double OneX= ReadDouble("Enter X for first point: ");
            double OneY = ReadDouble("Enter Y for first point: ");
            Point OnePoint = new Point(OneX, OneY);

            //second point
            double SecondX = ReadDouble("Enter X for second point: ");
            double SecondY = ReadDouble("Enter Y for second point: ");
            Point SecondPoint = new Point(SecondX, SecondY);

            //calculates the distance between them
            double distance = Math.Sqrt(Math.Pow(SecondPoint.X - OnePoint.X, 2) + Math.Pow(SecondPoint.Y - OnePoint.Y, 2));
            Console.WriteLine($"The distance between the two points is: {distance}");
            Console.ReadKey();
        }
        static double ReadDouble(string message)
        {
            double value;
            Console.WriteLine(message);
            while (!double.TryParse(Console.ReadLine() , out value))
            {
                Console.Write("Invalid input! Please enter a number: ");
            }
            return value;
        }
    }
}
