using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

// https://github.com/MarkPflug/Sylvan.Data.Excel
using Sylvan.Data;
using Sylvan.Data.Excel;

namespace DrexelEkzUtilities
{
    public class SylvanExcelReader
    {
        private readonly string EXCEL_FILE = "../../../../20241116_LXA_EKZ_MASTER_BROTHERS_LIST_0.xlsx";

        /// <summary>
        /// Default Constructor
        /// </summary>
        public SylvanExcelReader()
        {
            // intentionally left blank
        }

        /// <summary>
        /// Read the data from an Excel file
        /// </summary>
        /// <param name="filename">File we want to read</param>
        public void ReadFileWithSylvan(string filename)
        {
            // https://github.com/MarkPflug/Sylvan.Data.Excel?tab=readme-ov-file#bind-excel-data-to-objects-using-sylvandata
            // error help: https://stackoverflow.com/questions/71444843/sylvan-csv-reader-c-sharp-check-for-missing-column-in-csv
            // error help: https://github.com/MarkPflug/Sylvan.Data.Excel/issues/184
            using var reader = ExcelDataReader.Create(EXCEL_FILE);
            foreach (RawBrotherData item in reader.GetRecords<RawBrotherData>())
            {
                Console.WriteLine($"Brother {item.firstName} {item.lastName}, EK: {item.ekNumber}");
            }
            
        }

        public void ReadFile(string filename) 
        {

        }

    }
}
