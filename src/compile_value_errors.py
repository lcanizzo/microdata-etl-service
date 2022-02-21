# %%
import pandas as pd
from os import listdir, remove as os_remove
from os.path import isfile, join

path = './etl_val_errors'


if __name__ == '__main__':
    error_frames = []

    error_file_list = [f for f in listdir(path) if isfile(join(path, f))]

    for file_name in error_file_list:
        file_path = f'{path}/{file_name}'
        error_frames.append(pd.read_csv(file_path))
        os_remove(file_path)
    
    errors = pd.concat(error_frames)
    # %%
    errors.head()
    print(len(errors.index))

    errors.drop_duplicates(inplace=True)
    print(len(errors.index))

    errors.to_csv(f'{path}/errors.csv')