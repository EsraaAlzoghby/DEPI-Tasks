//Create a struct called "Person" with properties "Name" and "Age".
//Write a C# program that takes details of 3 persons 
//as input from the user and displays the name and age of the oldest person.
namespace oldest_person
{
    internal class Program
    {
        static void Main(string[] args)
        {
            person[] people = new person[3];
            for (int i = 0; i < people.Length; i++)
            {
                Console.WriteLine($"Enter name of person {i + 1}:");
                string? name = Console.ReadLine();

                Console.WriteLine($"Enter age of person {i + 1}:");
                int age;
                while (!int.TryParse(Console.ReadLine() , out age) || age < 0)
                {
                    Console.WriteLine("Invalid input! Please enter a valid positive age:");
                }
                people[i] = new person(name, age);
            }

            person oldest =  people[0];
            if (people[1].Age> people[0].Age)
            {
                oldest = people[1];
            }
             if (people[2].Age > people[0].Age)
            {
                oldest = people[2];
            }
            Console.WriteLine($"The oldest person is {oldest.Name}, Age: {oldest.Age}");

        }
    }
}
