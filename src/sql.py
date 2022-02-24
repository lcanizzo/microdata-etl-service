import urllib

param_string = 'DRIVER={SQL Server};' + \
    'SERVER=DESKTOP-GPDN5C9\SQLEXPRESS;' + \
    'DATABASE=CS779_Term_Project;' + \
    'Trusted_Connection=True;'


def get_params():
    return urllib.parse.quote_plus(
        param_string
    )
