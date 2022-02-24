

CREATE OR ALTER PROCEDURE AddFinances
	@ID VARCHAR(255),
	@IncomeAdjustmentFactor VARCHAR(255),
	@UnadjustedInterestDividendNetRentalIncome VARCHAR(255),
	@UnadjustedOtherIncomePastYear VARCHAR(255),
	@UnadjustedPublicAssistanceIncomePastYear VARCHAR(255),
	@UnadjustedRetirementIncomePastYear VARCHAR(255),
	@UnadjustedSupplementarySecurityIncomePastYear VARCHAR(255),
	@UnadjustedSocialSecurityIncomePastYear VARCHAR(255),
	@UnadjustedWageAndSalaryIncomePastYear VARCHAR(255),
	@UnadjustedSelfEmployedIncomePastYear VARCHAR(255),
	@UnadjustedTotalPersonEarning VARCHAR(255),
	@UnadjustedTotalPersonIncome VARCHAR(255),
	@IncomeToPovertyRatioRecode VARCHAR(255)
AS
BEGIN
	INSERT INTO Finances(ID,IncomeAdjustmentFactor,UnadjustedInterestDividendNetRentalIncome,UnadjustedOtherIncomePastYear,UnadjustedPublicAssistanceIncomePastYear,UnadjustedRetirementIncomePastYear,UnadjustedSupplementarySecurityIncomePastYear,UnadjustedSocialSecurityIncomePastYear,UnadjustedWageAndSalaryIncomePastYear,UnadjustedSelfEmployedIncomePastYear,UnadjustedTotalPersonEarning,UnadjustedTotalPersonIncome,IncomeToPovertyRatioRecode)
	VALUES(
		@ID,
		@IncomeAdjustmentFactor,
		@UnadjustedInterestDividendNetRentalIncome,
		@UnadjustedOtherIncomePastYear,
		@UnadjustedPublicAssistanceIncomePastYear,
		@UnadjustedRetirementIncomePastYear,
		@UnadjustedSupplementarySecurityIncomePastYear,
		@UnadjustedSocialSecurityIncomePastYear,
		@UnadjustedWageAndSalaryIncomePastYear,
		@UnadjustedSelfEmployedIncomePastYear,
		@UnadjustedTotalPersonEarning,
		@UnadjustedTotalPersonIncome,
		@IncomeToPovertyRatioRecode
	);
END;


CREATE OR ALTER PROCEDURE AddFamily
	@ID VARCHAR(255),
	@GaveBirthPastYear VARCHAR(255),
	@GrandparentsLivingWithGrandchildren VARCHAR(255),
	@LengthOfTimeResponsibleForGrandchildren VARCHAR(255),
	@GrandparentChildcare VARCHAR(255),
	@MaritalStatus VARCHAR(255),
	@DivorcedPastYear VARCHAR(255),
	@MarriedPastYear VARCHAR(255),
	@TimesMarried VARCHAR(255),
	@WidowedPastYear VARCHAR(255),
	@YearLastMarried VARCHAR(255),
	@Relationship VARCHAR(255),
	@EmploymentStatusOfParents VARCHAR(255),
	@MarriedSpousePresence VARCHAR(255),
	@OwnChild VARCHAR(255),
	@PresenceAndAgeOfChildren VARCHAR(255),
	@RelatedChild VARCHAR(255),
	@SubfamilyNumber VARCHAR(255),
	@SubfamilyRelationship VARCHAR(255)
AS
BEGIN
	INSERT INTO Family(ID,GaveBirthPastYear,GrandparentsLivingWithGrandchildren,LengthOfTimeResponsibleForGrandchildren,GrandparentChildcare,MaritalStatus,DivorcedPastYear,MarriedPastYear,TimesMarried,WidowedPastYear,YearLastMarried,Relationship,EmploymentStatusOfParents,MarriedSpousePresence,OwnChild,PresenceAndAgeOfChildren,RelatedChild,SubfamilyNumber,SubfamilyRelationship)
	VALUES(
		@ID,
		@GaveBirthPastYear,
		@GrandparentsLivingWithGrandchildren,
		@LengthOfTimeResponsibleForGrandchildren,
		@GrandparentChildcare,
		@MaritalStatus,
		@DivorcedPastYear,
		@MarriedPastYear,
		@TimesMarried,
		@WidowedPastYear,
		@YearLastMarried,
		@Relationship,
		@EmploymentStatusOfParents,
		@MarriedSpousePresence,
		@OwnChild,
		@PresenceAndAgeOfChildren,
		@RelatedChild,
		@SubfamilyNumber,
		@SubfamilyRelationship
	);
END;


CREATE OR ALTER PROCEDURE AddEmployment
	@ID VARCHAR(255),
	@ClassOfWorker VARCHAR(255),
	@WorkCommuteTime VARCHAR(255),
	@TransportationToWork VARCHAR(255),
	@TemporaryAbsenceFromWork VARCHAR(255),
	@AvailableForWork VARCHAR(255),
	@OnLayoffFromWork VARCHAR(255),
	@LookingForWork VARCHAR(255),
	@InformedOfRecall VARCHAR(255),
	@UnadjustedWageAndSalaryIncomePastYear VARCHAR(255),
	@UnadjustedSelfEmployedIncomePastYear VARCHAR(255),
	@AvgHoursWorkedPerWeek VARCHAR(255),
	@LastWorkedWhen VARCHAR(255),
	@WeeksWorkedPastYear VARCHAR(255),
	@WorkedLastWeek VARCHAR(255),
	@EmploymentStatusRecode VARCHAR(255),
	@IndustryRecode VARCHAR(255),
	@TimeOfArrivalAtWork VARCHAR(255),
	@TimeOfDepartureForWork VARCHAR(255),
	@IndustryClassificationRecode VARCHAR(255),
	@OccupationRecode VARCHAR(255),
	@PlaceOfWorkPUMA VARCHAR(255),
	@StandardOccupationalClassification VARCHAR(255)
AS
BEGIN
	INSERT INTO Employment(ID,ClassOfWorker,WorkCommuteTime,TransportationToWork,TemporaryAbsenceFromWork,AvailableForWork,OnLayoffFromWork,LookingForWork,InformedOfRecall,UnadjustedWageAndSalaryIncomePastYear,UnadjustedSelfEmployedIncomePastYear,AvgHoursWorkedPerWeek,LastWorkedWhen,WeeksWorkedPastYear,WorkedLastWeek,EmploymentStatusRecode,IndustryRecode,TimeOfArrivalAtWork,TimeOfDepartureForWork,IndustryClassificationRecode,OccupationRecode,PlaceOfWorkPUMA,StandardOccupationalClassification)
	VALUES(
		@ID,
		@ClassOfWorker,
		@WorkCommuteTime,
		@TransportationToWork,
		@TemporaryAbsenceFromWork,
		@AvailableForWork,
		@OnLayoffFromWork,
		@LookingForWork,
		@InformedOfRecall,
		@UnadjustedWageAndSalaryIncomePastYear,
		@UnadjustedSelfEmployedIncomePastYear,
		@AvgHoursWorkedPerWeek,
		@LastWorkedWhen,
		@WeeksWorkedPastYear,
		@WorkedLastWeek,
		@EmploymentStatusRecode,
		@IndustryRecode,
		@TimeOfArrivalAtWork,
		@TimeOfDepartureForWork,
		@IndustryClassificationRecode,
		@OccupationRecode,
		@PlaceOfWorkPUMA,
		@StandardOccupationalClassification
	);
END;


