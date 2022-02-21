"""
Transform raw csv data to staging format.
"""
# %%
import pandas as pd
import json
from dictionary_utils import get_values_dict, prefix_val, skip_map_columns, \
    custom_transform_columns

error_cols = []
error_tuples = []


def set_val_from_dictionary(col, reported_val, dict):
    """
    Given a colun name, value, and data dictionary, returns the human readable
    value for the given column.
    """
    match_val = reported_val

    # normalize return for null and nan
    if pd.isna(reported_val) \
        or pd.isnull(reported_val) \
        or reported_val == 'did not report':
        return ''

    # normalize numeric values to standard number string
    if isinstance(reported_val, float):
        int_val = int(reported_val)
        match_val = str(int_val)
    if isinstance(reported_val, int):
        match_val = str(reported_val)

    match_val = prefix_val(col, match_val)

    # skip matching for skip columns
    if col in skip_map_columns:
        return match_val
    
    # use custom fn for custom columns
    if col in custom_transform_columns:
        return custom_transform_columns[col](match_val)

    # get dictionary value
    if match_val in dict[col]:
        return dict[col][match_val]

    if col not in error_cols:
        print(f'value "{match_val}" for col: "{col}" is missing in the dict.')
        error_cols.append(col)
    if (col, match_val) not in error_tuples:
        error_tuples.append((col, match_val))

    return reported_val


def create_transform_output(year, state, type):
    """
    Given a year, state, and survey type, retrieves the local copy of survey
    data and data dictionary for the given year, transforms data values to
    dictionary equivalent. 
    Output: staged_data/{year}_{type}_{state}.csv
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
        with open(f'etl_val_errors/{year}_{state}_{type}.csv', 'w+') as log_file:
            log_file.write('value,column\n')
            for error_tuple in error_tuples:
                c, v = error_tuple
                log_file.write(f'{v},{c}\n')

    # add year column
    year_series = pd.Series(
        [year] * len(data), index=data.index, name='SurveyYear')
    data = pd.concat([data, year_series], axis=1)

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
    from _constants import states, types, recent_years

    print(recent_years)
    transform_pool = Pool()
    transform_pool.map(
        partial(transform_state_for_years, years=recent_years, types=types),
        states
    )

    # Single test
    # create_transform_output(2013, 'nj', 'h')

    print('done')
