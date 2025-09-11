namespace EmployeeManagementSystem
{
    // Class to represent Hiring Date
    internal class HiringDate: IComparable<HiringDate>
    {
        public int Day;
        public int Month;
        public int Year;

        public HiringDate(int day , int month , int year)
        {
            Day = day;
            Month = month;
            Year = year;
        }

        public override string ToString()
        {
            return $"{Year}-{Month:D2}-{Day:D2}";
        }
        // For sorting by date
        public int CompareTo(HiringDate Other)
        {
            if (Other == null) return 1 ;
            DateTime ThisDate = new DateTime(Year, Month, Day);
            DateTime OtherDate = new DateTime(Other.Year, Other.Month, Other.Day);
            return ThisDate.CompareTo(OtherDate);
        }
    }
}

//:D2
//الرقم دايمًا يتعرض في خانتين,لو أقل من خانتين يضيف صفر من الشمال
//=======================
/*CompareTo()
 * Negative value ( < 0 ) → if thisDate is earlier than otherDate.
 * Zero ( = 0 ) → if both dates are equal.
 * Positive value ( > 0 ) → if thisDate is later than otherDate.
 */
