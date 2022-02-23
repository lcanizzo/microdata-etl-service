"""
Prepares PUMS Data-Dict CVS for use as panda data frames.
todo: review function comments for accuracy
"""
# %%
import pandas as pd
import json
from _constants import recent_years

# dict.column.value
zero_prefix_rules = {
    'DetailedAncestryRecode1': 3,
    'DetailedAncestryRecode2': 3,
    'DetailedHispanicOriginRecode': 2,
    'DetailedRaceRecode2': 2,
    'DetailedRaceRecode3': 3,
    'EducationalAttainment': 2,
    'GradeLevelAttending': 2,
    'HouseholdType': 2,
    'IndustryRecode': 4,
    'MigrationPUMA': 5,
    'MigrationStateOrCountryRecode': 4,
    'OccupationRecode': 4,
    'PlaceOfBirthRecode': 3,
    'PlaceOfWorkPUMA': 5,
    'PlaceOfWorkStateOrForeignRecode': 3,
    'Relationship': 2,
    'State': 2,
    'TimeOfArrivalAtWork': 3,
    'TimeOfDepartureForWork': 3,
    'TransportationToWork': 2,
    'UnitsInStructure': 2,
    'VeteranPeriodOfService': 2,
    'WhenStructureBuilt': 2,
    'WorkExperienceOfHouseholderAndSpouse': 2,
    'WorkStatusOfHouseholderOrSpouseInFamilyHome': 2,
    'YearlyPropertyTaxes': 2
}


skip_map_columns = [
    'MigrationPUMA',
    'MigrationStateOrCountryRecode',
    'PlaceOfWorkPUMA'
]


custom_transform_columns = {
    'IncomeAdjustmentFactor': lambda x: x[:1]+'.'+x[1:],
    'RecordType': lambda x: x
}


def get_dict_year(year):
    if year > 2017:
        return str(year)
    if year > 2012:
        return '2013-2017'
    return None


def get_vals_dict_path(year):
    if year > 2017:
        return f'./compiled_data/dictionaries/{year}_values.csv'
    if year > 2012:
        return f'./compiled_data/dictionaries/2013-2017_values.csv'
    return None


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


def prefix_val(column_name, value):
    """
    column_name: string
    value: string
    returns prefixed value if rule defined, else returns value.
    """
    if column_name in zero_prefix_rules:
        req_len = zero_prefix_rules[column_name]
        prefix_len = req_len - len(value)
        return ('0'*prefix_len) + value
    return value


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

    original_file = \
        f'./data/dictionaries/PUMS_Data_Dictionary_{dict_year}.csv'
    vals_file = get_vals_dict_path(year)
    descriptions_file = f'./compiled_data/dictionaries/{dict_year}_descriptions.csv'
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

    # add custom pre-2016 language map values
    if dict_year == '2013-2017':
        print('append custom language values')
        manual_values = pd.read_csv(
            './data/dictionaries/custom_pre_2016_lanp.csv')
        defined_values = pd.read_csv(vals_file)
        merged_df = pd.concat(
            [manual_values, defined_values], ignore_index=True)
        merged_df.to_csv(vals_file)

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

    with open('./compiled_data/dictionaries/col_name_map.json') as json_file:
        name_map = json.load(json_file)

    def log_missing_cols():
        for name in data_dict['PUMS_COL_NAME']:
            if not name in name_map and name not in missing_cols:
                missing_cols.append(name)

        if missing_cols:
            with open('./compiled_data/missing_PUMS_Col_Names.csv', 'w') as f:
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
    dict_year = get_dict_year(year)

    with open(
        f'./compiled_data/dictionaries/{dict_year}_values.json', 'w'
    ) as output_file:
        json.dump(val_dict, output_file)


def prepare_recent_years():
    """
    Splits PUMS data dictionaries for recent years, and creates Values
    dictionary JSON files and types json file.
    """
    dictionaries = set([])

    for year in recent_years:
        if year > 2017:
            dictionaries.add(year)
        elif year > 2012:
            dictionaries.add(2013)

    for dictionary in dictionaries:
        split_original_dictionary(dictionary)
        create_values_json(dictionary)

    define_data_types()


def create_name_map_json():
    """
    Reads a static name map CSV and returns JSON format
    """
    col_name_map = pd.read_csv(
        './data/dictionaries/col_name_map.csv',
        index_col='PUMS_COL_NAME',
        usecols=['PUMS_COL_NAME', 'SQL_COL']
    ).to_dict()['SQL_COL']

    with open('./compiled_data/dictionaries/col_name_map.json', 'w') as output_file:
        json.dump(col_name_map, output_file)


def define_data_types():
    big_numbers = ['YearlyMobileHomeCost',
                   'MonthlyRent',
                   'MonthlyFirstMortgagePayment',
                   'SecondMortgagePayments',
                   'PropertyValue',
                   'FamilyIncome',
                   'HouseholdIncome',
                   'GrossRent',
                   'MonthlyOwnerCosts',
                   'UnadjustedInterestDividendNetRentalIncome',
                   'UnadjustedOtherIncomePastYear',
                   'UnadjustedRetirementIncomePastYear',
                   'UnadjustedSelfEmployedIncomePastYear',
                   'UnadjustedWageAndSalaryIncomePastYear',
                   'UnadjustedTotalPersonEarning',
                   'UnadjustedTotalPersonIncome']
    for year in recent_years:
        dict_path = get_vals_dict_path(year)
        vals_dict = pd.read_csv(dict_path)
        type_dict = {}
        nums = vals_dict.loc[vals_dict['DATA_TYPE'] == 'N']

        # defaults
        for i, row in nums.iterrows():
            type_dict[row['PUMS_COL_NAME']] = 'float16'

        # big numbers
        for col in big_numbers:
            type_dict[col] = 'float32'

        # static definitions
        type_dict['IncomeAdjustmentFactor'] = None

        with open(
            f'./compiled_data/types/{year}.json', 'w'
        ) as output_file:
            json.dump(type_dict, output_file)


# if __name__ == "__main__":
    # create PUMS_COL_NAME, Description csv
    # dictionary_name_desc = pd.read_csv(
    #     f'compiled_data/dictionaries/2013-2017_descriptions.csv',
    #     usecols=['PUMS_COL_NAME', 'DESCRIPTION']
    # )
    # dictionary_name_desc.to_csv('./2013-2017_name_description.csv')
    # print('\ndone.')
