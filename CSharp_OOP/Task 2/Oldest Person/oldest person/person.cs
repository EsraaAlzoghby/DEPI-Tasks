using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace oldest_person
{
    internal struct person
    {
       public string ? Name { get; set; }
       public int Age { get; set; }

        public person(string? Name, int Age)
        {
            this.Name = Name;
            this.Age = Age;
        }

    }
}
