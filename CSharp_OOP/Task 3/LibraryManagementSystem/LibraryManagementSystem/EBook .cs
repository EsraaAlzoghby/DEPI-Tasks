using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibraryManagementSystem
{    // Derived class for EBooks

    internal class EBook:Book
    {
        public double FileSize { get; set; }
        public EBook(string title, string author, string isbn , double filesize):base(title , author , isbn)
        {
             FileSize = filesize;
        }
        public override void DisplayInfo()
        {
            base.DisplayInfo();
            Console.WriteLine($"File Size: {FileSize} MB");
        }
    }
}
