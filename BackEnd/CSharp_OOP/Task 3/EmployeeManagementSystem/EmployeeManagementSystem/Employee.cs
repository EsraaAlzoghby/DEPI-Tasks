namespace EmployeeManagementSystem
{
    // Enum for Security Levels
    internal enum Security
    {
        Guest = 1,
        Developer,
        Secretary,
        DBA,
        SecurityOfficer // full permissions
    }
    internal class Employee
    {
        public int Id;
        public string Name;
        public Security SecurityLevel;
        public decimal Salary;
        public HiringDate HireDate;
        public string Gender;

        public string GENDER 
        {
            get 
            {
                return Gender;
            }
            set 
            {
                if (value == "male" || value == "female")
                {
                    Gender = value;
                }
                else
                {
                    Console.WriteLine("Gender must be male or female only");
                }
            } 
        }

        public Employee(int id,  string name , Security securitylevel, decimal salary, HiringDate hiredate, string gender)
        {
            Id = id;
            Name = name;
            SecurityLevel = securitylevel;
            Salary = salary;
            HireDate = hiredate;
            GENDER = gender;
        }

        public override string ToString()
        {
            return string.Format(
             "ID: {0}, Name: {1}, Gender: {2}, Security: {3}, Salary: {4:C}, HireDate: {5}",
             Id, Name, GENDER, SecurityLevel, Salary, HireDate);
        }
    }


}