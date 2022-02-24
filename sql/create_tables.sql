DROP TABLE IF EXISTS Person;
DROP TABLE IF EXISTS Household;
DROP TABLE IF EXISTS Finances;
DROP TABLE IF EXISTS Family;
DROP TABLE IF EXISTS Employment;
DROP TABLE IF EXISTS Education;
DROP TABLE IF EXISTS Healthcare;
DROP TABLE IF EXISTS Military;
DROP TABLE IF EXISTS MigrationMobility;
DROP TABLE IF EXISTS Biometrics;
DROP TABLE IF EXISTS Race;
DROP TABLE IF EXISTS NativityNationality;
DROP TABLE IF EXISTS Language;
DROP TABLE IF EXISTS Transportation;
DROP TABLE IF EXISTS Location;
DROP TABLE IF EXISTS HouseholdExpense;
DROP TABLE IF EXISTS HouseholdFinance;
DROP TABLE IF EXISTS HouseholdDemographics;
DROP TABLE IF EXISTS Utilities;
DROP TABLE IF EXISTS Rental;
DROP TABLE IF EXISTS UnitCharacteristics;
DROP TABLE IF EXISTS HouseholdTechnology;
DROP TABLE IF EXISTS Ownership;
DROP TABLE IF EXISTS Survey;
DROP SEQUENCE IF EXISTS Person_Seq;
CREATE SEQUENCE Person_Seq START WITH 1;
DROP SEQUENCE IF EXISTS Household_Seq;
CREATE SEQUENCE Household_Seq START WITH 1;
DROP SEQUENCE IF EXISTS Finances_Seq;
CREATE SEQUENCE Finances_Seq START WITH 1;
DROP SEQUENCE IF EXISTS Family_Seq;
CREATE SEQUENCE Family_Seq START WITH 1;
DROP SEQUENCE IF EXISTS Employment_Seq;
CREATE SEQUENCE Employment_Seq START WITH 1;
DROP SEQUENCE IF EXISTS Education_Seq;
CREATE SEQUENCE Education_Seq START WITH 1;
DROP SEQUENCE IF EXISTS Healthcare_Seq;
CREATE SEQUENCE Healthcare_Seq START WITH 1;
DROP SEQUENCE IF EXISTS Military_Seq;
CREATE SEQUENCE Military_Seq START WITH 1;
DROP SEQUENCE IF EXISTS MigrationMobility_Seq;
CREATE SEQUENCE MigrationMobility_Seq START WITH 1;
DROP SEQUENCE IF EXISTS Biometrics_Seq;
CREATE SEQUENCE Biometrics_Seq START WITH 1;
DROP SEQUENCE IF EXISTS Race_Seq;
CREATE SEQUENCE Race_Seq START WITH 1;
DROP SEQUENCE IF EXISTS NativityNationality_Seq;
CREATE SEQUENCE NativityNationality_Seq START WITH 1;
DROP SEQUENCE IF EXISTS Language_Seq;
CREATE SEQUENCE Language_Seq START WITH 1;
DROP SEQUENCE IF EXISTS Transportation_Seq;
CREATE SEQUENCE Transportation_Seq START WITH 1;
DROP SEQUENCE IF EXISTS Location_Seq;
CREATE SEQUENCE Location_Seq START WITH 1;
DROP SEQUENCE IF EXISTS HouseholdExpense_Seq;
CREATE SEQUENCE HouseholdExpense_Seq START WITH 1;
DROP SEQUENCE IF EXISTS HouseholdFinance_Seq;
CREATE SEQUENCE HouseholdFinance_Seq START WITH 1;
DROP SEQUENCE IF EXISTS HouseholdDemographics_Seq;
CREATE SEQUENCE HouseholdDemographics_Seq START WITH 1;
DROP SEQUENCE IF EXISTS Utilities_Seq;
CREATE SEQUENCE Utilities_Seq START WITH 1;
DROP SEQUENCE IF EXISTS Rental_Seq;
CREATE SEQUENCE Rental_Seq START WITH 1;
DROP SEQUENCE IF EXISTS UnitCharacteristics_Seq;
CREATE SEQUENCE UnitCharacteristics_Seq START WITH 1;
DROP SEQUENCE IF EXISTS HouseholdTechnology_Seq;
CREATE SEQUENCE HouseholdTechnology_Seq START WITH 1;
DROP SEQUENCE IF EXISTS Ownership_Seq;
CREATE SEQUENCE Ownership_Seq START WITH 1;
DROP SEQUENCE IF EXISTS Survey_Seq;
CREATE SEQUENCE Survey_Seq START WITH 1;


