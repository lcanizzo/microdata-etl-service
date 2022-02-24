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


def load_h_to_warehouse():
    print('\nload_h_to_warehouse')
    # load H_Staging
    params = get_params()
    con = sqlalchemy.create_engine(
        'mssql+pyodbc:///?odbc_connect=%s' % params
    )
    H_Staging = pd.read_sql_table('H_Staging', con)
    processors = cpu_count()
    chunk_size = int(H_Staging.shape[0]/processors)
    print(f'processors: {processors}')
    print(f'chunk_size: {chunk_size}')
    print(f'H_Staging.shape[0]: {H_Staging.shape[0]}')
    data_list = [H_Staging.iloc[H_Staging.index[i:i + chunk_size]]
              for i in range(0, H_Staging.shape[0], chunk_size)]
    print(f'data_list: {data_list}')

    pool = Pool()
    pool.map(iterrowHousehold, data_list)
    pool.close()
    pool.join()
    
def load_p_to_warehouse():
    print('\nload_p_to_warehouse')
    # load P_Staging
    params = get_params()
    con = sqlalchemy.create_engine(
        'mssql+pyodbc:///?odbc_connect=%s' % params
    )
    P_Staging = pd.read_sql_table('P_Staging', con)
    processors = cpu_count()
    chunk_size = int(P_Staging.shape[0]/processors)
    print(f'processors: {processors}')
    print(f'chunk_size: {chunk_size}')
    print(f'P_Staging.shape[0]: {P_Staging.shape[0]}')
    data_list = [P_Staging.iloc[P_Staging.index[i:i + chunk_size]]
              for i in range(0, P_Staging.shape[0], chunk_size)]
    print(f'data_list: {data_list}')

    pool = Pool()
    pool.map(iterrowPerson, data_list)
    pool.close()
    pool.join()


def load_staged_data():
    load_p_to_warehouse()
    load_h_to_warehouse()


if __name__ == '__main__':
    from process_timer import time_execution

    time_execution(load_staged_data)
    # add_household_for_iterrow(H_Staging.head(1))