CREATE OR ALTER PROCEDURE AddEducation
	@ID VARCHAR(255),
	@SchoolEnrollment VARCHAR(255),
	@GradeLevelAttending VARCHAR(255),
	@EducationalAttainment VARCHAR(255),
	@FieldOfDegreeRecode1 VARCHAR(255),
	@FieldOfDegreeRecode2 VARCHAR(255),
	@ScienceEngineeringDegreeField VARCHAR(255),
	@ScienceEngineeringRelatedDegreeField VARCHAR(255)
AS
BEGIN
	INSERT INTO Education(ID,SchoolEnrollment,GradeLevelAttending,EducationalAttainment,FieldOfDegreeRecode1,FieldOfDegreeRecode2,ScienceEngineeringDegreeField,ScienceEngineeringRelatedDegreeField)
	VALUES(
		@ID,
		@SchoolEnrollment,
		@GradeLevelAttending,
		@EducationalAttainment,
		@FieldOfDegreeRecode1,
		@FieldOfDegreeRecode2,
		@ScienceEngineeringDegreeField,
		@ScienceEngineeringRelatedDegreeField
	);
END;


CREATE OR ALTER PROCEDURE AddHealthcare
	@ID VARCHAR(255),
	@SelfCareDifficulty VARCHAR(255),
	@HearingDifficulty VARCHAR(255),
	@VisionDifficulty VARCHAR(255),
	@IndependentLivingDifficulty VARCHAR(255),
	@AmbulatoryDifficulty VARCHAR(255),
	@CognitiveDifficulty VARCHAR(255),
	@InsuranceThroughEmployer VARCHAR(255),
	@InsurancePrivateDirectPurchase VARCHAR(255),
	@MedicareCoverageSeniorOrDisability VARCHAR(255),
	@GovernmentMedicalAssistance VARCHAR(255),
	@TricareCoverage VARCHAR(255),
	@VeteransAffairs VARCHAR(255),
	@IndianHealthService VARCHAR(255),
	@DisabilityRecode VARCHAR(255),
	@HealthInsuranceCoverageRecode VARCHAR(255),
	@PrivateHealthInsuranceCoverageRecode VARCHAR(255),
	@PublicHealthCoverageRecode VARCHAR(255),
	@MedicareCoverageEdit VARCHAR(255),
	@MedicaidCoverageEdit VARCHAR(255),
	@TricareCoverageEdit VARCHAR(255),
	@SubsidizedMarketplaceCoverage VARCHAR(255)
AS
BEGIN
	INSERT INTO Healthcare(ID,SelfCareDifficulty,HearingDifficulty,VisionDifficulty,IndependentLivingDifficulty,AmbulatoryDifficulty,CognitiveDifficulty,InsuranceThroughEmployer,InsurancePrivateDirectPurchase,MedicareCoverageSeniorOrDisability,GovernmentMedicalAssistance,TricareCoverage,VeteransAffairs,IndianHealthService,DisabilityRecode,HealthInsuranceCoverageRecode,PrivateHealthInsuranceCoverageRecode,PublicHealthCoverageRecode,MedicareCoverageEdit,MedicaidCoverageEdit,TricareCoverageEdit,SubsidizedMarketplaceCoverage)
	VALUES(
		@ID,
		@SelfCareDifficulty,
		@HearingDifficulty,
		@VisionDifficulty,
		@IndependentLivingDifficulty,
		@AmbulatoryDifficulty,
		@CognitiveDifficulty,
		@InsuranceThroughEmployer,
		@InsurancePrivateDirectPurchase,
		@MedicareCoverageSeniorOrDisability,
		@GovernmentMedicalAssistance,
		@TricareCoverage,
		@VeteransAffairs,
		@IndianHealthService,
		@DisabilityRecode,
		@HealthInsuranceCoverageRecode,
		@PrivateHealthInsuranceCoverageRecode,
		@PublicHealthCoverageRecode,
		@MedicareCoverageEdit,
		@MedicaidCoverageEdit,
		@TricareCoverageEdit,
		@SubsidizedMarketplaceCoverage
	);
END;


CREATE OR ALTER PROCEDURE AddMilitary
	@ID VARCHAR(255),
	@VeteranServiceDisabilityRatingPercentage VARCHAR(255),
	@VeteranServiceDisabilityRatingCheckbox VARCHAR(255),
	@TricareCoverage VARCHAR(255),
	@VeteransAffairs VARCHAR(255),
	@MilitaryService VARCHAR(255),
	@ServedSeptember2001OrLater VARCHAR(255),
	@ServedAugust1990ToAugust2001 VARCHAR(255),
	@ServedMay1975ToJuly1990 VARCHAR(255),
	@ServedVietnamEra VARCHAR(255),
	@ServedFebruary1955ToJuly1964 VARCHAR(255),
	@ServedKoreanWar VARCHAR(255),
	@ServedJanuary1947ToJune1950 VARCHAR(255),
	@ServedWorldWarII VARCHAR(255),
	@ServedNovember1941OrEarlier VARCHAR(255),
	@TricareCoverageEdit VARCHAR(255)
AS
BEGIN
	INSERT INTO Military(ID,VeteranServiceDisabilityRatingPercentage,VeteranServiceDisabilityRatingCheckbox,TricareCoverage,VeteransAffairs,MilitaryService,ServedSeptember2001OrLater,ServedAugust1990ToAugust2001,ServedMay1975ToJuly1990,ServedVietnamEra,ServedFebruary1955ToJuly1964,ServedKoreanWar,ServedJanuary1947ToJune1950,ServedWorldWarII,ServedNovember1941OrEarlier,TricareCoverageEdit)
	VALUES(
		@ID,
		@VeteranServiceDisabilityRatingPercentage,
		@VeteranServiceDisabilityRatingCheckbox,
		@TricareCoverage,
		@VeteransAffairs,
		@MilitaryService,
		@ServedSeptember2001OrLater,
		@ServedAugust1990ToAugust2001,
		@ServedMay1975ToJuly1990,
		@ServedVietnamEra,
		@ServedFebruary1955ToJuly1964,
		@ServedKoreanWar,
		@ServedJanuary1947ToJune1950,
		@ServedWorldWarII,
		@ServedNovember1941OrEarlier,
		@TricareCoverageEdit
	);
END;


CREATE OR ALTER PROCEDURE AddMigrationMobility
	@ID VARCHAR(255),
	@HouseholdMobilityStatus VARCHAR(255),
	@MigrationPUMA VARCHAR(255),
	@MigrationStateOrCountryRecode VARCHAR(255)
AS
BEGIN
	INSERT INTO MigrationMobility(ID,HouseholdMobilityStatus,MigrationPUMA,MigrationStateOrCountryRecode)
	VALUES(
		@ID,
		@HouseholdMobilityStatus,
		@MigrationPUMA,
		@MigrationStateOrCountryRecode
	);
END;


CREATE OR ALTER PROCEDURE AddBiometrics
	@ID VARCHAR(255),
	@PersonWeight VARCHAR(255),
	@Age VARCHAR(255),
	@Sex VARCHAR(255),
	@QuarterOfBirth VARCHAR(255)
AS
BEGIN
	INSERT INTO Biometrics(ID,PersonWeight,Age,Sex,QuarterOfBirth)
	VALUES(
		@ID,
		@PersonWeight,
		@Age,
		@Sex,
		@QuarterOfBirth
	);
END;


CREATE OR ALTER PROCEDURE AddRace
	@ID VARCHAR(255),
	@DetailedRaceRecode1 VARCHAR(255),
	@DetailedRaceRecode2 VARCHAR(255),
	@DetailedRaceRecode3 VARCHAR(255),
	@RaceAmericanIndianOrAlaskaNativeRecode VARCHAR(255),
	@RaceAsianRecode VARCHAR(255),
	@RaceBlackOrAfricanAmericanRecode VARCHAR(255),
	@RaceNativeHawaiianRecode VARCHAR(255),
	@NumberOfMajorRaceGroupsRepresentedRecode VARCHAR(255),
	@RaceOtherPacificIslanderRecode VARCHAR(255),
	@RaceOtherRecode VARCHAR(255),
	@RaceWhiteRecode VARCHAR(255)
