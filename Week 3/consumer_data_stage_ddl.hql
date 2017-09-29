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
  Complaint_ID INT,
)
PARTITIONED BY (year INT, month INT, day INT)
STORED AS ORC
LOCATION '/data/stage/consumer_data_stage';

INSERT INTO TABLE consumer_complaint_stage
	PARTITION (year, month , day)
  SELECT  product,
          sub_product,
          issue,
          sub_issue,
          company,
          state,
          zipcode,
          submitted_via,
          date_sent_to_company,
          timely_response,
          consumer_disputed,
          complaint_id,
          month(date_received) month,
          day(date_received) day,
          year(date_received) year
  FROM consumer_complaints
  WHERE state IS NOT NULL AND zipcode IS NOT NULL AND zipcode NOT LIKE '%XX%';
