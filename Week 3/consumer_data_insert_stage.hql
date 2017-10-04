set hive.exec.dynamic.partition=true;
set hive.exec.dynamic.partition.mode=nonstrict;

INSERT INTO TABLE consumer_complaint_stage
	PARTITION (t_year, t_month , t_day)
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
          year(from_unixtime(unix_timestamp(date_received,'mm/dd/yyyy'))) t_year,
          month(from_unixtime(unix_timestamp(date_received,'mm/dd/yyyy'))) t_month,
          day(from_unixtime(unix_timestamp(date_received,'mm/dd/yyyy'))) t_day
  FROM consumer_complaints
  WHERE state IS NOT NULL AND zipcode IS NOT NULL AND zipcode NOT LIKE '%X%';
