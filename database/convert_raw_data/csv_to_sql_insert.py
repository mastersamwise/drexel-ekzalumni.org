import pandas as pd
print("Pandas imported successfully")
import csv

def csv_to_sql_insert(csv_file, table_name, output_file):
    """Converts a CSV file to SQL INSERT statements."""

    try:
        df = pd.read_csv(csv_file)
        print(df.head())
    except FileNotFoundError:
        print(f"Error: CSV file '{csv_file}' not found.")
        return

    columns = ', '.join(df.columns)

    with open(output_file, 'w') as sql_file:
        for index, row in df.iterrows():
            values = []
            for value in row:
                if pd.isna(value): #handle null/nan values
                    values.append('NULL')
                elif isinstance(value, str):
                    escaped_value = value.replace("'", "''") #escape single quotes
                    values.append(f"'{escaped_value}'")
                else:
                    values.append(str(value))
            values_str = ', '.join(values)
            sql_file.write(f"INSERT INTO {table_name} ({columns}) VALUES ({values_str});\n")
			
# Example usage:
csv_to_sql_insert('20250309_LXA_EKZ_MASTER_BROTHERS_LIST.csv', 'temp_members', 'insert_lxa_script.sql')
