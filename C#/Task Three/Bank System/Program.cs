namespace Bank_System
{
    class Customer
    {
        public string Name { get; set; }
        public int BalanceCode { get; set; }
        public float Balance { get; set; }
    }

    internal class Program
    {
        static void Main(string[] args)
        {
            Console.ForegroundColor = ConsoleColor.Yellow;
            Console.WriteLine("Welcome to the Banking System!");
            Console.WriteLine("Please choose your bank: Cairo, Alex, or Fesal");
            Console.ResetColor();

            string bankName = Console.ReadLine();
            List<Customer> customers = new List<Customer>();
            float totalDrawn = 0f;
            float totalDeposited = 0f;
            float totalBalance = 0f;

            if (bankName.Equals("Cairo", StringComparison.OrdinalIgnoreCase)
                || bankName.Equals("Alex", StringComparison.OrdinalIgnoreCase)
                || bankName.Equals("Fesal", StringComparison.OrdinalIgnoreCase))
            {
                Console.ForegroundColor = ConsoleColor.White;
                Console.WriteLine("Enter the number of customers:");
                Console.ResetColor();

                int numberCustomers;
                bool isValid = int.TryParse(Console.ReadLine(), out numberCustomers);

                if (isValid && numberCustomers > 0)
                {
                    for (int i = 1; i <= numberCustomers; i++)
                    {
                        Console.ForegroundColor = ConsoleColor.Cyan;
                        Console.WriteLine($"\n--- Enter details for Customer #{i} ---");
                        Console.ResetColor();

                        Console.Write("Enter customer name: ");
                        string customerName = Console.ReadLine();
                        while (string.IsNullOrWhiteSpace(customerName))
                        {
                            Console.ForegroundColor = ConsoleColor.Red;
                            Console.WriteLine("Invalid name. Please enter a valid name.");
                            Console.ResetColor();
                            Console.Write("Enter customer name: ");
                            customerName = Console.ReadLine();
                        }

                        Console.Write("Enter account code: ");
                        int accountCode;
                        while (!int.TryParse(Console.ReadLine(), out accountCode))
                        {
                            Console.ForegroundColor = ConsoleColor.Red;
                            Console.Write("Invalid code. Please enter a numeric value: ");
                            Console.ResetColor();
                        }

                        Console.Write("Enter initial balance: ");
                        float initialBalance;
                        while (!float.TryParse(Console.ReadLine(), out initialBalance) || initialBalance < 0)
                        {
                            Console.ForegroundColor = ConsoleColor.Red;
                            Console.Write("Invalid amount. Please enter a positive number: ");
                            Console.ResetColor();
                        }

                        Console.Write("Select an operation (draw / deposit): ");
                        string selectOperation = Console.ReadLine();

                        if (selectOperation.Equals("draw", StringComparison.OrdinalIgnoreCase))
                        {
                            Console.Write("Enter amount to withdraw: ");
                            float amountToWithdraw;
                            if (float.TryParse(Console.ReadLine(), out amountToWithdraw) && amountToWithdraw > 0)
                            {
                                if (amountToWithdraw <= initialBalance)
                                {
                                    Console.ForegroundColor = ConsoleColor.Green;
                                    Console.WriteLine(" Withdrawal successful.");
                                    Console.ResetColor();

                                    initialBalance -= amountToWithdraw;
                                    totalDrawn += amountToWithdraw;
                                }
                                else
                                {
                                    Console.ForegroundColor = ConsoleColor.Red;
                                    Console.WriteLine(" Insufficient balance! Withdrawal canceled.");
                                    Console.ResetColor();
                                }
                            }
                            else
                            {
                                Console.ForegroundColor = ConsoleColor.Red;
                                Console.WriteLine("Invalid amount. Please enter a positive number.");
                                Console.ResetColor();
                            }
                        }
                        else if (selectOperation.Equals("deposit", StringComparison.OrdinalIgnoreCase))
                        {
                            Console.Write("Enter amount to deposit: ");
                            float amountToDeposit;
                            if (float.TryParse(Console.ReadLine(), out amountToDeposit) && amountToDeposit > 0)
                            {
                                Console.ForegroundColor = ConsoleColor.Green;
                                Console.WriteLine(" Deposit successful.");
                                Console.ResetColor();

                                initialBalance += amountToDeposit;
                                totalDeposited += amountToDeposit;
                            }
                            else
                            {
                                Console.ForegroundColor = ConsoleColor.Red;
                                Console.WriteLine("Invalid amount. Please enter a positive number.");
                                Console.ResetColor();
                            }
                        }
                        else
                        {
                            Console.ForegroundColor = ConsoleColor.Red;
                            Console.WriteLine("Invalid operation! This operation will be skipped.");
                            Console.ResetColor();
                        }

                        Customer customer = new Customer
                        {
                            Name = customerName,
                            BalanceCode = accountCode,
                            Balance = initialBalance
                        };
                        customers.Add(customer);
                    }

                    // End of Day Report
                    Console.ForegroundColor = ConsoleColor.Blue;
                    Console.WriteLine("\n--- End of Day Report ---");
                    Console.ResetColor();

                    foreach (var c in customers)
                    {
                        Console.WriteLine($"Name: {c.Name} | Balance Code: {c.BalanceCode} | Final Balance: ${c.Balance}");
                        totalBalance += c.Balance;
                    }

                    Console.ForegroundColor = ConsoleColor.Yellow;
                    Console.WriteLine("\n--- Totals ---");
                    Console.WriteLine($"Total Deposited: ${totalDeposited}");
                    Console.WriteLine($"Total Withdrawn: ${totalDrawn}");
                    Console.WriteLine($"Total Balance of All Customers: ${totalBalance}");
                    Console.ResetColor();
                }
                else
                {
                    Console.ForegroundColor = ConsoleColor.Red;
                    Console.WriteLine("Invalid input. Please enter a valid number.");
                    Console.ResetColor();
                }
            }
            else
            {
                Console.ForegroundColor = ConsoleColor.Red;
                Console.WriteLine(" Sorry, we currently do not support this bank.");
                Console.ResetColor();
            }

            Console.ForegroundColor = ConsoleColor.Gray;
            Console.WriteLine("\nThank you for using our banking system. Press any key to exit...");
            Console.ResetColor();
            Console.ReadKey();
        }
    }
}
