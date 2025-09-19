using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Rectangle
{
    internal class Rectangle
    {
       private double width;
       private double height;

        public Rectangle(double width, double height) 
        {
            RectangleWidth = width;
            RectangleHeight = height;
        }

        public double RectangleWidth
        {
            get
            {
                return width;
            }

            set
            {
                if (value >= 0)
                {
                    width = value;
                }
                else
                {
                    Console.WriteLine("Width cannot be negative!");
                }
            }
        }

        public double RectangleHeight
        {
            get
            {
                return height;
            }

            set
            {
                if (value >= 0)
                {
                    height = value;
                }
                else
                {
                    Console.WriteLine("Height cannot be negative!");
                }
            }
        }
        // Read-only property for Area
        public double Rectanglearea
        {
            get
            {
                return height * width;
            }     
        }
        // Method to display info
        public void DisplayInfo()
        {
            Console.WriteLine($"Width: {RectangleHeight}, Height: {RectangleWidth}");

        }

    }
}
