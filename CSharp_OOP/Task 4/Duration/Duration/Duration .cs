namespace Duration
{
    internal class Duration
    {
        public int Hours { get; set; }
        public int Minutes { get; set; }
        public int Seconds { get; set; }

        // ---------------- Constructors ----------------
        public Duration(int hours, int minutes, int seconds)
        {
            int totalSeconds = hours*3600 + minutes*60 + seconds;
            if(totalSeconds<0) totalSeconds = 0; // Prevent negative duration
            Hours = totalSeconds / 3600;
            totalSeconds %= 3600;
            Minutes = totalSeconds / 60;
            Seconds = totalSeconds % 60;
        }
        public Duration(int totalSeconds)
        {
            if (totalSeconds < 0) totalSeconds = 0; // Prevent negative duration
            Hours = totalSeconds / 3600;
            totalSeconds %= 3600;
            Minutes = totalSeconds / 60;
            Seconds = totalSeconds % 60;
        }

        // ---------------- Override System.Object ----------------
        public override string ToString()
        {
            if (Hours > 0)
                return $"Hours: {Hours}, Minutes: {Minutes}, Seconds: {Seconds}";
            else if (Minutes > 0)
                return $"Minutes: {Minutes}, Seconds: {Seconds}";
            else
                return $"Seconds: {Seconds}";
        }
        public override bool Equals(object? obj)
        {
            Duration other = obj as Duration;
            if (other == null) return false;
            return (Hours == other.Hours && Minutes == other.Minutes && Seconds == other.Seconds);
        }
        public override int GetHashCode()
        {
            return HashCode.Combine(Hours, Minutes, Seconds);
        }

        //public override int GetHashCode()
        //{
        //    return Hours ^ Minutes ^ Seconds;
        //}
        public int ToSeconds()
        {
            return Hours * 3600 + Minutes * 60 + Seconds;
        }

        // ---------------- Operator Overloading ----------------
        public static Duration operator +(Duration D1, Duration D2)
        {
            return new Duration(D1.ToSeconds() + D2.ToSeconds());
        }
        public static Duration operator +(Duration D1, int seconds)
        {
            return new Duration(D1.ToSeconds() + seconds);
        }
        public static Duration operator +(int seconds, Duration D1)
        {
            return new Duration(seconds + D1.ToSeconds());
        }
        public static Duration operator ++(Duration D1)
        {
            return new Duration(D1.ToSeconds() + 60);
        }
        public static Duration operator --(Duration D1)
        {
            int resultSeconds = D1.ToSeconds() - 60;
            if (resultSeconds < 0) resultSeconds = 0; // Prevent negative
            return new Duration(resultSeconds);
        }
        public static Duration operator -(Duration D1, Duration D2)
        {
            int resultSeconds = D1.ToSeconds() - D2.ToSeconds();
            if (resultSeconds < 0) resultSeconds = 0; // Prevent negative result
            return new Duration(resultSeconds);
        }
        // (> , < , >= , <=)
        public static bool operator >(Duration D1, Duration D2)
        {
            return D1.ToSeconds() > D2.ToSeconds();
        }
        public static bool operator <(Duration D1, Duration D2)
        {
            return D1.ToSeconds() < D2.ToSeconds();
        }
        public static bool operator >=(Duration D1, Duration D2)
        {
            return D1.ToSeconds() >= D2.ToSeconds();
        }
        public static bool operator <=(Duration D1, Duration D2)
        {
            return D1.ToSeconds() <= D2.ToSeconds();
        }
        public static bool operator true(Duration D)
        {
            return D.ToSeconds() > 0;
        }
        public static bool operator false(Duration D)
        {
            return D.ToSeconds() <= 0;
        }
        // Casting Duration → DateTime
        public static explicit operator DateTime(Duration D)
        {
            DateTime today = DateTime.Today;
            return today.AddHours(D.Hours)
            .AddMinutes(D.Minutes)
            .AddSeconds(D.Seconds);
        }
        
    }
}

/* Note
 * Duration d1 = new Duration(1, 0, 0);
 * Duration d2 = new Duration(0, 30, 0);
 * // Error ❌
 * Duration result = d1 + d2;
 */