AS
BEGIN
	INSERT INTO Race(ID,DetailedRaceRecode1,DetailedRaceRecode2,DetailedRaceRecode3,RaceAmericanIndianOrAlaskaNativeRecode,RaceAsianRecode,RaceBlackOrAfricanAmericanRecode,RaceNativeHawaiianRecode,NumberOfMajorRaceGroupsRepresentedRecode,RaceOtherPacificIslanderRecode,RaceOtherRecode,RaceWhiteRecode)
	VALUES(
		@ID,
		@DetailedRaceRecode1,
		@DetailedRaceRecode2,
		@DetailedRaceRecode3,
		@RaceAmericanIndianOrAlaskaNativeRecode,
		@RaceAsianRecode,
		@RaceBlackOrAfricanAmericanRecode,
		@RaceNativeHawaiianRecode,
		@NumberOfMajorRaceGroupsRepresentedRecode,
		@RaceOtherPacificIslanderRecode,
		@RaceOtherRecode,
		@RaceWhiteRecode
	);
END;


CREATE OR ALTER PROCEDURE AddNativityNationality
	@ID VARCHAR(255),
	@Citizenship VARCHAR(255),
	@WriteInNaturalizationYear VARCHAR(255),
	@YearOfEntry VARCHAR(255),
	@AncestryRecode VARCHAR(255),
	@DetailedAncestryRecode1 VARCHAR(255),
	@DetailedAncestryRecode2 VARCHAR(255),
	@DecadeOfEntry VARCHAR(255),
	@DetailedHispanicOriginRecode VARCHAR(255),
	@Nativity VARCHAR(255),
	@NativityOfParent VARCHAR(255),
	@PlaceOfBirthRecode VARCHAR(255),
	@WorldAreaOfBirth VARCHAR(255)
AS
BEGIN
	INSERT INTO NativityNationality(ID,Citizenship,WriteInNaturalizationYear,YearOfEntry,AncestryRecode,DetailedAncestryRecode1,DetailedAncestryRecode2,DecadeOfEntry,DetailedHispanicOriginRecode,Nativity,NativityOfParent,PlaceOfBirthRecode,WorldAreaOfBirth)
	VALUES(
		@ID,
		@Citizenship,
		@WriteInNaturalizationYear,
		@YearOfEntry,
		@AncestryRecode,
		@DetailedAncestryRecode1,
		@DetailedAncestryRecode2,
		@DecadeOfEntry,
		@DetailedHispanicOriginRecode,
		@Nativity,
		@NativityOfParent,
		@PlaceOfBirthRecode,
		@WorldAreaOfBirth
	);
END;


CREATE OR ALTER PROCEDURE AddLanguage
	@ID VARCHAR(255),
	@SpokenEnglishAbility VARCHAR(255),
	@NonEnglishLanguage VARCHAR(255),
	@LanguageSpokenAtHome VARCHAR(255)
AS
BEGIN
	INSERT INTO Language(ID,SpokenEnglishAbility,NonEnglishLanguage,LanguageSpokenAtHome)
	VALUES(
		@ID,
		@SpokenEnglishAbility,
		@NonEnglishLanguage,
		@LanguageSpokenAtHome
	);
END;


CREATE OR ALTER PROCEDURE AddTransportation
	@ID VARCHAR(255),
	@WorkCommuteTime VARCHAR(255),
	@TransportationToWork VARCHAR(255),
	@NumberOfVehiclesDriven VARCHAR(255),
	@TimeOfArrivalAtWork VARCHAR(255),
	@TimeOfDepartureForWork VARCHAR(255)
AS
BEGIN
	INSERT INTO Transportation(ID,WorkCommuteTime,TransportationToWork,NumberOfVehiclesDriven,TimeOfArrivalAtWork,TimeOfDepartureForWork)
	VALUES(
		@ID,
		@WorkCommuteTime,
		@TransportationToWork,
		@NumberOfVehiclesDriven,
		@TimeOfArrivalAtWork,
		@TimeOfDepartureForWork
	);
END;


CREATE OR ALTER PROCEDURE AddLocation
	@ID VARCHAR(255),
	@Division VARCHAR(255),
	@PUMSAreaCode VARCHAR(255),
	@Region VARCHAR(255),
	@State VARCHAR(255)
AS
BEGIN
	INSERT INTO Location(ID,Division,PUMSAreaCode,Region,State)
	VALUES(
		@ID,
		@Division,
		@PUMSAreaCode,
		@Region,
		@State
	);
END;


CREATE OR ALTER PROCEDURE AddHouseholdExpense
	@ID VARCHAR(255),
	@AdjustedMonthlyCondoFee VARCHAR(255),
	@AdjustedMonthlyElectricCost VARCHAR(255),
	@YearlyFuelCost VARCHAR(255),
	@MonthlyGasCost VARCHAR(255),
	@YearlyFireHazardFloodInsurance VARCHAR(255),
	@YearlyMobileHomeCost VARCHAR(255),
	@FirstMortgagePaymentPlusInsurance VARCHAR(255),
	@MonthlyFirstMortgagePayment VARCHAR(255),
	@FirstMortgagePaymentPlusRealEstateTax VARCHAR(255),
	@MonthlyRent VARCHAR(255),
	@SecondMortgagePayments VARCHAR(255),
	@YearlyWaterCost VARCHAR(255),
	@GrossRent VARCHAR(255),
	@GrossRentPercentageOfIncome VARCHAR(255),
	@MonthlyOwnerCostsAsPercentageOfHouseholdIncomePastYear VARCHAR(255),
	@MonthlyOwnerCosts VARCHAR(255),
	@YearlyPropertyTaxes VARCHAR(255)
AS
BEGIN
	INSERT INTO HouseholdExpense(ID,AdjustedMonthlyCondoFee,AdjustedMonthlyElectricCost,YearlyFuelCost,MonthlyGasCost,YearlyFireHazardFloodInsurance,YearlyMobileHomeCost,FirstMortgagePaymentPlusInsurance,MonthlyFirstMortgagePayment,FirstMortgagePaymentPlusRealEstateTax,MonthlyRent,SecondMortgagePayments,YearlyWaterCost,GrossRent,GrossRentPercentageOfIncome,MonthlyOwnerCostsAsPercentageOfHouseholdIncomePastYear,MonthlyOwnerCosts,YearlyPropertyTaxes)
	VALUES(
		@ID,
		@AdjustedMonthlyCondoFee,
		@AdjustedMonthlyElectricCost,
		@YearlyFuelCost,
		@MonthlyGasCost,
		@YearlyFireHazardFloodInsurance,
		@YearlyMobileHomeCost,
		@FirstMortgagePaymentPlusInsurance,
		@MonthlyFirstMortgagePayment,
		@FirstMortgagePaymentPlusRealEstateTax,
		@MonthlyRent,
		@SecondMortgagePayments,
		@YearlyWaterCost,
		@GrossRent,
		@GrossRentPercentageOfIncome,
		@MonthlyOwnerCostsAsPercentageOfHouseholdIncomePastYear,
		@MonthlyOwnerCosts,
		@YearlyPropertyTaxes
	);
END;


CREATE OR ALTER PROCEDURE AddHouseholdFinance
	@ID VARCHAR(255),
	@HousingAdjustmentFactor VARCHAR(255),
	@IncomeAdjustmentFactor VARCHAR(255),
	@AgricultureYearlySales VARCHAR(255),
	@PropertyValue VARCHAR(255)
