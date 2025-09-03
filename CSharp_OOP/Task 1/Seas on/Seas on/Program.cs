namespace Seas_on
{
    public enum Season
    {
        spring, summer, autumn, winter
    }
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Enter a season:");

            foreach (Season item  in Enum.GetValues(typeof(Season)))
            {
                Console.WriteLine(item);
            }

          if (Enum.TryParse<Season>(Console.ReadLine() , out Season seasontest))
            {

                if (seasontest == Season.spring)
                {
                    Console.WriteLine("Spring: March to May");
                }
                else if (seasontest == Season.winter)
                {
                    Console.WriteLine("Winter: December to February");
                }
                else if (seasontest == Season.summer)
                {
                    Console.WriteLine("Summer: June to August");
                }
                else if (seasontest == Season.autumn)
                {
                    Console.WriteLine("Autumn: September to November");
                }
            }
            else
            {
                Console.WriteLine("Invalid season name!");
            }

        }
    }
}
