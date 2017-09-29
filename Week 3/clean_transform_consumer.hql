CREATE EXTERNAL TABLE IF NOT EXISTS consumer_complaints
( Date_received DATE,
  Product STRING,
  Sub_product STRING,
  Issue STRING,
  Sub_issue STRING,
  Consumer_complaint_narrative STRING,
  Company_public_response STRING,
  Company STRING,
  State STRING,
  Zipcode STRING,
  Tags STRING,
  Consumer_consent_provided STRING,
  Submitted_via STRING,
  Date_sent_to_company DATE,
  Company_response_to_consumer STRING,
  Timely_response STRING,
  Consumer_disputed STRING,
  Complaint_ID INT
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
LOCATION '/data/raw/consumer_data_raw';
AS
SELECT date_received, product, sub_product, issue, sub_issue, company, state, zipcode,
       submitted_via, date_sent_to_company, timely_response, consumer_disputed, complaint_id
  FROM consumer_complaints
  WHERE state IS NOT NULL AND zipcode IS NOT NULL AND zipcode NOT LIKE '%XX%';