AS
BEGIN
	INSERT INTO HouseholdFinance(ID,HousingAdjustmentFactor,IncomeAdjustmentFactor,AgricultureYearlySales,PropertyValue)
	VALUES(
		@ID,
		@HousingAdjustmentFactor,
		@IncomeAdjustmentFactor,
		@AgricultureYearlySales,
		@PropertyValue
	);
END;


CREATE OR ALTER PROCEDURE AddHouseholdDemographics
	@ID VARCHAR(255),
	@NumberOfPersonsInUnit VARCHAR(255),
	@Tenure VARCHAR(255),
	@VehiclesAvailable VARCHAR(255),
	@FamilyTypeAndEmploymentStatus VARCHAR(255),
	@FamilyIncome VARCHAR(255),
	@FamilyPresenceAndAgeOfChildren VARCHAR(255),
	@HouseholdLanguage VARCHAR(255),
	@HouseholdFamilyType VARCHAR(255),
	@HouseholdIncome VARCHAR(255),
	@HouseholdWithGrandparentsAndChildren VARCHAR(255),
	@PresenceAndChildrenAge VARCHAR(255),
	@OwnChildrenAgeAndPresence VARCHAR(255),
	@RelatedChildrenAgeAndPresence VARCHAR(255),
	@LimitedEnglishHousehold VARCHAR(255),
	@MultigenerationalHousehold VARCHAR(255),
	@WhenMovedIntoHome VARCHAR(255),
	@NumberOwnChildrenHouseholdUnweighted VARCHAR(255),
	@NumberPersonsFamilyUnweighted VARCHAR(255),
	@NoParentGrandparentHeadedHome VARCHAR(255),
	@NonrelativeInHome VARCHAR(255),
	@NumberRelatedChildrenInHomeUnweighted VARCHAR(255),
	@UnmarriedPartnerHousehold VARCHAR(255),
	@PresenceOfSubfamiliesInHome VARCHAR(255),
	@PresenceOfPersons18OrYoungerInHomeUnweighted VARCHAR(255),
	@PresenceOfPersons60YearsOrOlderInHomeUnweighted VARCHAR(255),
	@PresenceOfPersons65YearsOrOlderInHomeUnweighted VARCHAR(255),
	@SameSexMarriedCoupleHouseholds VARCHAR(255),
	@YearlyWorkersInFamily VARCHAR(255),
	@WorkExperienceOfHouseholderAndSpouse VARCHAR(255),
	@WorkStatusOfHouseholderOrSpouseInFamilyHome VARCHAR(255),
	@DetailedHouseholdLanguage VARCHAR(255),
	@CoupleType VARCHAR(255),
	@HouseholdType VARCHAR(255),
	@YearlyFoodStamp VARCHAR(255)
AS
BEGIN
	INSERT INTO HouseholdDemographics(ID,NumberOfPersonsInUnit,Tenure,VehiclesAvailable,FamilyTypeAndEmploymentStatus,FamilyIncome,FamilyPresenceAndAgeOfChildren,HouseholdLanguage,HouseholdFamilyType,HouseholdIncome,HouseholdWithGrandparentsAndChildren,PresenceAndChildrenAge,OwnChildrenAgeAndPresence,RelatedChildrenAgeAndPresence,LimitedEnglishHousehold,MultigenerationalHousehold,WhenMovedIntoHome,NumberOwnChildrenHouseholdUnweighted,NumberPersonsFamilyUnweighted,NoParentGrandparentHeadedHome,NonrelativeInHome,NumberRelatedChildrenInHomeUnweighted,UnmarriedPartnerHousehold,PresenceOfSubfamiliesInHome,PresenceOfPersons18OrYoungerInHomeUnweighted,PresenceOfPersons60YearsOrOlderInHomeUnweighted,PresenceOfPersons65YearsOrOlderInHomeUnweighted,SameSexMarriedCoupleHouseholds,YearlyWorkersInFamily,WorkExperienceOfHouseholderAndSpouse,WorkStatusOfHouseholderOrSpouseInFamilyHome,DetailedHouseholdLanguage,CoupleType,HouseholdType,YearlyFoodStamp)
	VALUES(
		@ID,
		@NumberOfPersonsInUnit,
		@Tenure,
		@VehiclesAvailable,
		@FamilyTypeAndEmploymentStatus,
		@FamilyIncome,
		@FamilyPresenceAndAgeOfChildren,
		@HouseholdLanguage,
		@HouseholdFamilyType,
		@HouseholdIncome,
		@HouseholdWithGrandparentsAndChildren,
		@PresenceAndChildrenAge,
		@OwnChildrenAgeAndPresence,
		@RelatedChildrenAgeAndPresence,
		@LimitedEnglishHousehold,
		@MultigenerationalHousehold,
		@WhenMovedIntoHome,
		@NumberOwnChildrenHouseholdUnweighted,
		@NumberPersonsFamilyUnweighted,
		@NoParentGrandparentHeadedHome,
		@NonrelativeInHome,
		@NumberRelatedChildrenInHomeUnweighted,
		@UnmarriedPartnerHousehold,
		@PresenceOfSubfamiliesInHome,
		@PresenceOfPersons18OrYoungerInHomeUnweighted,
		@PresenceOfPersons60YearsOrOlderInHomeUnweighted,
		@PresenceOfPersons65YearsOrOlderInHomeUnweighted,
		@SameSexMarriedCoupleHouseholds,
		@YearlyWorkersInFamily,
		@WorkExperienceOfHouseholderAndSpouse,
		@WorkStatusOfHouseholderOrSpouseInFamilyHome,
		@DetailedHouseholdLanguage,
		@CoupleType,
		@HouseholdType,
		@YearlyFoodStamp
	);
END;


CREATE OR ALTER PROCEDURE AddUtilities
	@ID VARCHAR(255),
	@InternetAccess VARCHAR(255),
	@CellularDataPlan VARCHAR(255),
	@DialUpService VARCHAR(255),
	@AdjustedMonthlyElectricCost VARCHAR(255),
	@YearlyFuelCost VARCHAR(255),
	@MonthlyGasCost VARCHAR(255),
	@HouseHeatingFuel VARCHAR(255),
	@OtherInternet VARCHAR(255),
	@SatelliteInternet VARCHAR(255),
	@TelephoneService VARCHAR(255),
	@YearlyWaterCost VARCHAR(255)
AS
BEGIN
	INSERT INTO Utilities(ID,InternetAccess,CellularDataPlan,DialUpService,AdjustedMonthlyElectricCost,YearlyFuelCost,MonthlyGasCost,HouseHeatingFuel,OtherInternet,SatelliteInternet,TelephoneService,YearlyWaterCost)
	VALUES(
		@ID,
		@InternetAccess,
		@CellularDataPlan,
		@DialUpService,
		@AdjustedMonthlyElectricCost,
		@YearlyFuelCost,
		@MonthlyGasCost,
		@HouseHeatingFuel,
		@OtherInternet,
		@SatelliteInternet,
		@TelephoneService,
		@YearlyWaterCost
	);
END;


CREATE OR ALTER PROCEDURE AddRental
	@ID VARCHAR(255),
	@MealsIncludedInRent VARCHAR(255),
	@MonthlyRent VARCHAR(255),
	@GrossRent VARCHAR(255),
	@SpecifiedRentalUnit VARCHAR(255)
AS
BEGIN
	INSERT INTO Rental(ID,MealsIncludedInRent,MonthlyRent,GrossRent,SpecifiedRentalUnit)
	VALUES(
		@ID,
		@MealsIncludedInRent,
		@MonthlyRent,
		@GrossRent,
		@SpecifiedRentalUnit
	);
END;


