/*
 * You are tasked with designing a system for an e-commerce platform that calculates discounts for different types of users and products.
 * This system should utilize abstraction and include the following parts:
    * Part 1: Abstract Discount Class
    - Create an abstract class Discount with:
        o An abstract method CalculateDiscount(decimal price, int quantity) 
    that returns the discount amount based on the original price and quantity.
        o A Name property to store the type of discount.

    * Part 2: Specific Discounts
    - Implement the following concrete discount classes:
        o PercentageDiscount:
            ▪ Accepts a percentage (e.g., 10%).
            ▪ Formula: Discount Amount=Price×Quantity×(Percentage/100)
        o FlatDiscount:
            ▪ Accepts a fixed amount to be deducted (e.g., $50).
            ▪ Formula: Discount Amount=Flat Amount×min(Quantity,1)
        o BuyOneGetOneDiscount:
            ▪ Applies a 50% discount if the quantity is greater than 1.
            ▪ Formula: Discount Amount=(Price/2)×(Quantity÷2)

    * Part 3: Discount Applicability
    - Create an abstract class User with:
        o A Name property to store the user name.
        o An abstract method GetDiscount() that returns a Discount object.
     - Implement the following specific user types:
        o RegularUser: Applies a PercentageDiscount of 5%.
        o PremiumUser: Applies a FlatDiscount of $100.
        o GuestUser: No discount is applied

   * Part 4: Integration
    - Write a program that:
        o Ask  the user to input their type (Regular, Premium, or Guest).
        o Allows the user to input product details (price and quantity).
        o Calculates and displays the total discount and final price after applying the appropriate discount.
 */
namespace e_commerce
{
    internal class Program
    {
        static void Main(string[] args)
        {
            // Ask user type
            Console.WriteLine("Enter user type (Regular / Premium / Guest):");
            string userType = Console.ReadLine().Trim();
            
            User user;
            // Create user object based on input
            switch (userType.ToLower())
            {
                case "regular":
                    user = new RegularUser("Regular User");
                    break;
                case "premium":
                    user = new PremiumUser("Premium User");
                    break;
                case "guest":
                    user = new GuestUser("Guest User");
                    break;
                default:
                    Console.WriteLine("Invalid user type. Defaulting to Guest.");
                    user = new GuestUser("Guest User");
                    break;
            }
            // Input product details
            Console.WriteLine("Enter product price:");
            decimal price = decimal.Parse(Console.ReadLine());

            Console.WriteLine("Enter quantity:");
            int quantity = int.Parse(Console.ReadLine());

            // Get applicable discount
            Discount discount = user.GetDiscount();

            decimal discountAmount = 0;

            if (discount != null)
            {
                discountAmount = discount.CalculateDiscount(price, quantity);
                Console.WriteLine($"Discount Type: {discount.Name}");
                Console.WriteLine($"Discount Amount: ${discountAmount}");
            }
            else
            {
                Console.WriteLine("No discount applied.");
            }

            // Calculate final price
            decimal finalPrice = price * quantity - discountAmount;
            Console.WriteLine($"Final Price: ${finalPrice}");
        }
    }
}

/*
string text = "   Hello World!   ";
string trimmedText = text.Trim();
Console.WriteLine(trimmedText);//Hello World!
 */