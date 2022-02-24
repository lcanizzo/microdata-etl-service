"""
Split staged files into fact and dimension tables.
"""
# %%
import json
import pandas as pd
import numpy as np
import pyodbc
import sqlalchemy
from multiprocess import Pool, cpu_count
from functools import partial
from sql import get_params, param_string
from prepare_create_sql import get_fact_dim_cols

sql_dict = {}

with open('./data/dictionaries/table_cols.json') as f:
    sql_dict = json.load(f)

fact_dim_cols = get_fact_dim_cols()

p_fact_cols = sql_dict['fact_tables'][0]['columns']
h_fact_cols = sql_dict['fact_tables'][1]['columns']


def add_household_for_iterrow(row, i):
    conn = pyodbc.connect(param_string)
    conn.autocommit = True
    cursor = conn.cursor()
    print('+++connection for row added')
    sql = 'SET QUOTED_IDENTIFIER OFF;SET ANSI_NULLS ON;'
    sql += f'DECLARE @current_Household_Seq INT = NEXT VALUE FOR Household_Seq;\n'
    sql += f'EXECUTE AddHousehold @current_Household_Seq'
    for col in fact_dim_cols['Household']:
        val = json.dumps(str(row[col]))
        sql += f""", {val}"""
    for col in h_fact_cols:
        val = json.dumps(str(row[col]))
        sql += f""", {val}"""
    sql += ';'
    cursor.execute(sql)
    cursor.close()
    del cursor
    conn.close()
    print('------connection for row closed')


def add_person_for_iterrow(row, i):
    conn = pyodbc.connect(param_string)
    conn.autocommit = True
    cursor = conn.cursor()
    print('+++connection for row added')
    sql = 'SET QUOTED_IDENTIFIER OFF;SET ANSI_NULLS ON;'
    sql += f'DECLARE @current_Person_Seq INT = NEXT VALUE FOR Person_Seq;\n'
    sql += f'EXECUTE AddPerson @current_Person_Seq'
    for col in fact_dim_cols['Person']:
        val = json.dumps(str(row[col]))
        sql += f""", {val}"""
    for col in p_fact_cols:
        val = json.dumps(str(row[col]))
        sql += f""", {val}"""
    sql += ';'
    cursor.execute(sql)
    cursor.close()
    del cursor
    conn.close()
    print('------connection for row closed')


def iterrowHousehold(data_list):
    for i, row in data_list.iterrows():
        add_household_for_iterrow(row, i)


def iterrowPerson(data_list):
    for i, row in data_list.iterrows():
        add_person_for_iterrow(row, i)


def iterrow(data_list, type):
    if type == 'p':
        iterrowPerson(data_list)
    elif type == 'h':
        iterrowHousehold(data_list)


def load_to_warehouse(type):
    print(f'\nload_{type}_to_warehouse')
    upper_type = type.upper()
    params = get_params()
    con = sqlalchemy.create_engine(
        'mssql+pyodbc:///?odbc_connect=%s' % params
    )
    staging_data = pd.read_sql_table(f'{upper_type}_Staging', con)
    processors = cpu_count()
    chunk_size = int(staging_data.shape[0]/processors)
    print(f'processors: {processors}')
    print(f'chunk_size: {chunk_size}')
    print(f'staging_data.shape[0]: {staging_data.shape[0]}')
    data_list = [staging_data.iloc[staging_data.index[i:i + chunk_size]]
                 for i in range(0, staging_data.shape[0], chunk_size)]
    print(f'data_list: {data_list}')

    pool = Pool()
    pool.map(partial(iterrow, type=type), data_list)
    pool.close()
    pool.join()


def load_staged_data():
    load_to_warehouse('p')
    load_to_warehouse('h')


if __name__ == '__main__':
    from process_timer import time_execution

    time_execution(load_staged_data)
    # add_household_for_iterrow(H_Staging.head(1))
