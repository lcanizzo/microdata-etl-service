# %%
import pandas as pd
import json


def get_fact_dim_cols():
    fact_dim_cols = {
        "Person": [],
        "Household": []
    }

    with open('./data/dictionaries/H_Staging_Dimension_Cols.txt', 'r') as f:
        content = f.read()
        fact_dim_cols['Household'] = content.splitlines()
    with open('./data/dictionaries/P_Staging_Dimension_Cols.txt', 'r') as f:
        content = f.read()
        fact_dim_cols['Person'] = content.splitlines()

    return fact_dim_cols


def prepare_create_tables_sql():
    table_erd_dict = {}

    with open('./data/dictionaries/table_cols.json') as f:
        table_erd_dict = json.load(f)

    fact_dimension_cols = get_fact_dim_cols()

    dim_table_cols = {}

    for table in table_erd_dict['tables']:
        table_name = table['name']
        dim_table_cols[table_name] = table['columns']

    INDENT = '	'

    with open('../sql/create_procedures.sql', 'w') as sql_file:
        # write procedures to create dimension tables
        for table in table_erd_dict['tables']:
            name = table['name']
            fact_columns = table['columns']
            insert_list = ','.join(fact_columns)
            sql_file.write('\n')
            sql_file.write('\n')
            sql_file.write(f'CREATE OR ALTER PROCEDURE Add{name}\n')
            sql_file.write(f'{INDENT}@ID VARCHAR(255),\n')
            for col in fact_columns:
                if col == fact_columns[-1]:
                    sql_file.write(f'{INDENT}@{col} VARCHAR(255)\n')
                else:
                    sql_file.write(f'{INDENT}@{col} VARCHAR(255),\n')
            sql_file.write(f'AS\n')
            sql_file.write(f'BEGIN\n')
            sql_file.write(f'{INDENT}INSERT INTO {name}(ID,{insert_list})\n')
            sql_file.write(f'{INDENT}VALUES(\n')
            sql_file.write(f'{INDENT}{INDENT}@ID,\n')
            for col in fact_columns:
                if col == fact_columns[-1]:
                    sql_file.write(f'{INDENT}{INDENT}@{col}\n')
                else:
                    sql_file.write(f'{INDENT}{INDENT}@{col},\n')
            sql_file.write(f'{INDENT});\n')
            sql_file.write(f'END;\n')

        # write procedures to create fact tables
        for fact_table in table_erd_dict['fact_tables']:
            name = fact_table['name']
            fact_columns = fact_table['columns']
            fact_dim_tables = fact_table['dimensions']
            dim_cols = list(map(lambda x: f'{x}_ID', fact_dim_tables))
            insert_columns = ['ID'] + fact_columns + dim_cols
            insert_list = ','.join(insert_columns)

            sql_file.write('\n')
            sql_file.write('\n')
            sql_file.write(f'CREATE OR ALTER PROCEDURE Add{name}\n')
            sql_file.write(f'{INDENT}@ID VARCHAR(255),\n')

            for col in fact_dimension_cols[name]:
                sql_file.write(f'{INDENT}@{col} VARCHAR(255),\n')
            for col in fact_columns:
                if col == fact_columns[-1]:
                    sql_file.write(f'{INDENT}@{col} VARCHAR(255)\n')
                else:
                    sql_file.write(f'{INDENT}@{col} VARCHAR(255),\n')

            sql_file.write(f'AS\n')

            # declare dimension sequence values
            for dimension in fact_dim_tables:
                sql_file.write(
                    f'DECLARE @current_{dimension}_seq INT = NEXT VALUE FOR {dimension}_Seq;\n')
            sql_file.write(f'BEGIN\n')

            # call dimension procedures
            for dimension in fact_dim_tables:
                execute_sql = f'{INDENT}EXECUTE Add{dimension} @current_{dimension}_seq'
                for dim_col in dim_table_cols[dimension]:
                    execute_sql += f', @{dim_col}'
                execute_sql += f';\n'
                sql_file.write(execute_sql)

            # insert into fact table
            sql_file.write(f'{INDENT}INSERT INTO {name}({insert_list})\n')
            sql_file.write(f'{INDENT}VALUES(\n')
            sql_file.write(f'{INDENT}{INDENT}@ID,\n')
            for col in fact_columns:
                sql_file.write(f'{INDENT}{INDENT}@{col},\n')
            for dimension in fact_dim_tables:
                if dimension == fact_dim_tables[-1]:
                    sql_file.write(
                        f'{INDENT}{INDENT}@current_{dimension}_seq\n')
                else:
                    sql_file.write(
                        f'{INDENT}{INDENT}@current_{dimension}_seq,\n')
            sql_file.write(f'{INDENT});\n')
            sql_file.write(f'END;\n')

    with open('../sql/create_tables.sql', 'w') as sql_file:
        # reset tables
        for fact_table in table_erd_dict['fact_tables']:
            name = fact_table['name']
            sql_file.write(f'DROP TABLE IF EXISTS {name};\n')
        for fact_table in table_erd_dict['tables']:
            name = fact_table['name']
            sql_file.write(f'DROP TABLE IF EXISTS {name};\n')

        # reset sequences
        for fact_table in table_erd_dict['fact_tables']:
            name = fact_table['name']
            sql_file.write(f'DROP SEQUENCE IF EXISTS {name}_Seq;\n')
            sql_file.write(f'CREATE SEQUENCE {name}_Seq START WITH 1;\n')

        for fact_table in table_erd_dict['tables']:
            name = fact_table['name']
            sql_file.write(f'DROP SEQUENCE IF EXISTS {name}_Seq;\n')
            sql_file.write(f'CREATE SEQUENCE {name}_Seq START WITH 1;\n')

        # create tables
        for fact_table in table_erd_dict['tables']:
            name = fact_table['name']
            last_col = fact_table['columns'][-1]
            
            sql_file.write('\n')
            sql_file.write('\n')
            sql_file.write(f'CREATE TABLE {name} (\n')
            sql_file.write(f'{INDENT}ID VARCHAR(255) PRIMARY KEY,\n')
            for col in fact_table['columns']:
                if col == last_col:
                    sql_file.write(f'{INDENT}{col} VARCHAR(255)\n')
                else:
                    sql_file.write(f'{INDENT}{col} VARCHAR(255),\n')
            sql_file.write(');\n')

        for fact_table in table_erd_dict['fact_tables']:
            name = fact_table['name']
            sql_file.write('\n')
            sql_file.write('\n')
            sql_file.write(f'CREATE TABLE {name} (\n')
            sql_file.write(f'{INDENT}ID VARCHAR(255) PRIMARY KEY,\n')
            for col in fact_table['columns']:
                sql_file.write(f'{INDENT}{col} VARCHAR(255),\n')
            for dmns in fact_table['dimensions']:
                sql_file.write(f'{INDENT}{dmns}_ID VARCHAR(255),\n')
            for dmns in fact_table['dimensions']:
                sql_file.write(f'{INDENT}CONSTRAINT FK_{name}_{dmns}\n')
                sql_file.write(
                    f'{INDENT}FOREIGN KEY ({dmns}_ID) REFERENCES {dmns}(ID),\n')
            sql_file.write(');\n')


if __name__ == '__main__':
    prepare_create_tables_sql()
    print('\ndone')
