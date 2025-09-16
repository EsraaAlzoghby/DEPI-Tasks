using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace e_commerce
{
    internal class PercentageDiscount:Discount
    {
        decimal Percentage {  get; set; }
        public PercentageDiscount(decimal percentage)
        {
            Percentage = percentage;
            Name = ($"{Percentage}% Percentage Discount");
        }
        public override decimal CalculateDiscount(decimal price, int quantity)
        {
            return price * quantity * (Percentage / 100);
        }
    }
}
