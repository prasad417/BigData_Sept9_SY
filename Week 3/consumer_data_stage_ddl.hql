set hive.exec.dynamic.partition=true;
set hive.exec.dynamic.partition.mode=nonstrict;

DROP TABLE IF EXISTS consumer_complaint_stage;

CREATE EXTERNAL TABLE consumer_complaint_stage
( Product STRING,
  Sub_product STRING,
  Issue STRING,
  Sub_issue STRING,
  Company STRING,
  State STRING,
  Zipcode STRING,
  Submitted_via STRING,
  Date_sent_to_company STRING,
  Timely_response STRING,
  Consumer_disputed STRING,
  Complaint_ID INT
)
PARTITIONED BY  (t_year INT, t_month INT, t_day INT)
STORED AS ORC
LOCATION '/data/stage/consumer_data_stage';
