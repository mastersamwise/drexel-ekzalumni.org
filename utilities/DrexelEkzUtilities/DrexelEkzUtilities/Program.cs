// See https://aka.ms/new-console-template for more information
using System;

namespace DrexelEkzUtilities
{
    public class Program
    {


        static void Main(string[] args)
        {
            string file1 = @"..\\..\\..\\..\\20241116_LXA_EKZ_MASTER_BROTHERS_LIST_0.xlsx";
            string file2 = @"..\\..\\..\\..\\test.xlsx";
            string file3 = @"C:\Users\Nik\Dropbox\LXA\drexel-ekzalumni_site\20241116_LXA_EKZ_MASTER_BROTHERS_LIST_0.xlsx";
            string file4 = @"C:\Users\Nik\Dropbox\LXA\drexel-ekzalumni_site\test.xlsx";

            string EXCEL_FILE = file3;

            FileInfo directory = new FileInfo(EXCEL_FILE);

            Console.WriteLine("Hello World!\n");

            if (directory.IsReadOnly)
            {
                Console.WriteLine("File is readonly, changing to not be readonly \n\n");
                directory.IsReadOnly = false;
                Console.WriteLine("Is readonly: " + directory.IsReadOnly + " \n\n");
            }

            Console.WriteLine("\n\n" + directory.FullName + "\n\n");

            ExcelReader reader = new ExcelReader();
            //reader.CheckColumnsWithSylvan(EXCEL_FILE);
            //reader.ReadFileWithSylvan(EXCEL_FILE);
            reader.ReadFileWithInterop(EXCEL_FILE);

        }
    }
}
