"""
Functions to load historical data from census PUMS
@author Luca Canizzo
"""
#%%
from ftplib import FTP
from ftp_utils import base_path, extract_csv
from _constants import states, types

#%%
def extract_files_for_year(year):
    """
    Given a year, connects to the census FTP server and extracts 1-year PUMS
    CSV files to the data/surveys dir
    """
    print(f'--- extraction for year {year} started.')
    with FTP('ftp2.census.gov') as ftp:
        ftp.login()
        # cwd to year
        ftp.cwd(base_path + f'{year}')

        # Check if in 1-Year or default dir 
        hasOneYearDir = False
        def setHasDir (retr_line):
            nonlocal hasOneYearDir
            hasOneYearDir = retr_line.endswith('1-Year')
        ftp.retrlines('LIST *1-Year*', setHasDir)

        # Update relative path appropriately
        if hasOneYearDir:
            ftp.cwd('1-Year')

        for state in states:
            for type in types:
                # Try to download csv at path (todo: not really a 'try' here...)
                extract_csv(ftp, year, type, state)
        print(f'--- extraction for year {year} done.')

if __name__ == "__main__":
    from multiprocessing import Pool
    from _constants import years
    
    print(years)
    extract_pool = Pool()
    extract_pool.map(extract_files_for_year, years)
# %%