CREATE TABLE Finances (
	ID BIGINT PRIMARY KEY,
	IncomeAdjustmentFactor VARCHAR(255),
	UnadjustedInterestDividendNetRentalIncome VARCHAR(255),
	UnadjustedOtherIncomePastYear VARCHAR(255),
	UnadjustedPublicAssistanceIncomePastYear VARCHAR(255),
	UnadjustedRetirementIncomePastYear VARCHAR(255),
	UnadjustedSupplementarySecurityIncomePastYear VARCHAR(255),
	UnadjustedSocialSecurityIncomePastYear VARCHAR(255),
	UnadjustedWageAndSalaryIncomePastYear VARCHAR(255),
	UnadjustedSelfEmployedIncomePastYear VARCHAR(255),
	UnadjustedTotalPersonEarning VARCHAR(255),
	UnadjustedTotalPersonIncome VARCHAR(255),
	IncomeToPovertyRatioRecode VARCHAR(255)
);


CREATE TABLE Family (
	ID BIGINT PRIMARY KEY,
	GaveBirthPastYear VARCHAR(255),
	GrandparentsLivingWithGrandchildren VARCHAR(255),
	LengthOfTimeResponsibleForGrandchildren VARCHAR(255),
	GrandparentChildcare VARCHAR(255),
	MaritalStatus VARCHAR(255),
	DivorcedPastYear VARCHAR(255),
	MarriedPastYear VARCHAR(255),
	TimesMarried VARCHAR(255),
	WidowedPastYear VARCHAR(255),
	YearLastMarried VARCHAR(255),
	Relationship VARCHAR(255),
	EmploymentStatusOfParents VARCHAR(255),
	MarriedSpousePresence VARCHAR(255),
	OwnChild VARCHAR(255),
	PresenceAndAgeOfChildren VARCHAR(255),
	RelatedChild VARCHAR(255),
	SubfamilyNumber VARCHAR(255),
	SubfamilyRelationship VARCHAR(255)
);


CREATE TABLE Employment (
	ID BIGINT PRIMARY KEY,
	ClassOfWorker VARCHAR(255),
	WorkCommuteTime VARCHAR(255),
	TransportationToWork VARCHAR(255),
	TemporaryAbsenceFromWork VARCHAR(255),
	AvailableForWork VARCHAR(255),
	OnLayoffFromWork VARCHAR(255),
	LookingForWork VARCHAR(255),
	InformedOfRecall VARCHAR(255),
	UnadjustedWageAndSalaryIncomePastYear VARCHAR(255),
	UnadjustedSelfEmployedIncomePastYear VARCHAR(255),
	AvgHoursWorkedPerWeek VARCHAR(255),
	LastWorkedWhen VARCHAR(255),
	WeeksWorkedPastYear VARCHAR(255),
	WorkedLastWeek VARCHAR(255),
	EmploymentStatusRecode VARCHAR(255),
	IndustryRecode VARCHAR(255),
	TimeOfArrivalAtWork VARCHAR(255),
	TimeOfDepartureForWork VARCHAR(255),
	IndustryClassificationRecode VARCHAR(255),
	OccupationRecode VARCHAR(255),
	PlaceOfWorkPUMA VARCHAR(255),
	StandardOccupationalClassification VARCHAR(255)
);


CREATE TABLE Education (
	ID BIGINT PRIMARY KEY,
	SchoolEnrollment VARCHAR(255),
	GradeLevelAttending VARCHAR(255),
	EducationalAttainment VARCHAR(255),
	FieldOfDegreeRecode1 VARCHAR(255),
	FieldOfDegreeRecode2 VARCHAR(255),
	ScienceEngineeringDegreeField VARCHAR(255),
	ScienceEngineeringRelatedDegreeField VARCHAR(255)
);


