      SELECT HS.HospitalName, avg(HS.Score) AS Avg_Score, sum(HS.Score) AS Agg_Score
      FROM  Hospital_Score AS HS
      WHERE Score <= 100
      GROUP BY HS.ProviderID, HS.HospitalName
      ORDER BY Avg_Score DESC
      LIMIT 10;


      SELECT State, avg(avg_Score) AS Avg_Hospital_Score_State_Level
      FROM  Avg_Hospital_Score
      GROUP BY State
      ORDER BY Avg_Hospital_Score_State_Level DESC
      LIMIT 10;
      

      SELECT HS.measureID, variance(HS.Score) AS procedure_variability, max(HS.Score) as Max_Score, min(HS.Score) as Min_Score
      FROM  Hospital_Score AS HS
      WHERE Score <= 100
      GROUP BY HS.MeasureID
      ORDER BY procedure_variability DESC
      LIMIT 10;

      
      SELECT corr(avg_score, avg_achievepoint) AS corr_achieve, 
	     corr(avg_score, avg_improvepoint) AS corr_improve, 
             corr(avg_score, avg_dimscore) AS corr_dimscore 
      FROM   hospital_patient;