CREATE OR ALTER PROCEDURE AddUnitCharacteristics
	@ID VARCHAR(255),
	@UnitType VARCHAR(255),
	@LotSize VARCHAR(255),
	@NumberOfBedrooms VARCHAR(255),
	@BusinessOnProperty VARCHAR(255),
	@NumberOfRooms VARCHAR(255),
	@TubOrShower VARCHAR(255),
	@Refrigerator VARCHAR(255),
	@HotAndColdRunningWater VARCHAR(255),
	@SinkWithFaucet VARCHAR(255),
	@Stove VARCHAR(255),
	@VacancyStatus VARCHAR(255),
	@WhenStructureBuilt VARCHAR(255),
	@CompleteKitchenFacilities VARCHAR(255),
	@CompletePlumbingFacilities VARCHAR(255)
AS
BEGIN
	INSERT INTO UnitCharacteristics(ID,UnitType,LotSize,NumberOfBedrooms,BusinessOnProperty,NumberOfRooms,TubOrShower,Refrigerator,HotAndColdRunningWater,SinkWithFaucet,Stove,VacancyStatus,WhenStructureBuilt,CompleteKitchenFacilities,CompletePlumbingFacilities)
	VALUES(
		@ID,
		@UnitType,
		@LotSize,
		@NumberOfBedrooms,
		@BusinessOnProperty,
		@NumberOfRooms,
		@TubOrShower,
		@Refrigerator,
		@HotAndColdRunningWater,
		@SinkWithFaucet,
		@Stove,
		@VacancyStatus,
		@WhenStructureBuilt,
		@CompleteKitchenFacilities,
		@CompletePlumbingFacilities
	);
END;


CREATE OR ALTER PROCEDURE AddHouseholdTechnology
	@ID VARCHAR(255),
	@OtherComputerEquipment VARCHAR(255),
	@InternetAccess VARCHAR(255),
	@CellularDataPlan VARCHAR(255),
	@DialUpService VARCHAR(255),
	@LaptopOrDesktop VARCHAR(255),
	@OtherInternet VARCHAR(255),
	@SatelliteInternet VARCHAR(255),
	@TelephoneService VARCHAR(255),
	@HighSpeedInternet VARCHAR(255),
	@Smartphone VARCHAR(255)
AS
BEGIN
	INSERT INTO HouseholdTechnology(ID,OtherComputerEquipment,InternetAccess,CellularDataPlan,DialUpService,LaptopOrDesktop,OtherInternet,SatelliteInternet,TelephoneService,HighSpeedInternet,Smartphone)
	VALUES(
		@ID,
		@OtherComputerEquipment,
		@InternetAccess,
		@CellularDataPlan,
		@DialUpService,
		@LaptopOrDesktop,
		@OtherInternet,
		@SatelliteInternet,
		@TelephoneService,
		@HighSpeedInternet,
		@Smartphone
	);
END;


CREATE OR ALTER PROCEDURE AddOwnership
	@ID VARCHAR(255),
	@FirstMortgageStatus VARCHAR(255),
	@SecondMortgagePayments VARCHAR(255),
	@MonthlyOwnerCostsAsPercentageOfHouseholdIncomePastYear VARCHAR(255),
	@MonthlyOwnerCosts VARCHAR(255),
	@SecondMortgageLoanStatus VARCHAR(255),
	@SpecifiedOwnerUnit VARCHAR(255)
AS
BEGIN
	INSERT INTO Ownership(ID,FirstMortgageStatus,SecondMortgagePayments,MonthlyOwnerCostsAsPercentageOfHouseholdIncomePastYear,MonthlyOwnerCosts,SecondMortgageLoanStatus,SpecifiedOwnerUnit)
	VALUES(
		@ID,
		@FirstMortgageStatus,
		@SecondMortgagePayments,
		@MonthlyOwnerCostsAsPercentageOfHouseholdIncomePastYear,
		@MonthlyOwnerCosts,
		@SecondMortgageLoanStatus,
		@SpecifiedOwnerUnit
	);
END;


CREATE OR ALTER PROCEDURE AddSurvey
	@ID VARCHAR(255),
	@SurveyYear VARCHAR(255)
AS
BEGIN
	INSERT INTO Survey(ID,SurveyYear)
	VALUES(
		@ID,
		@SurveyYear
	);
END;


