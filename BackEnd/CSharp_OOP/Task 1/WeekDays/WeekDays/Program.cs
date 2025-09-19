 //Create an Enum called "WeekDays" with the days of the week (Monday to Sunday) as its members. 
 //Then, write a C# program that prints out all the days of the week using this Enum.
namespace WeekDays
{
    public enum WeekDays
    {

        Monday,
        Tuesday,
        Wednesday,
        Thursday,
        Friday,
        Saturday,
        Sunday

    }
   //Console.WriteLine(typeof(WeekDays));
   // typeof(WeekDays): returns the type information of the Enum (WeekDays) itself
   // Enum.GetValues(typeof(WeekDays)): returns all values inside the Enum as an array


    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Days of the Week:");
            foreach (WeekDays item in Enum.GetValues(typeof(WeekDays)))
            {
                Console.WriteLine(item);
            }
        }
    }
}
