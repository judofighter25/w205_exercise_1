      SELECT HS.HospitalName, avg(HS.Score) AS Avg_Score, sum(HS.Score) AS Agg_Score
      FROM  Hospital_Score AS HS
      WHERE Score <= 100
      GROUP BY HS.ProviderID, HS.HospitalName
      ORDER BY Avg_Score DESC
      LIMIT 10;