CREATE OR ALTER PROCEDURE AddPerson
	@ID VARCHAR(255),
	@PUMSAreaCode VARCHAR(255),
	@State VARCHAR(255),
	@IncomeAdjustmentFactor VARCHAR(255),
	@PersonWeight VARCHAR(255),
	@Age VARCHAR(255),
	@Citizenship VARCHAR(255),
	@WriteInNaturalizationYear VARCHAR(255),
	@ClassOfWorker VARCHAR(255),
	@SelfCareDifficulty VARCHAR(255),
	@HearingDifficulty VARCHAR(255),
	@VisionDifficulty VARCHAR(255),
	@IndependentLivingDifficulty VARCHAR(255),
	@AmbulatoryDifficulty VARCHAR(255),
	@VeteranServiceDisabilityRatingPercentage VARCHAR(255),
	@VeteranServiceDisabilityRatingCheckbox VARCHAR(255),
	@CognitiveDifficulty VARCHAR(255),
	@SpokenEnglishAbility VARCHAR(255),
	@GaveBirthPastYear VARCHAR(255),
	@GrandparentsLivingWithGrandchildren VARCHAR(255),
	@LengthOfTimeResponsibleForGrandchildren VARCHAR(255),
	@GrandparentChildcare VARCHAR(255),
	@InsuranceThroughEmployer VARCHAR(255),
	@InsurancePrivateDirectPurchase VARCHAR(255),
	@MedicareCoverageSeniorOrDisability VARCHAR(255),
	@GovernmentMedicalAssistance VARCHAR(255),
	@TricareCoverage VARCHAR(255),
	@VeteransAffairs VARCHAR(255),
	@IndianHealthService VARCHAR(255),
	@UnadjustedInterestDividendNetRentalIncome VARCHAR(255),
	@WorkCommuteTime VARCHAR(255),
	@TransportationToWork VARCHAR(255),
	@NonEnglishLanguage VARCHAR(255),
	@MaritalStatus VARCHAR(255),
	@DivorcedPastYear VARCHAR(255),
	@MarriedPastYear VARCHAR(255),
	@TimesMarried VARCHAR(255),
	@WidowedPastYear VARCHAR(255),
	@YearLastMarried VARCHAR(255),
	@HouseholdMobilityStatus VARCHAR(255),
	@MilitaryService VARCHAR(255),
	@ServedSeptember2001OrLater VARCHAR(255),
	@ServedAugust1990ToAugust2001 VARCHAR(255),
	@ServedMay1975ToJuly1990 VARCHAR(255),
	@ServedVietnamEra VARCHAR(255),
	@ServedFebruary1955ToJuly1964 VARCHAR(255),
	@ServedKoreanWar VARCHAR(255),
	@ServedJanuary1947ToJune1950 VARCHAR(255),
	@ServedWorldWarII VARCHAR(255),
	@ServedNovember1941OrEarlier VARCHAR(255),
	@TemporaryAbsenceFromWork VARCHAR(255),
	@AvailableForWork VARCHAR(255),
	@OnLayoffFromWork VARCHAR(255),
	@LookingForWork VARCHAR(255),
	@InformedOfRecall VARCHAR(255),
	@UnadjustedOtherIncomePastYear VARCHAR(255),
	@UnadjustedPublicAssistanceIncomePastYear VARCHAR(255),
	@Relationship VARCHAR(255),
	@UnadjustedRetirementIncomePastYear VARCHAR(255),
	@SchoolEnrollment VARCHAR(255),
	@GradeLevelAttending VARCHAR(255),
	@EducationalAttainment VARCHAR(255),
	@UnadjustedSelfEmployedIncomePastYear VARCHAR(255),
	@Sex VARCHAR(255),
	@UnadjustedSupplementarySecurityIncomePastYear VARCHAR(255),
	@UnadjustedSocialSecurityIncomePastYear VARCHAR(255),
	@UnadjustedWageAndSalaryIncomePastYear VARCHAR(255),
	@AvgHoursWorkedPerWeek VARCHAR(255),
	@LastWorkedWhen VARCHAR(255),
	@WeeksWorkedPastYear VARCHAR(255),
	@WorkedLastWeek VARCHAR(255),
	@YearOfEntry VARCHAR(255),
	@AncestryRecode VARCHAR(255),
	@DetailedAncestryRecode1 VARCHAR(255),
	@DetailedAncestryRecode2 VARCHAR(255),
	@DecadeOfEntry VARCHAR(255),
	@DisabilityRecode VARCHAR(255),
	@NumberOfVehiclesDriven VARCHAR(255),
	@EmploymentStatusOfParents VARCHAR(255),
	@EmploymentStatusRecode VARCHAR(255),
	@FieldOfDegreeRecode1 VARCHAR(255),
	@FieldOfDegreeRecode2 VARCHAR(255),
	@HealthInsuranceCoverageRecode VARCHAR(255),
	@DetailedHispanicOriginRecode VARCHAR(255),
	@IndustryRecode VARCHAR(255),
	@TimeOfArrivalAtWork VARCHAR(255),
	@TimeOfDepartureForWork VARCHAR(255),
	@LanguageSpokenAtHome VARCHAR(255),
	@MigrationPUMA VARCHAR(255),
	@MigrationStateOrCountryRecode VARCHAR(255),
	@MarriedSpousePresence VARCHAR(255),
	@IndustryClassificationRecode VARCHAR(255),
	@Nativity VARCHAR(255),
	@NativityOfParent VARCHAR(255),
	@OwnChild VARCHAR(255),
	@OccupationRecode VARCHAR(255),
	@PresenceAndAgeOfChildren VARCHAR(255),
	@UnadjustedTotalPersonEarning VARCHAR(255),
	@UnadjustedTotalPersonIncome VARCHAR(255),
	@PlaceOfBirthRecode VARCHAR(255),
	@IncomeToPovertyRatioRecode VARCHAR(255),
	@PlaceOfWorkPUMA VARCHAR(255),
	@PrivateHealthInsuranceCoverageRecode VARCHAR(255),
	@PublicHealthCoverageRecode VARCHAR(255),
	@QuarterOfBirth VARCHAR(255),
	@DetailedRaceRecode1 VARCHAR(255),
	@DetailedRaceRecode2 VARCHAR(255),
	@DetailedRaceRecode3 VARCHAR(255),
	@RaceAmericanIndianOrAlaskaNativeRecode VARCHAR(255),
	@RaceAsianRecode VARCHAR(255),
	@RaceBlackOrAfricanAmericanRecode VARCHAR(255),
	@RaceNativeHawaiianRecode VARCHAR(255),
	@NumberOfMajorRaceGroupsRepresentedRecode VARCHAR(255),
	@RaceOtherPacificIslanderRecode VARCHAR(255),
	@RaceOtherRecode VARCHAR(255),
	@RaceWhiteRecode VARCHAR(255),
	@RelatedChild VARCHAR(255),
	@ScienceEngineeringDegreeField VARCHAR(255),
	@ScienceEngineeringRelatedDegreeField VARCHAR(255),
	@SubfamilyNumber VARCHAR(255),
	@SubfamilyRelationship VARCHAR(255),
	@StandardOccupationalClassification VARCHAR(255),
	@WorldAreaOfBirth VARCHAR(255),
	@MedicareCoverageEdit VARCHAR(255),
	@MedicaidCoverageEdit VARCHAR(255),
	@TricareCoverageEdit VARCHAR(255),
	@SurveyYear VARCHAR(255),
	@Division VARCHAR(255),
	@Region VARCHAR(255),
	@SubsidizedMarketplaceCoverage VARCHAR(255),
	@SerialNumber VARCHAR(255),
	@PersonNumber VARCHAR(255)
