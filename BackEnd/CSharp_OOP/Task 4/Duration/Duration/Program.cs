/*Task
 * 1.Define Class Duration To include Three Attributes Hours, Minutes and Seconds.
 * 2.Override All System.Object Members (ToString, Equals,GetHasCode).
 * 3.Define All Required Constructors to Produce this output:
 * Duration D1 =new  Duration (1,10,15);
    - D1.ToString(); 
    - Output: Hours: 1, Minutes :10, Seconds :15
 * Duration D1 =new Duration (3600);
    - D1.ToString(); 
    - Output: Hours: 1, Minutes :0, Seconds :0
 * Duration D2 =new Duration (7800);
    - D2.ToString(); 
    - Output: Hours: 2, Minutes :10, Seconds :0
 * Duration D3 =new Duration (666);
    - D3.ToString(); 
    - Output: Minutes :11, Seconds :6
 * 4.Implement All required Operators overloading to enable this Code:
    ● D3=D1+D2
    ● D3=D1 + 7800
    ● D3=666+D3
    ● D3= ++D1 (Increase One Minute)
    ● D3 = --D2 (Decrease One Minute)
    ● D1= D1 -D2
    ● If (D1>D2)
    ● If (D1<=D2)
    ● If (D1)
    ● DateTime Obj = (DateTime) D1
 */
//=================

namespace Duration
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Duration D1 = new Duration(1, 10, 15);
            Console.WriteLine($"D1 initial: {D1}"); // Initial value of D1
            Console.WriteLine("-----------------");
            Duration D2 = new Duration(7800);
            Console.WriteLine($"D2 initial (7800 sec): {D2}"); // Initial value of D2 from total seconds
            Console.WriteLine("-----------------");

            Duration D3 = new Duration(666);
            Console.WriteLine($"D3 initial (666 sec): {D3}"); // Initial value of D3 from total seconds

            // ---------------- Addition ----------------
            Console.WriteLine("---------------- Operators overloading ----------------");
            D3 = D1 + D2;
            Console.WriteLine($"D3 = D1 + D2: {D3}"); 

            // Addition with seconds
            D3 = D1 + 7800;
            Console.WriteLine($"D3 = D1 + 7800 seconds: {D3}"); 

            // Addition with seconds on the left
            D3 = 666 + D3;
            Console.WriteLine($"D3 = 666 + D3: {D3}"); 

            // ---------------- Increment ----------------
            D3 = ++D1;
            Console.WriteLine($"D3 = ++D1 (increase 1 minute): {D3}"); 

            // ---------------- Decrement ----------------
            D3 = --D2;
            Console.WriteLine($"D3 = --D2 (decrease 1 minute): {D3}"); 

            // ---------------- Subtraction ----------------
            D1 = D1 - D2;
            Console.WriteLine($"D1 = D1 - D2: {D1}"); 

            // ---------------- Comparison ----------------
            if (D1 > D2) Console.WriteLine("D1 > D2"); 
            if (D1 <= D2) Console.WriteLine("D1 <= D2"); 

            // ---------------- Check if Duration has value ----------------
            if (D1) Console.WriteLine("D1 has value!"); 

            // ---------------- Cast to DateTime ----------------
            DateTime obj = (DateTime)D1;
            Console.WriteLine($"D1 as DateTime (today + duration): {obj}");
        }
    }
}

/***Note***
 * DateTime: Represents a specific date and time (e.g., 16/09/2025 at 10:30 AM).
 * TimeSpan: Represents a time interval or duration (e.g., 2 hours and 30 minutes, 5 days, 30 seconds).
 */
/*
 public TimeSpan ToTimeSpan()
{
    return new TimeSpan(Hours, Minutes, Seconds);
}
 */