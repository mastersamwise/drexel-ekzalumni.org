using Microsoft.Office.Interop.Excel;
using Sylvan.Data.Excel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

// https://github.com/MarkPflug/Sylvan.Data.Excel
using Sylvan.Data;
using Sylvan.Data.Excel;

namespace DrexelEkzUtilities
{
    public class ExcelReader
    {
        /// <summary>
        /// Default Constructor
        /// </summary>
        public ExcelReader()
        {
            // intentionally left blank
        }

        public void ReadFile(string filename)
        {
            
        }

        #region Interop Excel Reader

        /// <summary>
        /// Read the data from an Excel file using the Interop library
        /// </summary>
        /// <param name="filename">File we want to read</param>
        public void ReadFileWithInterop(string filename)
        {
            // https://coderwall.com/p/app3ya/read-excel-file-in-c
            Application xlApp = new Application();
            Workbook workbook = xlApp.Workbooks.Open(filename);
            Worksheet worksheet = (Worksheet)workbook.Sheets[1];
            Microsoft.Office.Interop.Excel.Range range = worksheet.UsedRange;

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

        #endregion Interop Excel Reader

        #region Sylvan Excel Reader

        /// <summary>
        /// Read the data from an Excel file using the Sylvan library
        /// </summary>
        /// <param name="filename">File we want to read</param>
        public void ReadFileWithSylvan(string filename)
        {
            // https://github.com/MarkPflug/Sylvan.Data.Excel?tab=readme-ov-file#bind-excel-data-to-objects-using-sylvandata
            // error help: https://stackoverflow.com/questions/71444843/sylvan-csv-reader-c-sharp-check-for-missing-column-in-csv
            // error help: https://github.com/MarkPflug/Sylvan.Data.Excel/issues/184

            using var reader = ExcelDataReader.Create(filename);
            CheckColumnOrdinalsWithSylvan(reader, filename);

            foreach (RawBrotherData item in reader.GetRecords<RawBrotherData>())
            {
                Console.WriteLine($"Brother {item.firstName} {item.lastName}, EK: {item.ekNumber}");
            }

        }

        /// <summary>
        /// Display a list of the columns that the Sylvan library finds in the spreadsheet (to verify my list is correct)
        /// </summary>
        /// <param name="filename"></param>
        public void CheckColumnsWithSylvan(string filename)
        {
            using var reader = ExcelDataReader.Create(filename);

            foreach (var column in reader.GetColumnSchema())
            {
                Console.WriteLine(column.ColumnName);
            }
        }

        /// <summary>
        /// When trying to figure out/double check the columns that Sylvan is detecting in the spreadsheet
        /// </summary>
        /// <param name="filename"></param>
        private void CheckColumnOrdinalsWithSylvan(ExcelDataReader reader, string filename)
        {
            List<int> colArray = new List<int>();
            //using var reader = ExcelDataReader.Create(filename);
            int test1 = -1; try { reader.GetOrdinal("fullName"); } catch { }
            int test2 = -1; try { reader.GetOrdinal("firstName"); } catch { }
            int test3 = -1; try { reader.GetOrdinal("middleName"); } catch { }
            int test4 = -1; try { reader.GetOrdinal("lastName"); } catch { }
            int test5 = -1; try { reader.GetOrdinal("ekNumber"); } catch { }
            int test6 = -1; try { reader.GetOrdinal("memberStatus"); } catch { }
            int test7 = -1; try { reader.GetOrdinal("initiationYear"); } catch { }
            int test8 = -1; try { reader.GetOrdinal("graduationYear"); } catch { }
            int test9 = -1; try { reader.GetOrdinal("collegeStatus"); } catch { }
            int test10 = -1; try { reader.GetOrdinal("email1"); } catch { }

            int test11 = -1; try { reader.GetOrdinal("email2"); } catch { }
            int test12 = -1; try { reader.GetOrdinal("phone1"); } catch { }
            int test13 = -1; try { reader.GetOrdinal("phone2"); } catch { }
            int test14 = -1; try { reader.GetOrdinal("addressType"); } catch { }
            int test15 = -1; try { reader.GetOrdinal("address1Address"); } catch { }
            int test16 = -1; try { reader.GetOrdinal("address1City"); } catch { }
            int test17 = -1; try { reader.GetOrdinal("address1State"); } catch { }
            int test18 = -1; try { reader.GetOrdinal("address1ZipCode"); } catch { }
            int test19 = -1; try { reader.GetOrdinal("address1Country"); } catch { }
            int test20 = -1; try { reader.GetOrdinal("address2Address"); } catch { }

            int test21 = -1; try { reader.GetOrdinal("address2City"); } catch { }
            int test22 = -1; try { reader.GetOrdinal("address2State"); } catch { }
            int test23 = -1; try { reader.GetOrdinal("address2ZipCode"); } catch { }
            int test24 = -1; try { reader.GetOrdinal("address2Country"); } catch { }
            int test25 = -1; try { reader.GetOrdinal("birthMonth"); } catch { }
            int test26 = -1; try { reader.GetOrdinal("birthDay"); } catch { }
            int test27 = -1; try { reader.GetOrdinal("birthYear"); } catch { }
            int test28 = -1; try { reader.GetOrdinal("deathMonth"); } catch { }
            int test29 = -1; try { reader.GetOrdinal("deathDay"); } catch { }
            int test30 = -1; try { reader.GetOrdinal("deathYear"); } catch { }

            int test31 = -1; try { reader.GetOrdinal("obituary"); } catch { }
            int test32 = -1; try { reader.GetOrdinal("spouse"); } catch { }
            int test33 = -1; try { reader.GetOrdinal("spouseEmail"); } catch { }
            int test34 = -1; try { reader.GetOrdinal("isMemberOfAlumniFbGroup"); } catch { }
            int test35 = -1; try { reader.GetOrdinal("fbHandleName"); } catch { }
            int test36 = -1; try { reader.GetOrdinal("isMemberOfAlumniInstaGroup"); } catch { }
            int test37 = -1; try { reader.GetOrdinal("instagramHandle"); } catch { }
            int test38 = -1; try { reader.GetOrdinal("profession"); } catch { }
            int test39 = -1; try { reader.GetOrdinal("jobTitle"); } catch { }
            int test40 = -1; try { reader.GetOrdinal("companyName"); } catch { }

            int test41 = -1; try { reader.GetOrdinal("isInterestedInBeingMentor"); } catch { }
            int test42 = -1; try { reader.GetOrdinal("initiatedChapter"); } catch { }
            int test43 = -1; try { reader.GetOrdinal("initiatedUniversity"); } catch { }
            int test44 = -1; try { reader.GetOrdinal("lxaIHQReferenceID"); } catch { }

            colArray.Add(test1);
            colArray.Add(test2);
            colArray.Add(test3);
            colArray.Add(test4);
            colArray.Add(test5);
            colArray.Add(test6);
            colArray.Add(test7);
            colArray.Add(test8);
            colArray.Add(test9);
            colArray.Add(test10);
            colArray.Add(test11);
            colArray.Add(test12);
            colArray.Add(test13);
            colArray.Add(test14);
            colArray.Add(test15);
            colArray.Add(test16);
            colArray.Add(test17);
            colArray.Add(test18);
            colArray.Add(test19);
            colArray.Add(test20);
            colArray.Add(test21);
            colArray.Add(test22);
            colArray.Add(test23);
            colArray.Add(test24);
            colArray.Add(test25);
            colArray.Add(test26);
            colArray.Add(test27);
            colArray.Add(test28);
            colArray.Add(test29);
            colArray.Add(test30);
            colArray.Add(test31);
            colArray.Add(test32);
            colArray.Add(test33);
            colArray.Add(test34);
            colArray.Add(test35);
            colArray.Add(test36);
            colArray.Add(test37);
            colArray.Add(test38);
            colArray.Add(test39);
            colArray.Add(test40);
            colArray.Add(test41);
            colArray.Add(test42);
            colArray.Add(test43);
            colArray.Add(test44);

            int i = 1;
            foreach (int test in colArray)
            {
                Console.WriteLine($"test {i}: {test}");
                i++;
            }
        }

        #endregion Sylvan Excel Reader
    }
}