CREATE TABLE Healthcare (
	ID BIGINT PRIMARY KEY,
	SelfCareDifficulty VARCHAR(255),
	HearingDifficulty VARCHAR(255),
	VisionDifficulty VARCHAR(255),
	IndependentLivingDifficulty VARCHAR(255),
	AmbulatoryDifficulty VARCHAR(255),
	CognitiveDifficulty VARCHAR(255),
	InsuranceThroughEmployer VARCHAR(255),
	InsurancePrivateDirectPurchase VARCHAR(255),
	MedicareCoverageSeniorOrDisability VARCHAR(255),
	GovernmentMedicalAssistance VARCHAR(255),
	TricareCoverage VARCHAR(255),
	VeteransAffairs VARCHAR(255),
	IndianHealthService VARCHAR(255),
	DisabilityRecode VARCHAR(255),
	HealthInsuranceCoverageRecode VARCHAR(255),
	PrivateHealthInsuranceCoverageRecode VARCHAR(255),
	PublicHealthCoverageRecode VARCHAR(255),
	MedicareCoverageEdit VARCHAR(255),
	MedicaidCoverageEdit VARCHAR(255),
	TricareCoverageEdit VARCHAR(255),
	SubsidizedMarketplaceCoverage VARCHAR(255)
);


CREATE TABLE Military (
	ID BIGINT PRIMARY KEY,
	VeteranServiceDisabilityRatingPercentage VARCHAR(255),
	VeteranServiceDisabilityRatingCheckbox VARCHAR(255),
	TricareCoverage VARCHAR(255),
	VeteransAffairs VARCHAR(255),
	MilitaryService VARCHAR(255),
	ServedSeptember2001OrLater VARCHAR(255),
	ServedAugust1990ToAugust2001 VARCHAR(255),
	ServedMay1975ToJuly1990 VARCHAR(255),
	ServedVietnamEra VARCHAR(255),
	ServedFebruary1955ToJuly1964 VARCHAR(255),
	ServedKoreanWar VARCHAR(255),
	ServedJanuary1947ToJune1950 VARCHAR(255),
	ServedWorldWarII VARCHAR(255),
	ServedNovember1941OrEarlier VARCHAR(255),
	TricareCoverageEdit VARCHAR(255)
);


CREATE TABLE MigrationMobility (
	ID BIGINT PRIMARY KEY,
	HouseholdMobilityStatus VARCHAR(255),
	MigrationPUMA VARCHAR(255),
	MigrationStateOrCountryRecode VARCHAR(255)
);


CREATE TABLE Biometrics (
	ID BIGINT PRIMARY KEY,
	PersonWeight VARCHAR(255),
	Age VARCHAR(255),
	Sex VARCHAR(255),
	QuarterOfBirth VARCHAR(255)
);


CREATE TABLE Race (
	ID BIGINT PRIMARY KEY,
	DetailedRaceRecode1 VARCHAR(255),
	DetailedRaceRecode2 VARCHAR(255),
	DetailedRaceRecode3 VARCHAR(255),
	RaceAmericanIndianOrAlaskaNativeRecode VARCHAR(255),
	RaceAsianRecode VARCHAR(255),
	RaceBlackOrAfricanAmericanRecode VARCHAR(255),
	RaceNativeHawaiianRecode VARCHAR(255),
	NumberOfMajorRaceGroupsRepresentedRecode VARCHAR(255),
	RaceOtherPacificIslanderRecode VARCHAR(255),
	RaceOtherRecode VARCHAR(255),
	RaceWhiteRecode VARCHAR(255)
);


CREATE TABLE NativityNationality (
	ID BIGINT PRIMARY KEY,
	Citizenship VARCHAR(255),
	WriteInNaturalizationYear VARCHAR(255),
	YearOfEntry VARCHAR(255),
	AncestryRecode VARCHAR(255),
	DetailedAncestryRecode1 VARCHAR(255),
	DetailedAncestryRecode2 VARCHAR(255),
	DecadeOfEntry VARCHAR(255),
	DetailedHispanicOriginRecode VARCHAR(255),
	Nativity VARCHAR(255),
	NativityOfParent VARCHAR(255),
	PlaceOfBirthRecode VARCHAR(255),
	WorldAreaOfBirth VARCHAR(255)
);


