/*
Write a C# Console Application that manages student grades using a two-dimensional array.
The program should:
Allow the user to enter the number of students and subjects.
Store each student’s name and grades for all subjects.

Provide a menu with the following options:
Print the top 3 students based on their average grade.
Display all student names with their grades.
Search for a student by name and print their grades.
Exit the program.
*/
namespace Task_4
{
    //Create a C# Console Application using a two-dimensional array.
    internal class Program
    {
        static void Main()
        {
            // 1. Input the number of students and subjects
            Console.Write("Enter number of students: ");
            int studentCount = int.Parse(Console.ReadLine());

            Console.Write("Enter number of subjects: ");
            int subjectCount = int.Parse(Console.ReadLine());

            // 2. Create arrays for student names and their grades
            string[] studentNames = new string[studentCount];
            int[,] grades = new int[studentCount, subjectCount];

            // 3. Input student names and their grades
            for (int i = 0; i < studentCount; i++)
            {
                Console.Write($"\nEnter name of student {i + 1}: ");
                studentNames[i] = Console.ReadLine();

                for (int j = 0; j < subjectCount; j++)
                {
                    Console.Write($"Enter grade for subject {j + 1}: ");
                    grades[i, j] = int.Parse(Console.ReadLine());
                }
            }

            // 4. Main menu loop
            bool exit = false;
            while (!exit)
            {
                Console.WriteLine("\n--- Menu ---");
                Console.WriteLine("1. Print top 3 students based on average grade");
                Console.WriteLine("2. Print all student data");
                Console.WriteLine("3. Search for a student by name");
                Console.WriteLine("4. Exit");
                Console.Write("Choose an option: ");
                string option = Console.ReadLine();

                switch (option)
                {
                    case "1":
                        PrintTopThreeStudents(studentNames, grades);
                        break;

                    case "2":
                        PrintAllStudents(studentNames, grades);
                        break;

                    case "3":
                        SearchStudent(studentNames, grades);
                        break;

                    case "4":
                        exit = true;
                        break;

                    default:
                        Console.WriteLine("Invalid option, please try again.");
                        break;
                }
            }
        }

        // Calculates the average for a single student's grades
        static double CalculateAverage(int[] studentGrades)
        {
            int total = 0;
            foreach (int grade in studentGrades)
                total += grade;
            return (double)total / studentGrades.Length;
        }

        // Prints the top 3 students based on average grades
        static void PrintTopThreeStudents(string[] names, int[,] grades)
        {
            int studentCount = names.Length;
            int subjectCount = grades.GetLength(1);

            // Create an array to store averages
            double[] averages = new double[studentCount];
            for (int i = 0; i < studentCount; i++)
            {
                int sum = 0;
                for (int j = 0; j < subjectCount; j++)
                    sum += grades[i, j];

                averages[i] = (double)sum / subjectCount;
            }

            // Sort students by average (descending)
            Array.Sort(averages, names); // Sort names based on averages (ascending)
            Array.Reverse(averages);     // Reverse to descending
            Array.Reverse(names);

            Console.WriteLine("\nTop 3 students:");
            for (int i = 0; i < Math.Min(3, studentCount); i++)
            {
                Console.WriteLine($"{i + 1}. {names[i]} - Average: {averages[i]:F2}");
            }
        }

        // Prints all student names and their grades
        static void PrintAllStudents(string[] names, int[,] grades)
        {
            for (int i = 0; i < names.Length; i++)
            {
                Console.Write($"{names[i]}: ");
                for (int j = 0; j < grades.GetLength(1); j++)
                {
                    Console.Write(grades[i, j] + " ");
                }
                Console.WriteLine();
            }
        }

        // Searches for a student by name and prints their grades
        static void SearchStudent(string[] names, int[,] grades)
        {
            Console.Write("Enter student name to search: ");
            string searchName = Console.ReadLine();

            bool found = false;
            for (int i = 0; i < names.Length; i++)
            {
                if (names[i].Equals(searchName, StringComparison.OrdinalIgnoreCase))
                {
                    Console.WriteLine($"Grades for {names[i]}:");
                    for (int j = 0; j < grades.GetLength(1); j++)
                    {
                        Console.WriteLine($"Subject {j + 1}: {grades[i, j]}");
                    }
                    found = true;
                    break;
                }
            }

            if (!found)
            {
                Console.WriteLine("Student not found.");
            }
        }
    }
}
