      SELECT State, avg(avg_Score) AS Avg_Hospital_Score_State_Level
      FROM  Avg_Hospital_Score
      GROUP BY State
      ORDER BY Avg_Hospital_Score_State_Level DESC
      LIMIT 10;