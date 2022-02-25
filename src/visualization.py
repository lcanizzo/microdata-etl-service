"""
Runs a small query (seen in sql/Analytical_Queries.sql)
Renders a plot.
"""

# %%
import pandas as pd
import pyodbc
import sqlalchemy
from sql import get_params

params = get_params()
con = sqlalchemy.create_engine(
    'mssql+pyodbc:///?odbc_connect=%s' % params
)

data = pd.read_sql("""
SELECT
	State,
	AVG(CAST(Age AS DECIMAL(3))) AS Avg_Age
FROM (
	SELECT ID FROM Family WHERE MarriedPastYear = 'Yes'
) AS NewlyWed
JOIN PERSON ON Person.Family_ID = NewlyWed.ID
JOIN Location ON PERSON.Location_ID = Location.ID
JOIN Biometrics ON Person.Biometrics_ID =Biometrics.ID
GROUP BY State
ORDER BY Avg_Age;
""", con, index_col='State', columns=['State', 'Avg_Age'])

data.plot(figsize=(15, 10))
print(data)