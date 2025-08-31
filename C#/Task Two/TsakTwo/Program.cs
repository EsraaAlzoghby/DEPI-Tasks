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
