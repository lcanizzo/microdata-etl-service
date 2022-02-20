"""
Transform raw csv data to staging format.
"""
from prepare_dictionary import split_dict_csv, get_values_dict
import pandas as pd

error_cols = []


def set_val_from_dictionary(col, val, dict):
    """
    Given a colun name, value, and data dictionary, returns the human readable
    value for the given column.
    """
    col_in_dict = col in dict

    if col_in_dict:
        if str(val) in dict[col]:
            return dict[col][str(val)]
        if not pd.isna(val) and type(val) is float:
            int_val = int(val)
            if str(int_val) in dict[col]:
                return dict[col][str(int_val)]
    if not col_in_dict and col not in error_cols:
        print(f'col "{col}" missing from dict')
        error_cols.append(col)
    if col_in_dict and col not in error_cols:
        print(f'value "{val}" for col: "{col}" is missing in the dict.')
        error_cols.append(col)
    return val


if __name__ == "__main__":
    test_data_dict = 'test_data/2018-dict--test'
    split_dict_csv(test_data_dict)
    vals_dict = get_values_dict(test_data_dict)

    # %%
    test_data = pd.read_csv('./test_data/2018_h_ak--test.csv')
    test_data

    for col in test_data:
        if col in vals_dict:
            test_data[col] = test_data[col].apply(
                lambda x: set_val_from_dictionary(col, x, vals_dict)
            )

    # %%
    test_data
    # %%
    test_data.to_csv('./out.csv')
# %%
