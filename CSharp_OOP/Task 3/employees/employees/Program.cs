//Define a class Employees with fields: ID, Name, Gender, Salary, HireDate, and SecurityLevel.
//Use an Enum Security with values: Guest = 1, Developer = 2, Secretary = 3, DBA = 4.
//Restrict Gender to accept only M/F or male/female.
//Override ToString() to display employee details (Salary in currency format, HireDate in short date format).
//In Main(), ask the user for the number of employees, read their details with validation, store them in a List, and print all employees.
namespace employees
{
    internal class Program
    {
        static void Main(string[] args)
        {
            List<Employees> employees = new List<Employees>();
            Console.Write("Enter number of employees: ");
            int count = int.Parse(Console.ReadLine());
            for (int i = 0; i < count; i++)
            {
                Console.WriteLine($"\nEnter details for Employee #{i + 1}:");

                Console.Write("ID: ");
                int id;
                while (!int.TryParse(Console.ReadLine(), out id))
                {
                    Console.Write(" Invalid input! Enter a valid number for ID: ");
                }
                Console.Write("Name: ");
                string? name = Console.ReadLine();

                Console.Write("Gender (male(m)/female(f)): ");
                string? gender = Console.ReadLine();

                Console.Write("Salary: ");
                decimal salary;
                while (!decimal.TryParse(Console.ReadLine(), out salary))
                {
                    Console.Write(" Invalid input! Enter a valid number for salary: ");
                }

                DateTime hireDate;
                Console.Write("Hire Date (yyyy-mm-dd): ");

                while (!DateTime.TryParse(Console.ReadLine(), out hireDate))
                {
                    Console.WriteLine(" Invalid date format! Please enter again (yyyy-mm-dd): ");
                }

                Console.Write("Enter Security Level Number (1 = Guest, 2 = Developer, 3 = Secretary, 4 = DBA):  ");
                Security Securitylevel = (Security)int.Parse(Console.ReadLine());

                employees.Add(new Employees(id, name, Securitylevel, salary, hireDate, gender));
            }

            Console.WriteLine("\n========== Employees List ==========");
            foreach (Employees item in employees)
            {
                Console.WriteLine(item);

            }
        }
    }
}
