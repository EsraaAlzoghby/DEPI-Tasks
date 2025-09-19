using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace e_commerce
{
    internal class FlatDiscount:Discount
    {
        public int FlatAmount { get; set; }

        public FlatDiscount( int flatamount)
        {
            FlatAmount = flatamount;
            Name = ($"Flat Discount ${FlatAmount}");
        }
        public override decimal CalculateDiscount(decimal price, int quantity)
        {
            return FlatAmount * Math.Min(quantity, 1);
            // Discount applies once per purchase
        }
    }
}
/*
 * System.Math
 * Console.WriteLine(Math.Min(5, 10)); // Output: 5 → الأصغر هو 5
 */