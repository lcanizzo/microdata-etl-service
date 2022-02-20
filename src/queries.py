# example queries
sqlserver_insert = ('''
  INSERT INTO table (column_1, column_2, column_3)
  VALUES (?, ?, ?)  
''')

# exporting queries
class SqlQuery:
  def __init__(self, load_query):
    self.load_query = load_query
    
# create instances for SqlQuery class
sqlserver_query = SqlQuery(sqlserver_insert)

# store as list for iteration
sqlserver_queries = [sqlserver_query]