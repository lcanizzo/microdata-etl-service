#%%
import zipfile
import re
from utils import census_ftp

file_path = 'programs-surveys/acs/data/pums/2019/1-Year/csv_hin.zip'

ftp_file = census_ftp.download_file(file_path)

with zipfile.ZipFile(ftp_file, 'r') as zip:
    for info in zip.infolist():
        if re.match(r'.+(\.csv)$', info.filename):
            info.filename = '2019_h_in.csv' # todo: dynamic from iteration
            print(f'extracting "{info.filename}" to ./csv-data')
            zip.extract(info, './csv-data')
# %%
 