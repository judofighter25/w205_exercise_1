      
      DROP TABLE IF EXISTS Hospital_Score;
      CREATE TABLE Hospital_Score
      row format
      delimited fields terminated by ',' 
      STORED AS RCFile AS
      SELECT cast(E.ProviderID AS INT), E.HospitalName, E.State, E.MeasureID, cast(E.Score AS INT)
      FROM effective_care as E
      WHERE length(E.Score) < 4;
      
      DROP TABLE IF EXISTS Avg_Hospital_Score;
      CREATE TABLE Avg_Hospital_Score
      row format
      delimited fields terminated by ',' 
      STORED AS RCFile AS
      SELECT CAST(HS.providerID AS INT) AS ProviderID, HS.state, HS.HospitalName, avg(HS.Score) AS Avg_Score
      FROM  Hospital_Score AS HS
      WHERE Score <= 100
      GROUP BY HS.providerID, HS.HospitalName, HS.State;


      DROP TABLE IF EXISTS Avg_Survey_Score;
      CREATE TABLE Avg_Survey_Score
      row format
      delimited fields terminated by ',' 
      STORED AS RCFile AS 
      SELECT cast(ProviderID AS INT) AS ProviderID, HospitalName,
	     avg(cast(substr(OverallRatingofHospitalAchievementPoints, 0, 1) AS INT)) AS Avg_AchievePoint,
             avg(cast(substr(OverallRatingofHospitalImprovementPoints, 0, 1) AS INT)) AS Avg_ImprovePoint,
             avg(cast(substr(OverallRatingofHospitalDimensionScore, 0, 1) AS INT)) AS Avg_DimScore
      FROM surveys
      GROUP BY ProviderID, HospitalName;


      DROP TABLE IF EXISTS hospital_patient;
      CREATE TABLE hospital_patient
      row format
      delimited fields terminated by ',' 
      STORED AS RCFile AS
      SELECT A.HospitalName, A.Avg_Score, B.Avg_AchievePoint, B.Avg_ImprovePoint, B.Avg_DimScore 
      from avg_hospital_score AS A 
      INNER JOIN avg_survey_score AS B on A.ProviderID = B.ProviderID;



       
    