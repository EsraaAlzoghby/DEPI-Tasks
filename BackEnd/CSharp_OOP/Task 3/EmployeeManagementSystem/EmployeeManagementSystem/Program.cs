//1.Design and implement a Class for the employees in a company:
//Notes:
//•	Employee is identified by an ID, Name, security level, salary, hire date and Gender.
//•	We need to restrict the Gender field to be only M or F [Male or Female] 
//•	Assign the following security privileges to the employee (guest, Developer, secretary and DBA) in a form of Enum.
//•	We want to provide the Employee Class to represent Employee data in a string Form (override ToString ()),
//display employee salary in a currency format. [Use String.Format() Function].

//2.Develop a Class to represent the Hiring Date Data:
//•	Consisting of fields to hold the day, month and Years.

//3.Create an array of Employees with size three a DBA,
//Guest and the third one is security officer who have full permissions. (Employee [] EmpArr;)
//Notes:
//•	Implement All the Necessary Member Functions on the Class (Getters, Setters)
//•	Define all the Necessary Constructors for the Class
//•	Allow NO RUNTIME errors if the user inputs any data
//•	Write down all the necessary Properties (Instead of setters and getters)

//4.Sort the employees based on their hire date then Print the sorted array.
//•	While sorting (how many times Boxing and Unboxing process has occurred)

namespace EmployeeManagementSystem
{
    internal class Program
    {
        static void Main(string[] args)
        {
            // Step 3: Array of Employees
            Employee[] emp = new Employee[4];
            emp[0] = new Employee(1, "Ali", Security.DBA, 15000m, new HiringDate(21, 05, 2020), "male");
            emp[1] = new Employee(2, "amal", Security.Developer, 60000m, new HiringDate(22, 07, 1999), "female");
            emp[2] = new Employee(3, "Ahmed", Security.SecurityOfficer, 20000m, new HiringDate(20, 08, 2024), "male");
            emp[3] = new Employee(4, "esraa", Security.Guest, 80000m, new HiringDate(20, 03, 2025), "female");

            Console.WriteLine("===== Employees Before Sorting =====");
            foreach (var item in emp)
            Console.WriteLine(item);

            // Step 4: Sort employees by hire date
            //Lambda Expression
            Array.Sort(emp, (e1, e2) => e1.HireDate.CompareTo(e2.HireDate));

            Console.WriteLine("\n===== Employees After Sorting by Hire Date =====");
            foreach (var item in emp)
            Console.WriteLine(item);

        }
    }
}
