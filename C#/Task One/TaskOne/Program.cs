/*
Write a C# program that asks the user to enter a username and a password.
If the username and password are correct, the program should print "Login successful, welcome".
Otherwise, it should display an error message: "Error: Incorrect UserName Or Password".
*/
namespace TaskOne
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("============= Task One Login =============");
            Console.WriteLine("Enter Your Name");
            string TheName = Console.ReadLine();
            Console.WriteLine("Enter Your Password");
            string ThePassword = Console.ReadLine();

            if ((TheName == "admin" && ThePassword == "123")|| 
                (TheName == "esraa" && ThePassword == "987"))
            {
                Console.WriteLine("login successful, welcome ");

            }
            else
            {
                Console.WriteLine("Error: Incorrect UserName Or Password ");
            }
        }
    }
}
