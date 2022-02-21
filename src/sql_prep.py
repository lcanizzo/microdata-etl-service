# %%
import pandas as pd

col_names = pd.read_csv('./col_name_map.csv', usecols=['SQL_COL'])
col_names.drop_duplicates(inplace=True)

with open('../sql/create_staging_table.sql', 'w') as sql_file:
    sql_file.write('CREATE TABLE staging (\n')
    for col in col_names.values:
        sql_file.write(f'	{col[0]} VARCHAR(500),\n')
    sql_file.write(');')

print('\ndone')