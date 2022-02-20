"""
Transform raw csv data to staging format.
"""
# %%
import pandas as pd
from dictionary_utils import get_values_dict

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
    if pd.isna(val) or str(val) == 'nan':
        return None
    if not col_in_dict and col not in error_cols:
        print(f'col "{col}" missing from dict')
        error_cols.append(col)
    if col_in_dict and col not in error_cols:
        print(f'value "{val}" for col: "{col}" is missing in the dict.')
        error_cols.append(col)
    return val


def create_transform_output(year, state, type):
    """
    Given a year, state, and survey type, retrieves the local copy of survey
    data and data dictionary for the given year, transforms data values to
    dictionary equivalent, and outputs a staged_data/{year}_{type}_{state}.csv file
    """
    data_dict = f'csv_data/dictionaries/PUMS_Data_Dictionary_{year}'
    vals_dict = get_values_dict(data_dict)

    print(f'\ncreate_transform_output({year}, {state}, {type})')

    data = pd.read_csv(f'csv_data/surveys/{year}_{type}_{state}.csv')

    # add year column
    data['year'] = str(year)

    # transform column values
    for col in data:
        if col in vals_dict:
            data[col] = data[col].apply(
                lambda x: set_val_from_dictionary(col, x, vals_dict)
            )

    data.to_csv(f'staged_data/{year}_{type}_{state}.csv')


def transform_state_for_years(state, years, types):
    """
    Used to pool transform tasks by states.
    Given a states, years list, and type list, runs
    transform function on all type and year combinations for the state.
    """
    for year in years:
        for type in types:
            create_transform_output(year, state, type)


if __name__ == "__main__":
    from multiprocessing import Pool
    from functools import partial
    from dictionary_utils import states, types, recent_years

    transform_pool = Pool()
    transform_pool.map(
        partial(transform_state_for_years, years=recent_years, types=types),
        states
    )
