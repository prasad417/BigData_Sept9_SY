# Week 2 Instructions

* Create a HDFS folder /user/ubuntu/employee
* Ingest attached employee.txt into that folder
* Create an external table with the following DDL

```
  CREATE EXTERNAL TABLE IF NOT EXISTS employee
(  	name         STRING,
	salary       FLOAT,
	subordinates ARRAY<STRING>,
	deductions   MAP<STRING, FLOAT>,
        address      STRUCT<street:STRING, city:STRING, state:STRING, zip:INT>
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\001'
COLLECTION ITEMS TERMINATED BY '\002'
MAP KEYS TERMINATED BY '\003'
LINES TERMINATED BY '\n' STORED AS TEXTFILE
LOCATION '/user/ubuntu/employee';
```
* Query the employee table with following queries and show the results in hive_query_results.txt and commit it to Week2 folder
```
SELECT name FROM employee WHERE deductions['Federal Taxes'] > 0.2;   
SELECT name FROM employee WHERE subordinates[1] = 'Todd Jones';  
SELECT name FROM employee WHERE size(subordinates) > 0;  
SELECT name FROM employee WHERE address.zip = 60050;       
SELECT e.name, e.subordinates[0] FROM employee e;  
SELECT e.name, e.subordinates FROM employee e WHERE size(e.subordinates) > 0;  
SELECT e.name, e.deductions['Federal Taxes'] FROM employee e;  
SELECT e.name, e.address FROM employee e WHERE e.address.city = 'Chicago';  
SELECT e.name, e.address FROM employee e WHERE e.address.city LIKE 'C%';
```
* Streatch Goal Homework - Download and ingest City of Sanfrancisco Data by clicking the link below
https://catalog.data.gov/dataset/air-traffic-passenger-statistics/resource/dd9615f7-0ab5-4da6-814f-393e280d3045
* Create a Hive table to query this data. Store teh DDL in SFO_AirTraffic.hql Week2 folder
* Query Top 10 records by passenger count and store them under SFO_Top10.txt under Week2 folder
