# PUMS Data Warehousing
_(supports survey years 2013 and later)_

This set of scripts, and accompanying "dictionary" files facilitate download and warehousing of Census Bureau Public Use Microdata. 

Dictionary files included identify more user-friendly columns, a reduced column inclusion set, and a simple constellation schema (defined in `data/dictionaries/table_cols.json`).

## GENERIC SEQUENCE:
- [__`python`__ `get_data.py`] Get data
- [__`python`__ `staging_etl.py`] Transform values & Column Names (prepare staging data)
- [__`python`__ `commit_staging.py`] merge and write all staged dataframes to staging tables in DB
- [__`python`__ `prepare_create_sql.py`] writes dynamic CREATE TABLE sql based on config & writes Stored Procedures
- [__`SQL Server`__] execute `sql/create_tables.sql`table & `sql/create_procedure.sql` on DB
- [__`python`__ `load_to_warehouse.py`] writes staging tables to warehouse tables based on defined config
- [__`python`__ `visualization.py`] runs a query with visualization
