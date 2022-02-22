# %%
import pandas as pd
import json
from _constants import recent_years
from dictionary_utils import get_vals_dict_path

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


print('\ndone')