CREATE TABLE Language (
	ID BIGINT PRIMARY KEY,
	SpokenEnglishAbility VARCHAR(255),
	NonEnglishLanguage VARCHAR(255),
	LanguageSpokenAtHome VARCHAR(255)
);


CREATE TABLE Transportation (
	ID BIGINT PRIMARY KEY,
	WorkCommuteTime VARCHAR(255),
	TransportationToWork VARCHAR(255),
	NumberOfVehiclesDriven VARCHAR(255),
	TimeOfArrivalAtWork VARCHAR(255),
	TimeOfDepartureForWork VARCHAR(255)
);


CREATE TABLE Location (
	ID BIGINT PRIMARY KEY,
	Division VARCHAR(255),
	PUMSAreaCode VARCHAR(255),
	Region VARCHAR(255),
	State VARCHAR(255)
);


CREATE TABLE HouseholdExpense (
	ID BIGINT PRIMARY KEY,
	AdjustedMonthlyCondoFee VARCHAR(255),
	AdjustedMonthlyElectricCost VARCHAR(255),
	YearlyFuelCost VARCHAR(255),
	MonthlyGasCost VARCHAR(255),
	YearlyFireHazardFloodInsurance VARCHAR(255),
	YearlyMobileHomeCost VARCHAR(255),
	FirstMortgagePaymentPlusInsurance VARCHAR(255),
	MonthlyFirstMortgagePayment VARCHAR(255),
	FirstMortgagePaymentPlusRealEstateTax VARCHAR(255),
	MonthlyRent VARCHAR(255),
	SecondMortgagePayments VARCHAR(255),
	YearlyWaterCost VARCHAR(255),
	GrossRent VARCHAR(255),
	GrossRentPercentageOfIncome VARCHAR(255),
	MonthlyOwnerCostsAsPercentageOfHouseholdIncomePastYear VARCHAR(255),
	MonthlyOwnerCosts VARCHAR(255),
	YearlyPropertyTaxes VARCHAR(255)
);


CREATE TABLE HouseholdFinance (
	ID BIGINT PRIMARY KEY,
	HousingAdjustmentFactor VARCHAR(255),
	IncomeAdjustmentFactor VARCHAR(255),
	AgricultureYearlySales VARCHAR(255),
	PropertyValue VARCHAR(255)
);


CREATE TABLE HouseholdDemographics (
	ID BIGINT PRIMARY KEY,
	NumberOfPersonsInUnit VARCHAR(255),
	Tenure VARCHAR(255),
	VehiclesAvailable VARCHAR(255),
	FamilyTypeAndEmploymentStatus VARCHAR(255),
	FamilyIncome VARCHAR(255),
	FamilyPresenceAndAgeOfChildren VARCHAR(255),
	HouseholdLanguage VARCHAR(255),
	HouseholdFamilyType VARCHAR(255),
	HouseholdIncome VARCHAR(255),
	HouseholdWithGrandparentsAndChildren VARCHAR(255),
	PresenceAndChildrenAge VARCHAR(255),
	OwnChildrenAgeAndPresence VARCHAR(255),
	RelatedChildrenAgeAndPresence VARCHAR(255),
	LimitedEnglishHousehold VARCHAR(255),
	MultigenerationalHousehold VARCHAR(255),
	WhenMovedIntoHome VARCHAR(255),
	NumberOwnChildrenHouseholdUnweighted VARCHAR(255),
	NumberPersonsFamilyUnweighted VARCHAR(255),
	NoParentGrandparentHeadedHome VARCHAR(255),
	NonrelativeInHome VARCHAR(255),
	NumberRelatedChildrenInHomeUnweighted VARCHAR(255),
	UnmarriedPartnerHousehold VARCHAR(255),
	PresenceOfSubfamiliesInHome VARCHAR(255),
	PresenceOfPersons18OrYoungerInHomeUnweighted VARCHAR(255),
	PresenceOfPersons60YearsOrOlderInHomeUnweighted VARCHAR(255),
	PresenceOfPersons65YearsOrOlderInHomeUnweighted VARCHAR(255),
	SameSexMarriedCoupleHouseholds VARCHAR(255),
	YearlyWorkersInFamily VARCHAR(255),
	WorkExperienceOfHouseholderAndSpouse VARCHAR(255),
	WorkStatusOfHouseholderOrSpouseInFamilyHome VARCHAR(255),
	DetailedHouseholdLanguage VARCHAR(255),
	CoupleType VARCHAR(255),
	HouseholdType VARCHAR(255),
	YearlyFoodStamp VARCHAR(255)
);


