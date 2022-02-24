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
from sql import params, param_string
from prepare_create_sql import get_fact_dim_cols

sql_dict = {}

with open('./data/dictionaries/table_cols.json') as f:
    sql_dict = json.load(f)

fact_dim_cols = get_fact_dim_cols()

# load H_Staging
# con = sqlalchemy.create_engine(
#     'mssql+pyodbc:///?odbc_connect=%s' % params
# )
# H_Staging = pd.read_sql_table('H_Staging', con)

H_Staging = pd.read_csv('./test_h_staging.csv')


h_fact_cols = sql_dict['fact_tables'][1]['columns']

def add_household_for_iterrow(row):
    conn = pyodbc.connect(param_string)
    cursor = conn.cursor()
    print('+++connection for row added')
    serial_num = row.iloc[0]['SerialNumber']
    print(f'serialNo: {serial_num}')
    sql = f'EXECUTE AddHousehold {serial_num}'
    for col in fact_dim_cols['Household']:
        val = json.dumps(str(row.iloc[0][col]))
        sql += f""", {val}"""
    for col in h_fact_cols:
        val = json.dumps(str(row.iloc[0][col]))
        sql += f""", {val}"""
    sql += ';'
    print(sql)
    cursor.execute(sql)
    print('------connection for row closed')


def iterrow(data_list):
    for row in data_list:
        add_household_for_iterrow(row)


def load_h_to_warehouse():
    print('\nload_h_to_warehouse')
    processors = cpu_count()
    chunk_size = int(H_Staging.shape[0]/processors)
    data_list = [H_Staging.iloc[H_Staging.index[i:i + chunk_size]]
              for i in range(0, H_Staging.shape[0], chunk_size)]

    pool = Pool()
    pool.map(add_household_for_iterrow, data_list)
    pool.close()
    pool.join()


if __name__ == '__main__':
    from process_timer import time_execution

    # time_execution(load_h_to_warehouse)
    add_household_for_iterrow(H_Staging.head(1))