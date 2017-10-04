INSERT INTO TABLE consumer_complaint_pub
  SELECT state, count(*) total_debt_complaints
  FROM consumer_complaint_stage
  WHERE product='Debt collection'
  GROUP BY state
  ORDER BY total_debt_complaints
  DESC LIMIT 20;