CREATE TABLE Utilities (
	ID BIGINT PRIMARY KEY,
	InternetAccess VARCHAR(255),
	CellularDataPlan VARCHAR(255),
	DialUpService VARCHAR(255),
	AdjustedMonthlyElectricCost VARCHAR(255),
	YearlyFuelCost VARCHAR(255),
	MonthlyGasCost VARCHAR(255),
	HouseHeatingFuel VARCHAR(255),
	OtherInternet VARCHAR(255),
	SatelliteInternet VARCHAR(255),
	TelephoneService VARCHAR(255),
	YearlyWaterCost VARCHAR(255)
);


CREATE TABLE Rental (
	ID BIGINT PRIMARY KEY,
	MealsIncludedInRent VARCHAR(255),
	MonthlyRent VARCHAR(255),
	GrossRent VARCHAR(255),
	SpecifiedRentalUnit VARCHAR(255)
);


CREATE TABLE UnitCharacteristics (
	ID BIGINT PRIMARY KEY,
	UnitType VARCHAR(255),
	LotSize VARCHAR(255),
	NumberOfBedrooms VARCHAR(255),
	BusinessOnProperty VARCHAR(255),
	NumberOfRooms VARCHAR(255),
	TubOrShower VARCHAR(255),
	Refrigerator VARCHAR(255),
	HotAndColdRunningWater VARCHAR(255),
	SinkWithFaucet VARCHAR(255),
	Stove VARCHAR(255),
	VacancyStatus VARCHAR(255),
	WhenStructureBuilt VARCHAR(255),
	CompleteKitchenFacilities VARCHAR(255),
	CompletePlumbingFacilities VARCHAR(255)
);


CREATE TABLE HouseholdTechnology (
	ID BIGINT PRIMARY KEY,
	OtherComputerEquipment VARCHAR(255),
	InternetAccess VARCHAR(255),
	CellularDataPlan VARCHAR(255),
	DialUpService VARCHAR(255),
	LaptopOrDesktop VARCHAR(255),
	OtherInternet VARCHAR(255),
	SatelliteInternet VARCHAR(255),
	TelephoneService VARCHAR(255),
	HighSpeedInternet VARCHAR(255),
	Smartphone VARCHAR(255)
);


CREATE TABLE Ownership (
	ID BIGINT PRIMARY KEY,
	FirstMortgageStatus VARCHAR(255),
	SecondMortgagePayments VARCHAR(255),
	MonthlyOwnerCostsAsPercentageOfHouseholdIncomePastYear VARCHAR(255),
	MonthlyOwnerCosts VARCHAR(255),
	SecondMortgageLoanStatus VARCHAR(255),
	SpecifiedOwnerUnit VARCHAR(255)
);


CREATE TABLE Survey (
	ID BIGINT PRIMARY KEY,
	SurveyYear VARCHAR(255)
);


