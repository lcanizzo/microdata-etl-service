# %%
import pandas as pd
from os import listdir, remove as os_remove
from os.path import isfile, join, exists

path = './etl_val_errors'
summary_path = f'{path}/compiled/summary.csv'


def pivot_errors(df):
    """
    Takes compiled errors dataframe and pivots error values under
    column name columns.
    """
    return df.pivot_table(values='value', index=df.index, columns='column', aggfunc='first')


def condense_summary(summary_df):
    """
    Reads the summary error csv and condenses to a more readable dataframe.
    """
    error_cols = []

    for columnName in summary_df:
        error_vals = summary_df[~summary_df[columnName].isnull()]
        col_frame = pd.DataFrame(error_vals, columns=[columnName])
        col_frame = col_frame.reset_index(drop=True)
        error_cols.append(col_frame)

    return pd.concat(error_cols, axis=1)


if __name__ == '__main__':
    error_frames = []

    error_file_list = [f for f in listdir(path) if isfile(join(path, f))]

    for file_name in error_file_list:
        file_path = f'{path}/{file_name}'
        frame = pd.read_csv(file_path)
        error_frames.append(frame)
        # os_remove(file_path)

    if error_frames:
        compiled_errors = pd.concat(error_frames)
        compiled_errors.drop_duplicates(inplace=True)
        compiled_errors = pivot_errors(compiled_errors)
        compiled_errors = condense_summary(compiled_errors)
        compiled_errors.to_csv(summary_path)
    print('\ndone')

    

    # Forgot to condense summary after pivot
    # if exists(summary_path):
    #     compiled_errors = pd.read_csv(summary_path)
    #     compiled_errors = condense_summary(compiled_errors)
    #     compiled_errors.to_csv(summary_path)
