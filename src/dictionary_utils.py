"""
Prepares PUMS Data-Dict CVS for use as panda data frames.
- Adds columns names.
- Removes column description rows.
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


def get_vals_path(original_file_name):
    return f'./{original_file_name}-values.csv'


def split_original(original_file_name):
    """
    Given a path to an original PUMS data-dict csv,
    produces a descriptions csv file & values csv file with col names.
    """
    original_file = f'./{original_file_name}.csv'
    vals_file = get_vals_path(original_file_name)
    descriptions_file = f'./{original_file_name}-descriptions.csv'
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
        print(f'details file: "{descriptions_file}" written.')

    print(f'--- data dict csv prep done.')


def get_values_dict(original_file_name):
    """
    Reads a values csv file, and returns a dict of value mapping
    """
    vals_file = get_vals_path(original_file_name)
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


def create_values_json(original_file_name):
    """
    Reads a values csv file, and produces a JSON file from
    """
    val_dict = get_values_dict(original_file_name)

    with open(f'./{original_file_name}-values.json', 'w') as output:
        json.dump(val_dict, output)


def prepare_recent_years():
    """
    Splits PUMS data dictionaries for recent years, and creates Values
    dictionary JSON files.
    """
    for year in recent_years:
        base_name = f'PUMS_Data_Dictionary_{year}'
        data_dict = f'csv_data/dictionaries/{base_name}'

        split_original(data_dict)
        create_values_json(data_dict)


if __name__ == "__main__":
    # print(f'recent years: {recent_years}')
    # prepare_recent_years()

    dictionary = pd.read_csv(f'./csv_data/dictionaries/PUMS_Data_Dictionary_2018-descriptions.csv', usecols=['PUMS_COL_NAME','DESCRIPTION'])
    dictionary.to_csv('./2018-name-description.csv')