CREATE TABLE Person (
	ID BIGINT PRIMARY KEY,
	SerialNumber VARCHAR(255),
	PersonNumber VARCHAR(255),
	Finances_ID BIGINT,
	Family_ID BIGINT,
	Employment_ID BIGINT,
	Education_ID BIGINT,
	Healthcare_ID BIGINT,
	Military_ID BIGINT,
	MigrationMobility_ID BIGINT,
	Race_ID BIGINT,
	NativityNationality_ID BIGINT,
	Biometrics_ID BIGINT,
	Transportation_ID BIGINT,
	Language_ID BIGINT,
	Location_ID BIGINT,
	Survey_ID BIGINT,
	CONSTRAINT FK_Person_Finances
	FOREIGN KEY (Finances_ID) REFERENCES Finances(ID),
	CONSTRAINT FK_Person_Family
	FOREIGN KEY (Family_ID) REFERENCES Family(ID),
	CONSTRAINT FK_Person_Employment
	FOREIGN KEY (Employment_ID) REFERENCES Employment(ID),
	CONSTRAINT FK_Person_Education
	FOREIGN KEY (Education_ID) REFERENCES Education(ID),
	CONSTRAINT FK_Person_Healthcare
	FOREIGN KEY (Healthcare_ID) REFERENCES Healthcare(ID),
	CONSTRAINT FK_Person_Military
	FOREIGN KEY (Military_ID) REFERENCES Military(ID),
	CONSTRAINT FK_Person_MigrationMobility
	FOREIGN KEY (MigrationMobility_ID) REFERENCES MigrationMobility(ID),
	CONSTRAINT FK_Person_Race
	FOREIGN KEY (Race_ID) REFERENCES Race(ID),
	CONSTRAINT FK_Person_NativityNationality
	FOREIGN KEY (NativityNationality_ID) REFERENCES NativityNationality(ID),
	CONSTRAINT FK_Person_Biometrics
	FOREIGN KEY (Biometrics_ID) REFERENCES Biometrics(ID),
	CONSTRAINT FK_Person_Transportation
	FOREIGN KEY (Transportation_ID) REFERENCES Transportation(ID),
	CONSTRAINT FK_Person_Language
	FOREIGN KEY (Language_ID) REFERENCES Language(ID),
	CONSTRAINT FK_Person_Location
	FOREIGN KEY (Location_ID) REFERENCES Location(ID),
	CONSTRAINT FK_Person_Survey
	FOREIGN KEY (Survey_ID) REFERENCES Survey(ID),
);


CREATE TABLE Household (
	ID BIGINT PRIMARY KEY,
	SerialNumber VARCHAR(255),
	HouseholdExpense_ID BIGINT,
	HouseholdFinance_ID BIGINT,
	HouseholdDemographics_ID BIGINT,
	Utilities_ID BIGINT,
	Rental_ID BIGINT,
	UnitCharacteristics_ID BIGINT,
	HouseholdTechnology_ID BIGINT,
	Ownership_ID BIGINT,
	Location_ID BIGINT,
	Survey_ID BIGINT,
	CONSTRAINT FK_Household_HouseholdExpense
	FOREIGN KEY (HouseholdExpense_ID) REFERENCES HouseholdExpense(ID),
	CONSTRAINT FK_Household_HouseholdFinance
	FOREIGN KEY (HouseholdFinance_ID) REFERENCES HouseholdFinance(ID),
	CONSTRAINT FK_Household_HouseholdDemographics
	FOREIGN KEY (HouseholdDemographics_ID) REFERENCES HouseholdDemographics(ID),
	CONSTRAINT FK_Household_Utilities
	FOREIGN KEY (Utilities_ID) REFERENCES Utilities(ID),
	CONSTRAINT FK_Household_Rental
	FOREIGN KEY (Rental_ID) REFERENCES Rental(ID),
	CONSTRAINT FK_Household_UnitCharacteristics
	FOREIGN KEY (UnitCharacteristics_ID) REFERENCES UnitCharacteristics(ID),
	CONSTRAINT FK_Household_HouseholdTechnology
	FOREIGN KEY (HouseholdTechnology_ID) REFERENCES HouseholdTechnology(ID),
	CONSTRAINT FK_Household_Ownership
	FOREIGN KEY (Ownership_ID) REFERENCES Ownership(ID),
	CONSTRAINT FK_Household_Location
	FOREIGN KEY (Location_ID) REFERENCES Location(ID),
	CONSTRAINT FK_Household_Survey
	FOREIGN KEY (Survey_ID) REFERENCES Survey(ID),
);
