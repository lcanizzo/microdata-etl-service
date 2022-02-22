"""
Load staged files into sql server.
"""
# %%
import pandas as pd
import numpy as np
import urllib
import pyodbc
import sqlalchemy
from multiprocess import Pool
from os import listdir
from functools import partial
from process_timer import time_execution
from _constants import recent_years
from sqlalchemy.types import NVARCHAR


# insert data from csv file into dataframe.
params = urllib.parse.quote_plus(
    'DRIVER={SQL Server};' +
    'SERVER=DESKTOP-GPDN5C9\SQLEXPRESS;' +
    'DATABASE=CS779_Term_Project;' +
    'Trusted_Connection=True;'
)
num_partitions = 100
print(params)


def load_staging_dataframe(df, table):
    """todo: comment"""
    print(f'__ loading chunk')
    # DB connection
    con = sqlalchemy.create_engine(
        'mssql+pyodbc:///?odbc_connect=%s' % params
    )
    df.drop(['Unnamed: 0'], axis=1, inplace=True)
    print(df.columns)
    df.reset_index(drop=True, inplace=True)
    df.to_sql(
        table,
        schema='dbo',
        con=con,
        if_exists='append',
        dtype={col_name: NVARCHAR for col_name in df}
    )
    con.dispose()
    print(f'--- done loading chunk')


def load_data_for_type(type, years):
    """todo: comment"""
    type_files = [f for f in listdir(
        './compiled_data/staged'
    ) if f[:4] in years and f[5:6] == type]

    # Consolidate all CSV files into one object
    type_df = pd.concat(
        [pd.read_csv(f'./compiled_data/staged/{file_path}')
         for file_path in type_files]
    )

    # Chunk that object and pool loading
    table = type.upper() + '_Staging'
    type_frames = np.array_split(type_df, num_partitions)
    pool = Pool()
    pool.map(partial(
        load_staging_dataframe, table=table
    ), type_frames)
    pool.close()
    pool.join()


def load_staging_data_for_year(years):
    """todo: comment"""
    load_data_for_type('h', years)
    load_data_for_type('p', years)


if __name__ == '__main__':
    years = list(map(str, recent_years))

    time_execution(lambda: load_staging_data_for_year(years))
