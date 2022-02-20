"""
Transform raw csv data to staging format.
"""
# %%
import pandas as pd
import json
from dictionary_utils import get_values_dict

error_cols = []
error_tuples = []

def set_val_from_dictionary(col, val, dict):
    """
    Given a colun name, value, and data dictionary, returns the human readable
    value for the given column.
    """
    col_in_dict = col in dict

    if col_in_dict:
        if str(val) in dict[col]:
            return dict[col][str(val)]
        if pd.notna(val) and type(val) is float:
            int_val = int(val)
            if str(int_val) in dict[col]:
                return dict[col][str(int_val)]
    if pd.isna(val) or str(val) == 'nan':
        return None
    if col not in error_cols:
        if col_in_dict:
            print(f'value "{val}" for col: "{col}" is missing in the dict.')
            error_cols.append(col)
            error_tuples.append((col, val))

    return val


def create_transform_output(year, state, type):
    """
    Given a year, state, and survey type, retrieves the local copy of survey
    data and data dictionary for the given year, transforms data values to
    dictionary equivalent, and outputs a staged_data/{year}_{type}_{state}.csv file
    """
    data = pd.read_csv(f'data/surveys/{year}_{type}_{state}.csv')
    vals_dict = get_values_dict(year)

    print(f'\ncreate_transform_output({year}, {state}, {type})')

    # update column names
    with open('./data/dictionaries/col_name_map.json') as json_file:
        column_name_map = json.load(json_file)
        data = data.rename(column_name_map, axis='columns')

    # transform column values
    for col in data:
        if col in vals_dict:
            data[col] = data[col].map(
                lambda val: set_val_from_dictionary(col, val, vals_dict)
            )
    
    # log value errors
    if error_tuples:
        with open(f'etl_value_errors_{year}_{state}_{type}.csv', 'w+') as log_file:
            for error_tuple in error_tuples:
                c, v = error_tuple
                log_file.write(f'value "{v}" for col: "{c}" is missing in the dict.')

    # add year column
    data['Year'] = str(year)

    # write to staged_data directors
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

    # %%
    transform_pool = Pool()
    transform_pool.map(
        partial(transform_state_for_years, years=recent_years, types=types),
        states
    )
    print('done')

    # Single test
    # create_transform_output('2018', 'ak', 'p')