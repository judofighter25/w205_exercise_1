       
      DROP TABLE IF EXISTS hospitals;  
      CREATE EXTERNAL TABLE hospitals (ProviderID int, Hospital String, Address String, City String, State String, ZIP_Code int, County_Name String,  
      Phone_Number int, Hospital_Type String, Hospital_Ownership String, Emergency_Services String)
      ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
      STORED AS TEXTFILE
      LOCATION '/user/w205/maxshen/hospital_compare/hospital';
      LOAD DATA INPATH '/user/w205/maxshen/hive/hospitals.csv'
      OVERWRITE INTO TABLE hospitals;

      DROP TABLE IF EXISTS effective_care; 
      CREATE EXTERNAL TABLE effective_care (ProviderID int, HospitalName String, Address String, City String, State String, ZIP_Code bigint, County_Name String, Phone_Number String, Condition String, MeasureID String, MeasureName String, Score double, Sample String, Footnote String, MeasureStartDate date, 
      MeasureEndDate date)
      ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
      STORED AS TEXTFILE
      LOCATION '/user/w205/maxshen/hospital_compare/care';
      LOAD DATA INPATH '/user/w205/maxshen/hive/effective_care.csv'
      OVERWRITE INTO TABLE effective_care;

      DROP TABLE IF EXISTS readmissions; 
      CREATE EXTERNAL TABLE readmissions (ProviderID int, HospitalName String, Address String, City String, State String, ZIP_Code   bigint, Country_Name 
      String,Phone_Number 
      bigint, Measure_Name  
      String, MeasureID String, Compare_to_National String, Denominator int, Score double, LowerEstimate double, HigherEstimate double, Footnote 
      String, 
      MeasureStartDate Date, MeasureEndDate Date)
      ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
      STORED AS TEXTFILE
      LOCATION '/user/w205/maxshen/hospital_compare/readmission';
      LOAD DATA INPATH '/user/w205/maxshen/hive/readmissions.csv'
      OVERWRITE INTO TABLE readmissions;



      DROP TABLE IF EXISTS surveys;
      CREATE EXTERNAL TABLE surveys(ProviderID int, HospitalName String, Address String, City String, State String, ZIP_Code  bigint, CountyName String, 
      CommunicationwithNursesAchievementPoints String, CommunicationwithNursesImprovementPoints String, CommunicationwithNursesDimensionScore String,
      CommunicationwithDoctorsAchievementPoints String, CommunicationwithDoctorsImprovementPoints String,
      CommunicationwithDoctorsDimensionScore String, ResponsivenessofHospitalStaffAchievementPoints String, 
      ResponsivenessofHospitalStaffImprovementPoints String,
      ResponsivenessofHospitalStaffDimensionScore String, PainManagementAchievementPoints String, PainManagementImprovementPoints String,
      PainManagementDimensionScore String, CommunicationaboutMedicinesAchievementPoints String, CommunicationaboutMedicinesImprovementPoints String,
      CommunicationaboutMedicinesDimensionScore String, CleanlinessandQuietnessofHospitalEnvironmentAchievementPoints String, 
      CleanlinessandQuietnessofHospitalEnvironmentImprovementPoints String, CleanlinessandQuietnessofHospitalEnvironmentDimensionScore String,
      DischargeInformationAchievementPoints String, DischargeInformationImprovementPoints String, DischargeInformationDimensionScore String,
      OverallRatingofHospitalAchievementPoints String, OverallRatingofHospitalImprovementPoints String, OverallRatingofHospitalDimensionScore String,
      HCAHPSBaseScore int, HCAHPSConsistencyScore int)
      ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
      STORED AS TEXTFILE
      LOCATION '/user/w205/maxshen/hospital_compare/survey';
	 
      LOAD DATA INPATH '/user/w205/maxshen/hive/surveys_responses.csv'
      OVERWRITE INTO TABLE surveys;
