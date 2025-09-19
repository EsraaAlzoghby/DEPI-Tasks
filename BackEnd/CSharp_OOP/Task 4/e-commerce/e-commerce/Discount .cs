using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace e_commerce
{
    internal abstract class Discount
    {
        public string Name { get; set; } // Name of the discount type

        public abstract decimal CalculateDiscount(decimal price, int quantity);
    }
}
