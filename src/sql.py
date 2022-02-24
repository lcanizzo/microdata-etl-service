import urllib

params = urllib.parse.quote_plus(
    'DRIVER={SQL Server};' +
    'SERVER=DESKTOP-GPDN5C9\SQLEXPRESS;' +
    'DATABASE=CS779_Term_Project;' +
    'Trusted_Connection=True;'
)
