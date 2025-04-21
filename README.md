Environment: Databricks with serverless compute for Notebooks and Serverless Starter Warehouse for SQL.

Volumes/Storage: DBFS file system provided by Databricks and created below volumes to process source files:
raw_xml - Uploaded all XML files 
csv_files - Uploaded both Claim csv files
unit_test - Created for unit testing with 2 XML files

Notebooks: 2 separate notebooks to ingest XML data and Claims data.
1.	clinical_data_parsing : This notebook reads XNML data from raw_xml volume and parse it using pyspark. There are 4 dataframes created
    a.	df - first dataframe with all XML data and file path where path has patientid and documented
    b.	df_patient – this dataframe has parsed patient data with patientid
    c.	df_medications – this dataframe has parsed medications data with patientid
    d.	df_problems – this dataframe has parsed problem list data with patientid
This notebook creates 3 tables each for Patient, Medications and ProblemList data. 

2.	load_claims_data : This notebook reads claims csv files from csv_files volume and creates 2 tables claims and rx each for one file.

combined_data_result.sql - SQL for combined data
combined_data_result.xlsx - Combined result
