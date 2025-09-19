using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace e_commerce
{
    // RegularUser → :PercentageDiscount of 5%.
    internal class RegularUser:User
    {
        public RegularUser(string Name) : base(Name) { }
        
        public override Discount GetDiscount()
        {
            return new PercentageDiscount(5);
        }
    }
    // Premium user → Flat $100 discount
    internal class PremiumUser : User
    {
        public PremiumUser(string name) : base(name) { }

        public override Discount GetDiscount()
        {
            return new FlatDiscount(100);
        }
    }
    // Guest user → No discount
    internal class GuestUser : User
    {
        public GuestUser(string name) : base(name) { }

        public override Discount GetDiscount()
        {
            return null; // No discount
        }
    }
}
