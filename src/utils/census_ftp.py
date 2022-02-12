"""
Functions to interface with census ftp server.
@author Luca Canizzo
"""
#%%
import sys
sys.path.append("..")
from io import BytesIO
from ftplib import FTP

def download_file(path):
    """
    Returns file from census ftp server given file path.
    """
    with FTP('ftp2.census.gov') as ftp:
        ftp.login()
        download = BytesIO()
        ftp.retrbinary('RETR ' + path, download.write)
        download.seek(0)
        return download
# %%
 