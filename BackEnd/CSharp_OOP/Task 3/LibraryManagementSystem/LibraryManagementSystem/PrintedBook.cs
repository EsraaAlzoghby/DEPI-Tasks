using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibraryManagementSystem
{
    internal class PrintedBook:Book
    {    // Derived class for EBooks
        public int PageCount { get; set; }

        public PrintedBook(string title, string author, string isbn, int pagecount) : base(title, author, isbn)
        {
            PageCount = pagecount;
        }
        public override void DisplayInfo()
        {
            base.DisplayInfo();
            Console.WriteLine($"Page Count: {PageCount}");
        }
    }
}
