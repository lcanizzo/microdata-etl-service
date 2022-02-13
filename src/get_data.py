"""
Functions to load historical data from census PUMS
@author Luca Canizzo
"""
#%%
import os
from ftplib import FTP
from multiprocessing import Pool
from census_utils import years, states, types, base_path, extract_csv

#%%
def extract_files_for_year(year):
    print(f'--- pool for year {year} started.')
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
                # Try to download csv at path
                extract_csv(ftp, year, type, state)
        print(f'--- pool for year {year} done.')

if __name__ == "__main__":
    print(years)
    extract_pool = Pool()
    test = extract_pool.map(extract_files_for_year, years)    
    print(test)
# %%