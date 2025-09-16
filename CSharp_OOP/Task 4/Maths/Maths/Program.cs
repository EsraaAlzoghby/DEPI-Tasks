/*Task 
 * Define Class Maths that has four methods: Add, Subtract, Multiply, and Divide,each of them takes two parameters.
 * Call each method in Main ().
 * Modify the program so that you do not have to create an instance of class to call the four methods.
 */
namespace Maths
{
    internal class Program
    {
        static void Main(string[] args) 
        {
            // Create an object (instance) of the Maths class
            // This is only needed if the methods are NOT static
            Maths add = new Maths();
            
            // Call the Add method using the object
            Console.WriteLine("Addition: " + add.Add(10, 5));

            // Call the methods directly using the class (because it is static)
            Console.WriteLine("Subtraction: " + Maths.Subtract(10, 5));
            Console.WriteLine("Multiplication: " + Maths.Multiply());
            Console.WriteLine("Division: " + Maths.Divide(10, 5));
        }
    }
}
