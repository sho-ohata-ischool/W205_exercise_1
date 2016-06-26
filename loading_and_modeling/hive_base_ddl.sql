 hive

 CREATE EXTERNAL TABLE hospital
 (
 	Provider_ID string,
 	Hospital_Name string,
 	Address string,
 	City string,
 	State string,
 	Zip_Code INT,
 	County string,
 	Phone_Number BIGINT,
 	Hospital_Type string,
 	Hospital_Ownership string,
 	Emergency_Services string
 	) 
 ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' 
 WITH SERDEPROPERTIES (    
 	"separatorChar" = ",",    
 	"quoteChar"     = '"', 
   	"escapeChar"    = '\\' ) 
 STORED AS TEXTFILE LOCATION ‘/user/w205/hospital_compare/hospitals/hospital.csv’; 

 CREATE EXTERNAL TABLE effective_care 
 (
 	Provider_ID string,
 	Hospital_Name string,
 	Address string,
 	City string,
 	State string,
 	Zip_Code INT,
 	County string,
 	Phone_Number BIGINT,
 	Condition string,
 	Measure_ID string,
 	Measure_name string,
 	Score string,
 	Sample INT,
 	Footnote string,
 	Measure_start_date string,
 	Measure_end_date string
 	)
 ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' 
 WITH SERDEPROPERTIES (    
 	"separatorChar" = ",",    
 	"quoteChar"     = '"', 
   	"escapeChar"    = '\\' ) 
 STORED AS TEXTFILE LOCATION ‘/user/w205/hospital_compare/effective_care/effective_care.csv’; 

 CREATE EXTERNAL TABLE readmissions 
 (
 	Provider_ID string,
 	Hospital_Name string,
 	Address string,
 	City string,
 	State string,
 	Zip_Code INT,
 	County string,
 	Phone_Number BIGINT,
 	Measure_name string,
 	Measure_ID string,
 	Compared_to_national,
 	Denominator INT,
 	Score DECIMAL,
 	Lower_estimate DECIMAL,
 	Higher_estimate DECIMAL,
 	Footnote string,
 	Measure_start_date string,
 	Measure_end_date string
 	)
 ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' 
 WITH SERDEPROPERTIES (    
 	"separatorChar" = ",",    
 	"quoteChar"     = '"', 
   	"escapeChar"    = '\\' ) 
 STORED AS TEXTFILE LOCATION ‘/user/w205/hospital_compare/readmissions/readmissions.csv’; 

 CREATE EXTERNAL TABLE measures
 (
 	Measure_name string,
 	Measure_ID string,
 	Measure_start_quarter string,
 	Measure_start_date string,
 	Measure_end_quarter string,
 	Measure_end_date string
 	)
 ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' 
 WITH SERDEPROPERTIES (    
 	"separatorChar" = ",",    
 	"quoteChar"     = '"', 
   	"escapeChar"    = '\\' ) 
 STORED AS TEXTFILE LOCATION ‘/user/w205/hospital_compare/Measures/Measures.csv’; 

 CREATE EXTERNAL TABLE survey_responses
 (
 	Provider_ID string,
 	Hospital_Name string,
 	Address string,
 	City string,
 	State string,
 	Zip_Code INT,
 	County string,
 	Phone_Number BIGINT,
 	Comm_Nurses_Achieve_Pts string,
 	Comm_Nurses_Improv_Pts string,
 	Comm_Nurses_Dim_Score string,
 	Comm_Doctor_Achieve_Pts string,
 	Comm_Doctor_Improv_Pts string,
 	Comm_Doctor_Dim_Score string,
 	Respons_Staff_Achieve_Pts string,
 	Respons_Staff_Improv_Pts string,
 	Respons_Staff_Dim_Score string,
 	Pain_Mgmt_Achieve_Pts string,
 	Pain_Mgmt_Improv_Pts string,
 	Pain_Mgmt_Dim_Score string,
 	Comm_abt_Meds_Achieve_Pts string,
 	Comm_abt_Meds_Improv_Pts string,
 	Comm_abt_Meds_Dim_Score string,
 	Clean_Quiet_Hosp_Achieve_Pts string,
 	Clean_Quiet_Hosp_Improv_Pts string,
 	Clean_Quiet_Hosp_Dim_Score string,
 	Discharge_Info_Achieve_Pts string,
 	Discharge_Info_Improv_Pts string,
 	Discharge_Info_Dim_Score string,
 	Overall_Rate_Hosp_Achieve_Pts string,	
 	Overall_Rate_Hosp_Improv_Pts string,
 	Overall_Rate_Hosp_Dim_Score string,
 	HCAHPS_Base_Score string,
 	HCAHPS_Consistency_Score string,
)
 ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' 
 WITH SERDEPROPERTIES (    
 	"separatorChar" = ",",    
 	"quoteChar"     = '"', 
   	"escapeChar"    = '\\' ) 
 STORED AS TEXTFILE LOCATION ‘/user/w205/hospital_compare/survey_responses/survey_responses.csv’; 
