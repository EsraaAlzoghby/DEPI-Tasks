//Define a struct "Person" with properties "Name" and "Age".
//Create an array of three "Person" objects and populate it with data. 
//Then, write a C# program to display the details of all the persons in the array.
namespace Person
{
    internal class Program
    {
        static void Main(string[] args)
        {

            Console.WriteLine("************Person************");
            Person[] persontest= new Person[3];
            persontest[0]= new Person(Name:"nour" , Age:23);
            persontest[1] = new Person(Name: "ali", Age: 30);
            persontest[2] = new Person(Name: "mai", Age: 15);

            foreach (Person item in persontest)
            {
                Console.WriteLine(item);

            }
        }
    }
}
