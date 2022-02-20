"""
Prepares PUMS Data-Dict CVS for use as panda data frames.
todo: review function comments for accuracy
"""
# %%
import pandas as pd
import json

years = [*range(2005, 2020, 1)]
recent_years = [2018, 2019]
states = ['ak', 'al', 'ar', 'az', 'ca', 'co', 'ct', 'dc', 'de', 'fl', 'ga',
          'hi', 'ia', 'id', 'il', 'in', 'ks', 'ky', 'la', 'ma', 'md', 'me',
          'mi', 'mn', 'mo', 'ms', 'mt', 'nc', 'nd', 'ne', 'nh', 'nj', 'nm',
          'nv', 'ny', 'oh', 'ok', 'or', 'pa', 'ri', 'sc', 'sd', 'tn', 'tx',
          'ut', 'va', 'vt', 'wa', 'wi', 'wv', 'wy']
types = ['h', 'p']


def get_vals_dict_path(year):
    return f'./data/dictionaries/{year}_values.csv'


def get_values_dict(year):
    """
    Reads a values csv file, and returns a dict of value mapping
    """
    vals_file = get_vals_dict_path(year)
    val_dict = {}

    # Produce values JSON
    values = pd.read_csv(vals_file)
    for i, row in values.iterrows():
        column_name = row['PUMS_COL_NAME']
        data_type = row['DATA_TYPE']
        min_val = row['MIN_VAL']
        max_val = row['MAX_VAL']
        value = row['VALUE']

        # if data type is char and is not a range value
        if data_type == 'C' and min_val == max_val:
            # exact value map for exact numeric key
            if column_name in val_dict:
                val_dict[column_name][min_val] = value
            else:
                val_dict[column_name] = {}
                val_dict[column_name][min_val] = value
    return val_dict


def split_original_dictionary(year):
    """
    Given a path to an original PUMS data-dict csv,
    produces a descriptions csv file & values csv file with col names.
    """
    dict_year = ''
    if year <= 2017 and year >= 2013:
        dict_year = '2013-2017'
    elif year == 2018 or year == 2019:
        dict_year = year

    original_file = f'./data/dictionaries/raw/PUMS_Data_Dictionary_{dict_year}.csv'
    vals_file = get_vals_dict_path(dict_year)
    descriptions_file = f'./data/dictionaries/{dict_year}_descriptions.csv'
    print(f'--- prepare dict csv for "{original_file}" started.')

    # Produce values csv
    with open(original_file, "r") as f:
        lines = f.readlines()
    with open(vals_file, "w") as f:
        f.write('DICT_TYPE,PUMS_COL_NAME,DATA_TYPE,DATA_LENGTH,MIN_VAL,'
                'MAX_VAL,VALUE\n')
        for line in lines:
            if line.strip("\n").startswith('NAME,'):
                continue
            else:
                f.write(line)

    rename_dict_cols(vals_file)
    print(f'values file: "{vals_file}" written.')

    # Produce description csv
    with open(original_file, "r") as f:
        lines = f.readlines()
    with open(descriptions_file, "w") as f:
        f.write('DICT_TYPE,PUMS_COL_NAME,DATA_TYPE,DATA_LENGTH,DESCRIPTION\n')
        for line in lines:
            if line.strip("\n").startswith('VAL,'):
                continue
            else:
                f.write(line)

    rename_dict_cols(descriptions_file)
    print(f'details file: "{descriptions_file}" written.')

    print(f'--- data dict csv prep done.')


def rename_dict_cols(dict_path):
    """
    For recent years, transforms split CSVs to reference SQL column names.
    """
    data_dict = pd.read_csv(dict_path)
    name_map = {}
    missing_cols = []

    with open('./data/dictionaries/col_name_map.json') as json_file:
        name_map = json.load(json_file)

    def log_missing_cols():
        for name in data_dict['PUMS_COL_NAME']:
            if not name in name_map and name not in missing_cols:
                missing_cols.append(name)

        if missing_cols:
            with open('./missing_PUMS_Col_Names.csv', 'w') as f:
                f.write('MissingColName\n')
                for col in missing_cols:
                    f.write(f'{col}\n')

    log_missing_cols()

    data_dict['PUMS_COL_NAME'] = data_dict['PUMS_COL_NAME'].apply(
        lambda name: name if name in missing_cols else name_map[name]
    )
    data_dict.to_csv(dict_path)


def create_values_json(year):
    """
    Reads a values csv file, and produces a JSON file.
    """
    val_dict = get_values_dict(year)

    with open(f'./data/dictionaries/{year}_values.json', 'w') as output_file:
        json.dump(val_dict, output_file)


def prepare_recent_years():
    """
    Splits PUMS data dictionaries for recent years, and creates Values
    dictionary JSON files.
    """
    for year in recent_years:
        split_original_dictionary(year)
        create_values_json(year)


def create_name_map_json():
    """
    Reads a static name map CSV and returns JSON format
    """
    col_name_map = pd.read_csv(
        './data/dictionaries/manual/col_name_map.csv',
        index_col='PUMS_COL_NAME',
        usecols=['PUMS_COL_NAME', 'SQL_COL']
    ).to_dict()['SQL_COL']
    
    with open('./data/dictionaries/col_name_map.json', 'w') as output_file:
        json.dump(col_name_map, output_file)


if __name__ == "__main__":
    print(f'recent years: {recent_years}')
    create_name_map_json()
    prepare_recent_years()

    # create PUMS_COL_NAME, Description csv
    # dictionary_name_desc = pd.read_csv(
    #     f'./data/dictionaries/2019_descriptions.csv',
    #     usecols=['PUMS_COL_NAME', 'DESCRIPTION']
    # )
    # dictionary_name_desc.to_csv('./2019_name_description.csv')

    print('done.')
