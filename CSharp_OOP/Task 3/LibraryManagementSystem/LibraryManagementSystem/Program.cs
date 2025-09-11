// Design a program for a library management system where:
//•	Book is a base class with properties like Title, Author, and ISBN.
//•	EBook and PrintedBook are derived classes with additional properties like FileSize for EBook and PageCount for PrintedBook.
//Demonstrate how inheritance simplifies the design.
namespace LibraryManagementSystem
{
    internal class Program
    {
        static void Main(string[] args)
        {
            // Create objects
            EBook ebook = new EBook("C# in Depth", "Jon Skeet", "12345", 5.8);
            PrintedBook printedBook = new PrintedBook("Clean Code", "Robert C. Martin", "67890", 464);

            // Display info
            Console.WriteLine("=== EBook Info ===");
            ebook.DisplayInfo();

            Console.WriteLine("\n=== Printed Book Info ===");
            printedBook.DisplayInfo();

        }
    }
}


