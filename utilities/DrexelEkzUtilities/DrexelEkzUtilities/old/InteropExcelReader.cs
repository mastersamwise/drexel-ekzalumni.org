using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Office.Interop.Excel;
using Excel = Microsoft.Office.Interop.Excel;

namespace DrexelEkzUtilities
{
    public class InteropExcelReader
    {
        /// <summary>
        /// Default Constructor
        /// </summary>
        public InteropExcelReader()
        {
            // intentionally left blank
        }

        /// <summary>
        /// Read the data from an Excel file
        /// </summary>
        /// <param name="filename">File we want to read</param>
        public void ReadFile(string filename)
        {
            // https://coderwall.com/p/app3ya/read-excel-file-in-c
            Application xlApp = new Application();
            Workbook workbook = xlApp.Workbooks.Open(filename);
            Worksheet worksheet = (Worksheet)workbook.Sheets[1];
            Excel.Range range = worksheet.UsedRange;

            int rowCount = 20;// range.Rows.Count;
            int colCount = 20;// range.Columns.Count;            

            //iterate over the rows and columns and print to the console as it appears in the file
            //excel is not zero based!!
            for (int i = 1; i <= 3; i++)
            {
                for (int j = 1; j <= colCount; j++)
                {
                    //new line
                    if (j == 1)
                        Console.Write("\r\n");

                    //write the value to the console
                    if (range.Cells[i, j] != null && range.Cells[i, j].ToString() != null)
                        Console.Write(range.Cells[i, j].ToString() + "\t");

                    //add useful things here!   
                }
            }
        }

    }
}
