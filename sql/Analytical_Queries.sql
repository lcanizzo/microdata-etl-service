-- Get average rent for all years by state
SELECT 
	State,
	AVG(CAST(FilteredExpenses.MonthlyRent AS DECIMAL(8, 2))) AS Avg_Rent
FROM Location
JOIN Household ON Household.Location_ID = Location.ID
JOIN (
	SELECT MonthlyRent, ID FROM HouseholdExpense WHERE MonthlyRent <> 'None'
) AS FilteredExpenses ON Household.HouseholdExpense_ID = FilteredExpenses.ID
GROUP BY State
ORDER BY Avg_Rent DESC;







-- Get average rent by year by state
SELECT 
	State,
	SurveyYear,
	AVG(CAST(FilteredExpenses.MonthlyRent AS DECIMAL(8, 2))) AS Avg_Rent
FROM Location
JOIN Household ON Household.Location_ID = Location.ID
JOIN Survey ON Household.Survey_ID = Survey.ID
JOIN (
	SELECT MonthlyRent, ID FROM HouseholdExpense WHERE MonthlyRent <> 'None'
) AS FilteredExpenses ON Household.HouseholdExpense_ID = FilteredExpenses.ID
GROUP BY State, SurveyYear
ORDER BY Avg_Rent, SurveyYear;




-- Average age of newlyweb by state
SELECT
	State,
	AVG(CAST(Age AS DECIMAL(3))) AS Avg_Age
FROM (
	SELECT ID FROM Family WHERE MarriedPastYear = 'Yes'
) AS NewlyWed
JOIN PERSON ON Person.Family_ID = NewlyWed.ID
JOIN Location ON PERSON.Location_ID = Location.ID
JOIN Biometrics ON Person.Biometrics_ID =Biometrics.ID
GROUP BY State
ORDER BY Avg_Age;



-- Average age of newlyweb by state by year
SELECT
	State,
	SurveyYear,
	AVG(CAST(Age AS DECIMAL(3))) AS Avg_Age
FROM (
	SELECT ID FROM Family WHERE MarriedPastYear = 'Yes'
) AS NewlyWed
JOIN PERSON ON Person.Family_ID = NewlyWed.ID
JOIN Location ON PERSON.Location_ID = Location.ID
JOIN Survey ON PERSON.Survey_ID = Survey.ID
JOIN Biometrics ON Person.Biometrics_ID =Biometrics.ID
GROUP BY State, SurveyYear
ORDER BY Avg_Age;




-- Most common language spoken at home
SELECT 
	TOP 15
	ScrubbedLang.LanguageSpokenAtHome,
	COUNT(ScrubbedLang.LanguageSpokenAtHome) AS Lang_Count
FROM (
	SELECT ID, LanguageSpokenAtHome FROM Language WHERE LanguageSpokenAtHome <> 'None'
) AS ScrubbedLang
GROUP BY ScrubbedLang.LanguageSpokenAtHome
ORDER BY Lang_Count DESC;