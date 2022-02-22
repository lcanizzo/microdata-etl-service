"""
Functions to load historical data from census PUMS
@author Luca Canizzo
"""
#%%
from multiprocessing import Pool
from functools import partial
from _constants import states, types, recent_years
from ftplib import FTP
from ftp_utils import base_path, extract_csv

#%%
def extract_state_for_years(state, years, types):
    """
    Given a state, year range, and type set: 
    Connects to the census FTP server and extracts 1-year state PUMS CSV files
    """
    print(f'--- extraction for state {state} started.')
    for year in years:
        for type in types:
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

                extract_csv(ftp, year, type, state)
    print(f'--- extraction for state {state} done.')

def main():
    print(recent_years)
    extract_pool = Pool()
    extract_pool.map(
        partial(extract_state_for_years, years=recent_years, types=types),
        states
    )

if __name__ == "__main__":
    from process_timer import time_execution

    time_execution(main)    
   
# %%