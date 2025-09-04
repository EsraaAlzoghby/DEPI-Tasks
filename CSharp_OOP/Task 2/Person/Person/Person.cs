using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Person
{
    internal struct Person
    {
        public string? Name { get; set; }
        public int Age { get; set; }

        public Person( string Name, int Age)
        {
            this.Name = Name;
            this.Age = Age;
        }

        public override string ToString()
        {

            return ($"name:{Name} , age:{Age}");
        }

    }
}
