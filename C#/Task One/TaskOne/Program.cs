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
