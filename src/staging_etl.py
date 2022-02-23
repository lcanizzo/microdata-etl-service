"""
Transform raw csv data to staging format.
"""
# %%
import numpy as np
import pandas as pd
import json
import re
from dictionary_utils import get_values_dict, prefix_val, skip_map_columns, \
    custom_transform_columns

error_cols = []
error_tuples = []


def is_empty_value(value):
    """
    Takes a survey response value.
    Returns T/F if it is not a number.
    """
    return pd.isna(value) \
        or pd.isnull(value) \
        or value == 'did not report' \
        or bool(re.match(r'^\s*$', str(value)))


def normalize_null_vals(reported_val):
    """
    Takes a reported value and returns a normalized NaN is null, nan, empty, etc.
    Else returns reported value.
    """
    if is_empty_value(reported_val):
        return np.NaN
    else:
        return reported_val


def set_val_from_dictionary(col, reported_val, dict):
    """
    Given a colun name, value, and data dictionary, returns the human readable
    value for the given column.
    """
    match_val = reported_val

    # normalize return for null and nan
    if is_empty_value(reported_val):
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
    Output: compiled_data/staged/{year}_{type}_{state}.csv
    """
    print(f'\ncreate_transform_output({year}, {state}, {type})')
    data = pd.read_csv(f'./compiled_data/surveys/{year}_{type}_{state}.csv')
    defined_types = pd.read_json(
        f'./compiled_data/types/{str(year)}.json', orient='index')[0]
    data_type = {}

    # update column names
    with open('./compiled_data/dictionaries/col_name_map.json') as json_file:
        column_name_map = json.load(json_file)
        data = data.rename(column_name_map, axis='columns')

    # drop columns
    include_cols = pd.read_csv('./data/dictionaries/load_cols.csv')
    drop_cols = []

    for col in data:
        if col not in include_cols.values:
            drop_cols.append(col)
        elif col in defined_types:
            data_type[col] = defined_types[col]

    data.drop(drop_cols, axis=1, inplace=True)

    # trim rows
    if len(data.index) > 1000:
        data = data.tail(1000)

    # transform column values
    vals_dict = get_values_dict(year)
    for col in data:
        if col in vals_dict:
            data[col] = data[col].map(
                lambda val: set_val_from_dictionary(col, val, vals_dict)
            )
        elif col in data_type:
            data[col] = data[col].map(
                lambda val: normalize_null_vals(val)
            )

    # set data types
    data = data.astype(data_type)

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

    # write to compiled_data/staged directors
    # data.to_csv(f'compiled_data/staged/{year}_{type}_{state}.csv')
    data.to_csv(f'compiled_data/staged/{year}_{type}_{state}.csv')


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
    from process_timer import time_execution
    from dictionary_utils import create_name_map_json, prepare_recent_years

    def process():
        print(f'staging_etl for years: {recent_years}')

        create_name_map_json()
        prepare_recent_years()
        transform_pool = Pool()
        transform_pool.map(
            partial(transform_state_for_years,
                    years=recent_years, types=types),
            states
        )

        # Single test
        # create_transform_output(2019, 'nv', 'h')

    time_execution(process)
