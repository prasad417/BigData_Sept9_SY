# Week 3 Instructions

* Data Ingestion
* Create the following folders in your HDFS 
    * /data/raw/consumer_data_raw
    * /data/stage/consumer_data_stage
    * /data/pub/consumer_data_pub
    * list this HDFS directory structure and upload to github under /Week3/hdfs_folders.txt
* Download the following csv file (300 MB file)
    * https://catalog.data.gov/dataset/consumer-complaint-database/resource/2f297213-7198-4be1-af1e-2d2623e7f6e9
    * and land it in ``/data/raw/consumer_data_raw``
* Cleanse and transform (Hint use Hive functions https://cwiki.apache.org/confluence/display/Hive/LanguageManual+UDF#LanguageManualUDF-StringFunctions)
    * Create a select query that will ``not`` select any record that does not have a state or zip code
    * (and) ``not`` select any record that that has zip code that ends with XX
    * select only the following columns
        ``Date received,	Product,	Sub-product,	Issue,	Sub-issue, Company,	State,	ZIP code,	Submitted via,	Date sent to company,Timely response?,	Consumer disputed?,	Complaint ID``
     * upload this query into /Week3/clean_transform_consumer.hql 
* Store the selected data partitioned by year, month and day of the ``Day received`` field
    * Store the data in ORC format
    * Store it in /data/stage/consumer_data_stage/
    * upload hive table and query into /Week3/consumer_data_stage_ddl.hql and /Week3/consumer_data_insert_stage.hql
*  From the stage data select top 20 States that have most Debt collection compliants by state.
    * Store the data in PARQUET format
    * Store it in /data/pub/consumer_data_pub/
    * upload hive table and query into /Week3/consumer_data_pub_ddl.hql and /Week3/consumer_data_insert_pub.hql

    
