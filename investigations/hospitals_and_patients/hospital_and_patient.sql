      SELECT corr(avg_score, avg_achievepoint) AS corr_achieve, 
	     corr(avg_score, avg_improvepoint) AS corr_improve, 
             corr(avg_score, avg_dimscore) AS corr_dimscore 
      FROM   hospital_patient;