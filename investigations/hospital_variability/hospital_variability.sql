     SELECT HS.measureID, variance(HS.Score) AS procedure_variability, max(HS.Score) as   
     Max_Score, min(HS.Score) as Min_Score
      FROM  Hospital_Score AS HS
      WHERE Score <= 100
      GROUP BY HS.MeasureID
      ORDER BY procedure_variability DESC
      LIMIT 10;


