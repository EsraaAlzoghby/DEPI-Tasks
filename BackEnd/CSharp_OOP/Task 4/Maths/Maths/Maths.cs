using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Maths
{
    internal class Maths
    {
        // Instance method (NOT static)
        // This method adds two numbers x and y.
        // Default values are x = 3, y = 3 if no arguments are passed.
        public int Add(int x=3 , int y=3)
        {
            return x + y;
        }

        // Static method
        public static int Subtract(int x = 3, int y = 3)
        {
            return x - y;
        }

        public static int Multiply(int x = 3, int y = 3)
        {
            return x * y;
        }

        public static double Divide(int x = 3, int y = 3)
        {
            return x / y;
        }
    }
}