AS
DECLARE @current_Finances_seq INT = NEXT VALUE FOR Finances_Seq;
DECLARE @current_Family_seq INT = NEXT VALUE FOR Family_Seq;
DECLARE @current_Employment_seq INT = NEXT VALUE FOR Employment_Seq;
DECLARE @current_Education_seq INT = NEXT VALUE FOR Education_Seq;
DECLARE @current_Healthcare_seq INT = NEXT VALUE FOR Healthcare_Seq;
DECLARE @current_Military_seq INT = NEXT VALUE FOR Military_Seq;
DECLARE @current_MigrationMobility_seq INT = NEXT VALUE FOR MigrationMobility_Seq;
DECLARE @current_Race_seq INT = NEXT VALUE FOR Race_Seq;
DECLARE @current_NativityNationality_seq INT = NEXT VALUE FOR NativityNationality_Seq;
DECLARE @current_Biometrics_seq INT = NEXT VALUE FOR Biometrics_Seq;
DECLARE @current_Transportation_seq INT = NEXT VALUE FOR Transportation_Seq;
DECLARE @current_Language_seq INT = NEXT VALUE FOR Language_Seq;
DECLARE @current_Location_seq INT = NEXT VALUE FOR Location_Seq;
DECLARE @current_Survey_seq INT = NEXT VALUE FOR Survey_Seq;
BEGIN
	EXECUTE AddFinances @current_Finances_seq, @IncomeAdjustmentFactor, @UnadjustedInterestDividendNetRentalIncome, @UnadjustedOtherIncomePastYear, @UnadjustedPublicAssistanceIncomePastYear, @UnadjustedRetirementIncomePastYear, @UnadjustedSupplementarySecurityIncomePastYear, @UnadjustedSocialSecurityIncomePastYear, @UnadjustedWageAndSalaryIncomePastYear, @UnadjustedSelfEmployedIncomePastYear, @UnadjustedTotalPersonEarning, @UnadjustedTotalPersonIncome, @IncomeToPovertyRatioRecode;
	EXECUTE AddFamily @current_Family_seq, @GaveBirthPastYear, @GrandparentsLivingWithGrandchildren, @LengthOfTimeResponsibleForGrandchildren, @GrandparentChildcare, @MaritalStatus, @DivorcedPastYear, @MarriedPastYear, @TimesMarried, @WidowedPastYear, @YearLastMarried, @Relationship, @EmploymentStatusOfParents, @MarriedSpousePresence, @OwnChild, @PresenceAndAgeOfChildren, @RelatedChild, @SubfamilyNumber, @SubfamilyRelationship;
	EXECUTE AddEmployment @current_Employment_seq, @ClassOfWorker, @WorkCommuteTime, @TransportationToWork, @TemporaryAbsenceFromWork, @AvailableForWork, @OnLayoffFromWork, @LookingForWork, @InformedOfRecall, @UnadjustedWageAndSalaryIncomePastYear, @UnadjustedSelfEmployedIncomePastYear, @AvgHoursWorkedPerWeek, @LastWorkedWhen, @WeeksWorkedPastYear, @WorkedLastWeek, @EmploymentStatusRecode, @IndustryRecode, @TimeOfArrivalAtWork, @TimeOfDepartureForWork, @IndustryClassificationRecode, @OccupationRecode, @PlaceOfWorkPUMA, @StandardOccupationalClassification;
	EXECUTE AddEducation @current_Education_seq, @SchoolEnrollment, @GradeLevelAttending, @EducationalAttainment, @FieldOfDegreeRecode1, @FieldOfDegreeRecode2, @ScienceEngineeringDegreeField, @ScienceEngineeringRelatedDegreeField;
	EXECUTE AddHealthcare @current_Healthcare_seq, @SelfCareDifficulty, @HearingDifficulty, @VisionDifficulty, @IndependentLivingDifficulty, @AmbulatoryDifficulty, @CognitiveDifficulty, @InsuranceThroughEmployer, @InsurancePrivateDirectPurchase, @MedicareCoverageSeniorOrDisability, @GovernmentMedicalAssistance, @TricareCoverage, @VeteransAffairs, @IndianHealthService, @DisabilityRecode, @HealthInsuranceCoverageRecode, @PrivateHealthInsuranceCoverageRecode, @PublicHealthCoverageRecode, @MedicareCoverageEdit, @MedicaidCoverageEdit, @TricareCoverageEdit, @SubsidizedMarketplaceCoverage;
	EXECUTE AddMilitary @current_Military_seq, @VeteranServiceDisabilityRatingPercentage, @VeteranServiceDisabilityRatingCheckbox, @TricareCoverage, @VeteransAffairs, @MilitaryService, @ServedSeptember2001OrLater, @ServedAugust1990ToAugust2001, @ServedMay1975ToJuly1990, @ServedVietnamEra, @ServedFebruary1955ToJuly1964, @ServedKoreanWar, @ServedJanuary1947ToJune1950, @ServedWorldWarII, @ServedNovember1941OrEarlier, @TricareCoverageEdit;
	EXECUTE AddMigrationMobility @current_MigrationMobility_seq, @HouseholdMobilityStatus, @MigrationPUMA, @MigrationStateOrCountryRecode;
	EXECUTE AddRace @current_Race_seq, @DetailedRaceRecode1, @DetailedRaceRecode2, @DetailedRaceRecode3, @RaceAmericanIndianOrAlaskaNativeRecode, @RaceAsianRecode, @RaceBlackOrAfricanAmericanRecode, @RaceNativeHawaiianRecode, @NumberOfMajorRaceGroupsRepresentedRecode, @RaceOtherPacificIslanderRecode, @RaceOtherRecode, @RaceWhiteRecode;
	EXECUTE AddNativityNationality @current_NativityNationality_seq, @Citizenship, @WriteInNaturalizationYear, @YearOfEntry, @AncestryRecode, @DetailedAncestryRecode1, @DetailedAncestryRecode2, @DecadeOfEntry, @DetailedHispanicOriginRecode, @Nativity, @NativityOfParent, @PlaceOfBirthRecode, @WorldAreaOfBirth;
	EXECUTE AddBiometrics @current_Biometrics_seq, @PersonWeight, @Age, @Sex, @QuarterOfBirth;
	EXECUTE AddTransportation @current_Transportation_seq, @WorkCommuteTime, @TransportationToWork, @NumberOfVehiclesDriven, @TimeOfArrivalAtWork, @TimeOfDepartureForWork;
	EXECUTE AddLanguage @current_Language_seq, @SpokenEnglishAbility, @NonEnglishLanguage, @LanguageSpokenAtHome;
	EXECUTE AddLocation @current_Location_seq, @Division, @PUMSAreaCode, @Region, @State;
	EXECUTE AddSurvey @current_Survey_seq, @SurveyYear;
	INSERT INTO Person(ID,SerialNumber,PersonNumber,Finances_ID,Family_ID,Employment_ID,Education_ID,Healthcare_ID,Military_ID,MigrationMobility_ID,Race_ID,NativityNationality_ID,Biometrics_ID,Transportation_ID,Language_ID,Location_ID,Survey_ID)
	VALUES(
		@ID,
		@SerialNumber,
		@PersonNumber,
		@current_Finances_seq,
		@current_Family_seq,
		@current_Employment_seq,
		@current_Education_seq,
		@current_Healthcare_seq,
		@current_Military_seq,
		@current_MigrationMobility_seq,
		@current_Race_seq,
		@current_NativityNationality_seq,
		@current_Biometrics_seq,
		@current_Transportation_seq,
		@current_Language_seq,
		@current_Location_seq,
		@current_Survey_seq
	);
END;


CREATE OR ALTER PROCEDURE AddHousehold
	@ID VARCHAR(255),
	@Division VARCHAR(255),
	@PUMSAreaCode VARCHAR(255),
	@Region VARCHAR(255),
	@State VARCHAR(255),
	@HousingAdjustmentFactor VARCHAR(255),
	@IncomeAdjustmentFactor VARCHAR(255),
	@NumberOfPersonsInUnit VARCHAR(255),
	@UnitType VARCHAR(255),
	@InternetAccess VARCHAR(255),
	@LotSize VARCHAR(255),
	@AgricultureYearlySales VARCHAR(255),
	@TubOrShower VARCHAR(255),
	@NumberOfBedrooms VARCHAR(255),
	@CellularDataPlan VARCHAR(255),
	@BusinessOnProperty VARCHAR(255),
	@OtherComputerEquipment VARCHAR(255),
	@AdjustedMonthlyCondoFee VARCHAR(255),
	@DialUpService VARCHAR(255),
	@AdjustedMonthlyElectricCost VARCHAR(255),
	@YearlyFoodStamp VARCHAR(255),
	@YearlyFuelCost VARCHAR(255),
	@MonthlyGasCost VARCHAR(255),
	@HouseHeatingFuel VARCHAR(255),
	@YearlyFireHazardFloodInsurance VARCHAR(255),
	@LaptopOrDesktop VARCHAR(255),
	@YearlyMobileHomeCost VARCHAR(255),
	@FirstMortgagePaymentPlusInsurance VARCHAR(255),
	@MonthlyFirstMortgagePayment VARCHAR(255),
	@FirstMortgagePaymentPlusRealEstateTax VARCHAR(255),
	@FirstMortgageStatus VARCHAR(255),
	@OtherInternet VARCHAR(255),
	@Refrigerator VARCHAR(255),
	@NumberOfRooms VARCHAR(255),
	@MealsIncludedInRent VARCHAR(255),
	@MonthlyRent VARCHAR(255),
	@HotAndColdRunningWater VARCHAR(255),
	@SatelliteInternet VARCHAR(255),
	@SinkWithFaucet VARCHAR(255),
	@SecondMortgagePayments VARCHAR(255),
	@Stove VARCHAR(255),
	@TelephoneService VARCHAR(255),
	@Tenure VARCHAR(255),
	@VacancyStatus VARCHAR(255),
	@PropertyValue VARCHAR(255),
	@VehiclesAvailable VARCHAR(255),
	@YearlyWaterCost VARCHAR(255),
	@WhenStructureBuilt VARCHAR(255),
	@FamilyTypeAndEmploymentStatus VARCHAR(255),
	@FamilyIncome VARCHAR(255),
	@FamilyPresenceAndAgeOfChildren VARCHAR(255),
	@GrossRent VARCHAR(255),
	@GrossRentPercentageOfIncome VARCHAR(255),
	@HouseholdLanguage VARCHAR(255),
	@HouseholdFamilyType VARCHAR(255),
	@HouseholdIncome VARCHAR(255),
	@HouseholdWithGrandparentsAndChildren VARCHAR(255),
	@PresenceAndChildrenAge VARCHAR(255),
	@OwnChildrenAgeAndPresence VARCHAR(255),
	@RelatedChildrenAgeAndPresence VARCHAR(255),
	@CompleteKitchenFacilities VARCHAR(255),
	@LimitedEnglishHousehold VARCHAR(255),
	@MultigenerationalHousehold VARCHAR(255),
	@WhenMovedIntoHome VARCHAR(255),
	@NumberOwnChildrenHouseholdUnweighted VARCHAR(255),
	@NumberPersonsFamilyUnweighted VARCHAR(255),
	@NoParentGrandparentHeadedHome VARCHAR(255),
	@NonrelativeInHome VARCHAR(255),
	@NumberRelatedChildrenInHomeUnweighted VARCHAR(255),
	@MonthlyOwnerCostsAsPercentageOfHouseholdIncomePastYear VARCHAR(255),
	@CompletePlumbingFacilities VARCHAR(255),
	@UnmarriedPartnerHousehold VARCHAR(255),
	@PresenceOfSubfamiliesInHome VARCHAR(255),
	@PresenceOfPersons18OrYoungerInHomeUnweighted VARCHAR(255),
	@PresenceOfPersons60YearsOrOlderInHomeUnweighted VARCHAR(255),
	@PresenceOfPersons65YearsOrOlderInHomeUnweighted VARCHAR(255),
	@MonthlyOwnerCosts VARCHAR(255),
	@SecondMortgageLoanStatus VARCHAR(255),
	@SpecifiedRentalUnit VARCHAR(255),
	@SameSexMarriedCoupleHouseholds VARCHAR(255),
	@SpecifiedOwnerUnit VARCHAR(255),
	@YearlyPropertyTaxes VARCHAR(255),
	@YearlyWorkersInFamily VARCHAR(255),
	@WorkExperienceOfHouseholderAndSpouse VARCHAR(255),
	@WorkStatusOfHouseholderOrSpouseInFamilyHome VARCHAR(255),
	@SurveyYear VARCHAR(255),
	@HighSpeedInternet VARCHAR(255),
	@Smartphone VARCHAR(255),
	@DetailedHouseholdLanguage VARCHAR(255),
	@CoupleType VARCHAR(255),
	@HouseholdType VARCHAR(255),
	@SerialNumber VARCHAR(255)
