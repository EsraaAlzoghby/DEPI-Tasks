/*
Write a C# Console Application that registers a user with a username and password.
Then, ask the user to log in using the same credentials. 
If the login information is correct, display a welcome message; otherwise, display a failure message.
*/
namespace TsakTwo
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //Registration 
            Console.WriteLine("====== User Registration ======");
            Console.Write("Enter a username: ");
            string? username = Console.ReadLine();
            Console.Write("Enter a password: ");
            string? password = Console.ReadLine();
            Console.WriteLine("\nRegistration completed successfully!");
            Console.WriteLine("Press any key to continue to login...");
            Console.ReadKey();
            //clear
            Console.Clear();
            //Login
            Console.WriteLine("====== User Login ======");
            Console.Write("Enter your username: ");
            string? loginUsername = Console.ReadLine();
            Console.Write("Enter your password: ");
            string? loginPassword = Console.ReadLine();

            if(username == loginUsername && password == loginPassword)
            {
                Console.WriteLine($"Login successful! Welcome,{loginUsername}");
            }
            else
            {
                Console.WriteLine("Login failed. Invalid username or password.");
            }
            Console.WriteLine("Press any key to exit...");
            Console.ReadKey();
        }
    }
}
