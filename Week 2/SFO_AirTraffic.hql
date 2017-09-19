CREATE EXTERNAL TABLE IF NOT EXISTS sfo_airtraffic
(  	Activity_Period             INT,
    Operating_Airline           STRING,
    Operating_Airline_IATA      STRING,
    Published_Airline           STRING,
    Published_Airline_IATA_Code STRING,
    GEO_Summary                 STRING,
    GEO_Region                  STRING,
    Activity_Type_Code          STRING,
    Price_Category_Code         STRING,
    Terminal                    STRING,
    Boarding_Area               STRING,
    Passenger_Count             INT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LOCATION '/user/ubuntu/sfo_airtraffic';
