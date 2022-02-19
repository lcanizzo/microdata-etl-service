datawarehouse_name = ''

# sql-server (target db, datawarehouse)
datawarehouse_db_config = {
  'Trusted_Connection': 'yes',
  'driver': '{SQL Server}',
  'server': '',
  'database': '{}'.format(datawarehouse_name),
  'user': '',
  'password': '',
  'autocommit': True,
}