AS
DECLARE @current_HouseholdExpense_seq INT = NEXT VALUE FOR HouseholdExpense_Seq;
DECLARE @current_HouseholdFinance_seq INT = NEXT VALUE FOR HouseholdFinance_Seq;
DECLARE @current_HouseholdDemographics_seq INT = NEXT VALUE FOR HouseholdDemographics_Seq;
DECLARE @current_Utilities_seq INT = NEXT VALUE FOR Utilities_Seq;
DECLARE @current_Rental_seq INT = NEXT VALUE FOR Rental_Seq;
DECLARE @current_UnitCharacteristics_seq INT = NEXT VALUE FOR UnitCharacteristics_Seq;
DECLARE @current_HouseholdTechnology_seq INT = NEXT VALUE FOR HouseholdTechnology_Seq;
DECLARE @current_Ownership_seq INT = NEXT VALUE FOR Ownership_Seq;
DECLARE @current_Location_seq INT = NEXT VALUE FOR Location_Seq;
DECLARE @current_Survey_seq INT = NEXT VALUE FOR Survey_Seq;
BEGIN
	EXECUTE AddHouseholdExpense @current_HouseholdExpense_seq, @AdjustedMonthlyCondoFee, @AdjustedMonthlyElectricCost, @YearlyFuelCost, @MonthlyGasCost, @YearlyFireHazardFloodInsurance, @YearlyMobileHomeCost, @FirstMortgagePaymentPlusInsurance, @MonthlyFirstMortgagePayment, @FirstMortgagePaymentPlusRealEstateTax, @MonthlyRent, @SecondMortgagePayments, @YearlyWaterCost, @GrossRent, @GrossRentPercentageOfIncome, @MonthlyOwnerCostsAsPercentageOfHouseholdIncomePastYear, @MonthlyOwnerCosts, @YearlyPropertyTaxes;
	EXECUTE AddHouseholdFinance @current_HouseholdFinance_seq, @HousingAdjustmentFactor, @IncomeAdjustmentFactor, @AgricultureYearlySales, @PropertyValue;
	EXECUTE AddHouseholdDemographics @current_HouseholdDemographics_seq, @NumberOfPersonsInUnit, @Tenure, @VehiclesAvailable, @FamilyTypeAndEmploymentStatus, @FamilyIncome, @FamilyPresenceAndAgeOfChildren, @HouseholdLanguage, @HouseholdFamilyType, @HouseholdIncome, @HouseholdWithGrandparentsAndChildren, @PresenceAndChildrenAge, @OwnChildrenAgeAndPresence, @RelatedChildrenAgeAndPresence, @LimitedEnglishHousehold, @MultigenerationalHousehold, @WhenMovedIntoHome, @NumberOwnChildrenHouseholdUnweighted, @NumberPersonsFamilyUnweighted, @NoParentGrandparentHeadedHome, @NonrelativeInHome, @NumberRelatedChildrenInHomeUnweighted, @UnmarriedPartnerHousehold, @PresenceOfSubfamiliesInHome, @PresenceOfPersons18OrYoungerInHomeUnweighted, @PresenceOfPersons60YearsOrOlderInHomeUnweighted, @PresenceOfPersons65YearsOrOlderInHomeUnweighted, @SameSexMarriedCoupleHouseholds, @YearlyWorkersInFamily, @WorkExperienceOfHouseholderAndSpouse, @WorkStatusOfHouseholderOrSpouseInFamilyHome, @DetailedHouseholdLanguage, @CoupleType, @HouseholdType, @YearlyFoodStamp;
	EXECUTE AddUtilities @current_Utilities_seq, @InternetAccess, @CellularDataPlan, @DialUpService, @AdjustedMonthlyElectricCost, @YearlyFuelCost, @MonthlyGasCost, @HouseHeatingFuel, @OtherInternet, @SatelliteInternet, @TelephoneService, @YearlyWaterCost;
	EXECUTE AddRental @current_Rental_seq, @MealsIncludedInRent, @MonthlyRent, @GrossRent, @SpecifiedRentalUnit;
	EXECUTE AddUnitCharacteristics @current_UnitCharacteristics_seq, @UnitType, @LotSize, @NumberOfBedrooms, @BusinessOnProperty, @NumberOfRooms, @TubOrShower, @Refrigerator, @HotAndColdRunningWater, @SinkWithFaucet, @Stove, @VacancyStatus, @WhenStructureBuilt, @CompleteKitchenFacilities, @CompletePlumbingFacilities;
	EXECUTE AddHouseholdTechnology @current_HouseholdTechnology_seq, @OtherComputerEquipment, @InternetAccess, @CellularDataPlan, @DialUpService, @LaptopOrDesktop, @OtherInternet, @SatelliteInternet, @TelephoneService, @HighSpeedInternet, @Smartphone;
	EXECUTE AddOwnership @current_Ownership_seq, @FirstMortgageStatus, @SecondMortgagePayments, @MonthlyOwnerCostsAsPercentageOfHouseholdIncomePastYear, @MonthlyOwnerCosts, @SecondMortgageLoanStatus, @SpecifiedOwnerUnit;
	EXECUTE AddLocation @current_Location_seq, @Division, @PUMSAreaCode, @Region, @State;
	EXECUTE AddSurvey @current_Survey_seq, @SurveyYear;
	INSERT INTO Household(ID,SerialNumber,HouseholdExpense_ID,HouseholdFinance_ID,HouseholdDemographics_ID,Utilities_ID,Rental_ID,UnitCharacteristics_ID,HouseholdTechnology_ID,Ownership_ID,Location_ID,Survey_ID)
	VALUES(
		@ID,
		@SerialNumber,
		@current_HouseholdExpense_seq,
		@current_HouseholdFinance_seq,
		@current_HouseholdDemographics_seq,
		@current_Utilities_seq,
		@current_Rental_seq,
		@current_UnitCharacteristics_seq,
		@current_HouseholdTechnology_seq,
		@current_Ownership_seq,
		@current_Location_seq,
		@current_Survey_seq
	);
END;
