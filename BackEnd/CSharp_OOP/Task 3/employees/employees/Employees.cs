using Microsoft.VisualBasic.FileIO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace employees
{
    // Enum for Security Level
    internal enum Security
    {
        guest = 1, Developer = 2, secretary = 3, DBA = 4
    }
    internal class Employees
    {
        public int Id;
        public string Name;
        public Security Securitylevel;
        public decimal Salary;
        public DateTime HireDate;
        public string gender;

        // Constructor
        public Employees(int Id, string name, Security securitylevel, decimal salary, DateTime hireDate, string gender)
        {
            this.Id = Id;
            Name = name;
            Securitylevel = securitylevel;
            Salary = salary;
            HireDate = hireDate;
            Gender = gender; // uses the validation
        }

        public string Gender
        {
            get
            {
                return gender;
            }

            set
            {
                if (value == "male" || value == "female" || value == "f" || value == "m")
                {
                    gender = value;
                }
                else
                {
                    Console.WriteLine("Gender must be 'M' or 'F' only.");
                }
            }
        }

        public override string ToString()
        {
            return String.Format(
                "ID: {0}, Name: {1}, Gender: {2}, Security Level: {3}, Salary: {4:C}, Hire Date: {5:d}",
                Id, Name, Gender, Securitylevel, Salary, HireDate);
        }

    }
}
